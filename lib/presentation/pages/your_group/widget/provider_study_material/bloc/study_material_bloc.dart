import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/bloc/study_material_event.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/bloc/study_material_state.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/model/study_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudyMaterialBloc extends Bloc<StudyMaterialEvent, StudyMaterialState> {
  StudyMaterialBloc() : super(StudyMaterialInitial()) {
    on<LoadStudyMaterials>(_onLoad);
    on<UpdateStudyMaterials>(_onUpdate);
  }

  void _onLoad(LoadStudyMaterials event, Emitter<StudyMaterialState> emit) {
    final defaultMaterials = [
      StudyMaterial(
        icon: Icons.description,
        iconColor: Colors.blue,
        iconBg: Color(0xFFE8F0FF),
        title: 'Notes',
        subtitle: '12 documents',
      ),
      StudyMaterial(
        icon: Icons.play_circle_fill,
        iconColor: Colors.green,
        iconBg: Color(0xFFE8FFF0),
        title: 'Videos',
        subtitle: '8 lessons',
      ),
      StudyMaterial(
        icon: Icons.help_outline,
        iconColor: Colors.purple,
        iconBg: Color(0xFFF1E8FF),
        title: 'Quizzes',
        subtitle: '15 available',
      ),
      StudyMaterial(
        icon: Icons.science,
        iconColor: Colors.orange,
        iconBg: Color(0xFFFFF3E8),
        title: 'Labs',
        subtitle: '5 experiments',
      ),
    ];

    emit(StudyMaterialUpdated(defaultMaterials));
  }

  void _onUpdate(UpdateStudyMaterials event, Emitter<StudyMaterialState> emit) {
    emit(StudyMaterialUpdated(event.updatedList));
  }
}
