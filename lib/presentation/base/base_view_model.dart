import 'dart:async';

import 'package:brainup/presentation/base/page_state.dart';
import 'package:brainup/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

mixin BaseViewModel<T> on AutoDisposeNotifier<PageState<T>> {
  int _loadingCount = 0;
  bool _isRefreshing = false;
  GoRouter get navigator => ref.read(appRouterProvider);

  void init(FutureOr<void> Function() operation) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      operation.call();
    });
  }

  T get uiState => state.uiState;

  void emitUiState(T uiState) {
    state = state.copyWith(uiState: uiState);
  }

  void emitError(Object error) {
    state = state.copyWith(exception: error);
  }

  void showLoading() {
    if (_loadingCount == 0 && !_isRefreshing) {
      state = state.copyWith(isLoading: true);
    }
    _loadingCount++;
  }

  void hideLoading() {
    _loadingCount--;
    if (_loadingCount == 0) {
      state = state.copyWith(isLoading: false);
    }
  }

  @mustCallSuper
  Future<void> onRefresh() async {
    _isRefreshing = true;
  }

  Future<void> runCatching({
    required FutureOr<void> Function() action,
    bool handleLoading = true,
    bool handleError = true,
    VoidCallback? doOnLoading,
    Function(Object)? doOnError,
  }) async {
    try {
      if (handleLoading) {
        showLoading();
      }
      doOnLoading?.call();
      await action();
    } on Object catch (e) {
      if (handleError) {
        emitError(e);
      }
      doOnError?.call(e);
    } finally {
      if (handleLoading) {
        hideLoading();
      }
    }
  }
}
