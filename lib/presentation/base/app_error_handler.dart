import 'package:brainup/data/repository/source/remote/api/error/api_error.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';

mixin AppErrorHandler {
  void handleAppError({
    required BuildContext context,
    required Object exception,
  }) {
    if (exception is ApiError) {
      _handleApiError(context, exception);
    } else {
      "unexpectedErrorMessage";
    }
  }

  void _handleApiError(BuildContext context, ApiError exception) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          'An unexpected error occurred!',
          style: BrainUpTextStyles.text14Bold.copyWith(color: Colors.black),
        ),
        content: Text(
          "Please check your network connection, re-select an image that is not too large in size, prompt or try again later.",
          style: BrainUpTextStyles.text13Normal.copyWith(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'OK',
              style: BrainUpTextStyles.text14Bold
                  .copyWith(color: AppColors.cornflowerBlue),
            ),
          ),
        ],
      ),
    );

    switch (exception) {
      case HttpError():
        break;
      case ServerError():
        break;
      case NetworkError():
        break;
      default:
        break;
    }
  }
}
