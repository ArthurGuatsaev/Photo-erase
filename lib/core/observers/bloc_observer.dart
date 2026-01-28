// core/bloc/error_bloc_observer.dart
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../const/system_untils.dart';

@singleton
class ErrorBlocObserver extends BlocObserver {
  // final ErrorLogger _errorLogger;

  // ErrorBlocObserver(this._errorLogger);

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    _log('Bloc created: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _log('Event: ${event.runtimeType} in ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _log(
      'State changed in ${bloc.runtimeType}: '
      '${change.currentState.runtimeType} -> ${change.nextState.runtimeType}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // НЕ логируем user-friendly ошибки
    // if (error is! UserFriendlyError) {
    //   _errorLogger.logError(
    //     error,
    //     stackTrace,
    //     context: 'bloc_${bloc.runtimeType}',
    //     fatal: error is CriticalError,
    //   );
    // }

    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    _log('Bloc closed: ${bloc.runtimeType}');
  }

  void _log(String message) {
    if (kDebugMode) {
      print('[BlocObserver] $message');
    }
  }
}

extension OnErroring on Bloc {
  handleError(Object error, Object stTr) {
    dprint(error.toString());
  }
}
