import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:erasica/core/const/const.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  static const String _signingSecret = 'erasica';

  @lazySingleton
  Dio dio() {
    final client = Dio(
      BaseOptions(
        baseUrl: AppConst.apiEndpoint,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        followRedirects: true,
        maxRedirects: 5,
        validateStatus: (statusCode) =>
            statusCode != null && statusCode >= 200 && statusCode < 400,
      ),
    );

    final apiHost = Uri.parse(AppConst.apiEndpoint).host;

    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          final requestUri = requestOptions.uri;
          final requestPath = requestUri.path.isEmpty ? '/' : requestUri.path;

          final isDocsEndpoint =
              requestPath.startsWith('/docs') || requestPath == '/openapi.json';

          final isApiHostRequest = requestUri.host == apiHost;

          if (!isDocsEndpoint && isApiHostRequest) {
            final timestampSecondsUtc = _unixEpochSecondsUtc();
            final httpMethodUppercase = requestOptions.method.toUpperCase();

            // Каноническая строка ДОЛЖНА совпадать с сервером:
            // <ts>\n<method>\n<path>\n<canonical_query>
            final canonicalQueryString = _buildCanonicalQueryString(requestUri);
            final canonicalString = [
              timestampSecondsUtc,
              httpMethodUppercase,
              requestPath,
              canonicalQueryString,
            ].join('\n');

            final signatureHexLowercase = _calculateHmacSha256Hex(
              secret: _signingSecret,
              message: canonicalString,
            );

            requestOptions.headers['X-TS'] = timestampSecondsUtc;
            requestOptions.headers['X-Sig'] = signatureHexLowercase;
          }

          handler.next(requestOptions);
        },
      ),
    );

    return client;
  }

  static String _unixEpochSecondsUtc() {
    return (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
  }

  static String _buildCanonicalQueryString(Uri requestUri) {
    if (!requestUri.hasQuery) return '';

    // Важно: подпись считается НЕ по "как пришло", а по детерминированной строке.
    // Требования сервера:
    // 1) разобрать query в декодированные пары (key, value), включая дубли ключей
    // 2) отсортировать по key, затем по value
    // 3) заново закодировать percent-encoding (пробел именно %20, не '+')
    final decodedPairs = <MapEntry<String, String>>[];

    final allQueryParameters = requestUri.queryParametersAll;
    for (final parameterEntry in allQueryParameters.entries) {
      final parameterName = parameterEntry.key;
      final parameterValues = parameterEntry.value;

      if (parameterValues.isEmpty) {
        decodedPairs.add(MapEntry(parameterName, ''));
        continue;
      }

      for (final parameterValue in parameterValues) {
        decodedPairs.add(MapEntry(parameterName, parameterValue));
      }
    }

    decodedPairs.sort((leftPair, rightPair) {
      final keyComparison = leftPair.key.compareTo(rightPair.key);
      if (keyComparison != 0) return keyComparison;
      return leftPair.value.compareTo(rightPair.value);
    });

    String encodeComponent(String value) => Uri.encodeQueryComponent(value);

    return decodedPairs
        .map(
          (pair) =>
              '${encodeComponent(pair.key)}=${encodeComponent(pair.value)}',
        )
        .join('&');
  }

  static String _calculateHmacSha256Hex({
    required String secret,
    required String message,
  }) {
    // HMAC-SHA256, результат в hex (lower-case) — как на сервере (hexdigest()).
    final secretBytes = utf8.encode(secret);
    final messageBytes = utf8.encode(message);
    final digest = Hmac(sha256, secretBytes).convert(messageBytes);
    return digest.toString();
  }
}
