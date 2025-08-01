// features/achievements/header/header_section.dart
import 'package:brainup/presentation/pages/archievement/widget/provider_header/bloc/header_arch_bloc.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_header/bloc/header_arch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeaderArchBloc, HeaderArchState>(
      builder: (context, state) {
        if (state is HeaderArchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HeaderArchLoaded) {
          final user = state.userModelArch;

          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              // borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user.avatarUrl),
                ),
                const SizedBox(height: 8),
                Text(
                  user.name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  user.title,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStat("Total Points", user.totalPoints),
                    _buildStat("Courses", user.course),
                    _buildStat("Achievement", user.achivement),
                  ],
                )
              ],
            ),
          );
        } else if (state is HeaderArchError) {
          return Center(child: Text(state.messing));
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildStat(String label, int value) {
    return Column(
      children: [
        Text("$value",
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
