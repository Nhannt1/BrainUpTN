import 'package:brainup/presentation/pages/archievement/widget/provider_header/bloc/header_arch_event.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_header/bloc/header_arch_state.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_header/model/model_header_arch.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_header/repository/repository_achivement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderArchBloc extends Bloc<HeaderArchEvent, HeaderArchState> {
  final RepositoryAchivement repository;
  HeaderArchBloc(this.repository) : super(HeaderArchInit()) {
    on<LoadUserData>(_onLoadUserData);
  }
  void _onLoadUserData(
      LoadUserData event, Emitter<HeaderArchState> emit) async {
    emit(HeaderArchLoading());
    await Future.delayed(const Duration(seconds: 1)); // giả lập API

    try {
      final profile = await repository.fetchUserProfile(event.uid);
      emit(HeaderArchLoaded(userModelArch: profile));
    } catch (e) {
      emit(HeaderArchError(messing: "Failed to load user"));
    }
  }
}
