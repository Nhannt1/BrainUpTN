import 'package:brainup/presentation/pages/archievement/widget/provider_progress/bloc/progess_bloc.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_progress/bloc/progress_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearningProgressCard extends StatelessWidget {
  const LearningProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressBloc, ProgressState>(
      builder: (context, state) {
        if (state is ProgressLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProgressLoaded) {
          final data = state.progress;
          final percent = (data.completionPercent * 100).round();

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 8)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Learning Progress",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Overall Completion",
                        style: TextStyle(color: Colors.grey)),
                    Text("$percent%",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Stack(
                          children: [
                            Container(
                              width:
                                  constraints.maxWidth * data.completionPercent,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF6A5AE0),
                                    Color(0xFFBA68C8)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildProgressBox("Completed", data.completedCourses,
                        Colors.green.shade600, const Color(0xFFE6F9ED)),
                    const SizedBox(width: 8),
                    _buildProgressBox("In Progress", data.inProgressCourses,
                        Colors.deepPurple, const Color(0xFFE6E9FC)),
                  ],
                )
              ],
            ),
          );
        } else if (state is ProgressError) {
          return Text(state.message);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildProgressBox(
      String label, int value, Color textColor, Color bgColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              "$value",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
            ),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
