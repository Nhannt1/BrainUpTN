import 'package:brainup/presentation/pages/your_group/widget/provider_group_header/bloc/group_lesson_bloc.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_header/bloc/group_lesson_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
      builder: (context, state) {
        if (state is LessonLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is LessonLoaded && state.lessons.isNotEmpty) {
          return Column(
            children: state.lessons.map((data) {
              return Container(
                margin:
                    EdgeInsets.only(bottom: 16), // cách nhau giữa các lesson
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [state.colorStart, state.colorEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.eco_rounded, color: Colors.white),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.subjectName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Grade ${data.grade}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.only(top: 12, bottom: 12, left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Topic',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            data.topic,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        }

        if (state is LessonError) {
          return Center(child: Text('Lỗi: ${state.message}'));
        }

        return SizedBox(); // fallback nếu rỗng
      },
    );
  }
}
