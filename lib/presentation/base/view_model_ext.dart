import 'package:brainup/presentation/base/page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ViewModelExt<T> on AutoDisposeNotifierProvider<AutoDisposeNotifier<PageState<T>>, PageState<T>> {
  ProviderListenable<bool> selectLoading() {
    return select((value) => value.isLoading);
  }

  ProviderListenable<Selected> selectUiState<Selected>(
    Selected Function(T uiState) selector,
  ) {
    return select((value) => selector(value.uiState));
  }

  ProviderListenable<Object?> selectException() {
    return select((value) => value.exception);
  }
}
