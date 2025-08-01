import 'package:brainup/presentation/pages/videos_lecture/video_lecture_page.dart'
    as rootLocation;
import 'package:brainup/presentation/pages/videos_lecture/video_lecture_page.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/bloc/study_material_bloc.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/bloc/study_material_state.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/model/study_model.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/subject_infor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StudyMaterialsSection extends StatelessWidget {
  final SubjectInfo info;

  const StudyMaterialsSection({super.key, required this.info});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudyMaterialBloc, StudyMaterialState>(
      builder: (context, state) {
        if (state is StudyMaterialUpdated) {
          final items = state.materials;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Study Materials',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  childAspectRatio: 2,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: items
                      .map((item) => _StudyMaterialCard(
                            item: item,
                            info: info,
                            // subject: subject,
                            // grade: grade,
                          ))
                      .toList(),
                ),
              ],
            ),
          );
        }
        return SizedBox.shrink(); // fallback nếu chưa có dữ liệu
      },
    );
  }
}

class _StudyMaterialCard extends StatelessWidget {
  final StudyMaterial item;
  // final String subject;
  // final String grade;
  final SubjectInfo info;
  const _StudyMaterialCard(
      {required this.item,
      // required this.subject,
      // required this.grade,
      required this.info});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (item.title) {
          case 'Notes':
            // context.go('/notes');
            break;
          case 'Videos':
            context.push(
              VideosLecturePage.rootLocation,
              extra: info,
            );

            break;
          case 'Quizzes':
            //  context.go('/quizzes');
            break;
          case 'Labs':
            //context.go('/labs');
            break;
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 2)
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: item.iconBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(item.icon, color: item.iconColor, size: 25),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  SizedBox(height: 4),
                  Text(item.subtitle,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
