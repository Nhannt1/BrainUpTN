import 'package:brainup/presentation/base/app_error_handler.dart';
import 'package:brainup/presentation/base/page_state.dart';
import 'package:brainup/presentation/base/view_model_ext.dart';
import 'package:brainup/presentation/resources/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

  typedef ViewModelProvider = AutoDisposeNotifierProvider<AutoDisposeNotifier<PageState>, PageState>;

  class PageBuilder<T> extends ConsumerStatefulWidget {
    const PageBuilder({
      super.key,
      required this.viewModelProvider,
      required this.child,
      this.onPageReady,
      this.showLoading = true,
      this.onError,
    });

    final ViewModelProvider viewModelProvider;
    final Widget child;
    final bool showLoading;
    final VoidCallback? onPageReady;
    final Function(Object)? onError;

    @override
    ConsumerState<ConsumerStatefulWidget> createState() => _PageBuilderState();
  }

  class _PageBuilderState extends ConsumerState<PageBuilder> with AppErrorHandler {
    @override
    void initState() {
      super.initState();
      observeError();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onPageReady?.call();
      });
    }

    @override
    Widget build(BuildContext context) {
      return Stack(
        children: [
          widget.child,
          _buildLoading(),
        ],
      );
    }

    Widget _buildLoading() {
      return Consumer(
        builder: (context, ref, child) {
          final isLoading = ref.watch(widget.viewModelProvider.selectLoading());
          return Visibility(
            visible: isLoading,
            child: Container(
              color: Colors.black54,
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: SizedBox(
                    width: 140.w,
                    height: 140.w,
                    child: Lottie.asset(
                      Assets.lotties.loading,
                      repeat: true,
                      fit: BoxFit.cover,
                      frameRate: FrameRate.max,
                    )),
              ),
            ),
          );
        },
      );
    }

    void observeError() {
      ref.listenManual(widget.viewModelProvider.selectException(), (previous, next) {
        if (next != null) handleAppError(context: context, exception: next);
      });
    }
  }
