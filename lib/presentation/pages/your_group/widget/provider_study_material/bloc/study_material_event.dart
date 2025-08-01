import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/model/study_model.dart';

abstract class StudyMaterialEvent {}

class LoadStudyMaterials extends StudyMaterialEvent {}

class UpdateStudyMaterials extends StudyMaterialEvent {
  final List<StudyMaterial> updatedList;

  UpdateStudyMaterials(this.updatedList);
}
