import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erasica/services/erase/erase_service.dart';
import 'package:injectable/injectable.dart';

import '../../../../../services/erase/model/web_bg.dart';

part 'web_bg_state.dart';

@injectable
class WebBgCubit extends Cubit<WebBgState> {
  WebBgCubit(this._eraseService) : super(const WebBgState()) {
    init();
  }

  final EraseService _eraseService;

  Timer? _debounceTimer;
  static const Duration _debounceDuration = Duration(milliseconds: 600);
  String _currentQuery = '';

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    try {
      final images = await _eraseService.getBgImages('');
      emit(state.copyWith(defaultWebImages: images, searchWebImages: images));
    } catch (_) {}
    emit(state.copyWith(isLoading: false));
  }

  void pressSearchText(String value) {
    final query = value.trim();
    _currentQuery = query;
    _debounceTimer?.cancel();
    if (query.isEmpty) return emptyEmit();
    _debounceTimer = Timer(_debounceDuration, () async {
      await getBgImages(search: query);
    });
  }

  Future<void> getBgImages({String search = ''}) async {
    final query = search.trim();
    if (query != _currentQuery) return;
    if (query.isEmpty) return emptyEmit();
    emit(state.copyWith(isLoading: true));
    try {
      defaultEmit();
      final images = await _eraseService.getBgImages(query);
      if (query != _currentQuery) return;
      emit(state.copyWith(searchWebImages: images));
    } catch (_) {}

    if (query == _currentQuery) {
      emit(state.copyWith(isLoading: false));
    }
  }

  void emptyEmit() {
    emit(
      state.copyWith(isLoading: false, searchWebImages: state.defaultWebImages),
    );
  }

  void defaultEmit() => emit(
    state.copyWith(
      defaultWebImages: state.defaultWebImages,
      searchWebImages: state.defaultWebImages,
    ),
  );

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
