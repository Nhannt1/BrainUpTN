import 'package:brainup/presentation/pages/archievement/widget/provider_progress/model/progress_model.dart';

abstract class ProgressState {}

class ProgressInitial extends ProgressState {}

class ProgressLoading extends ProgressState {}

class ProgressLoaded extends ProgressState {
  final ProgressModel progress;

  ProgressLoaded(this.progress);
}

class ProgressError extends ProgressState {
  final String message;

  ProgressError(this.message);
}
