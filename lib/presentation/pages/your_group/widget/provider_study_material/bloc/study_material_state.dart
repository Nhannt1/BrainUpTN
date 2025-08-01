import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/model/study_model.dart';

abstract class StudyMaterialState {}

class StudyMaterialInitial extends StudyMaterialState {}

class StudyMaterialUpdated extends StudyMaterialState {
  final List<StudyMaterial> materials;
  StudyMaterialUpdated(this.materials);
}
