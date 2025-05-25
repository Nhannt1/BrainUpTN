import 'package:brainup/domain/repository/image_inference_repository.dart';
import 'package:brainup/presentation/base/base_view_model.dart';
import 'package:brainup/presentation/base/page_state.dart';
import 'package:brainup/presentation/pages/genrate_gallery_saver/generate_gallery_saver_state.dart';
import 'package:brainup/shared/utils/locator_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generate_gallery_saver_view_model.g.dart';

@riverpod
class GenerateGallerySaverViewModel extends _$GenerateGallerySaverViewModel with BaseViewModel {
  late final ImageInferenceRepository _imageInferenceRepository;

  @override
  PageState<GenerateGallerySaverState> build() {
    init(() {
      getImageInferencesByDate();
    });
    _imageInferenceRepository = ref.watch(locatorProvider<ImageInferenceRepository>());
    return PageState.initial(GenerateGallerySaverState());
  }

  Future<void> getImageInferencesByDate() async {
    runCatching(
      action: () async {
        final value = await _imageInferenceRepository.getImageInferencesByDate();
        emitUiState(uiState.copyWith(datas: value));
      },
      doOnError: (p0) {},
    );
  }
}
