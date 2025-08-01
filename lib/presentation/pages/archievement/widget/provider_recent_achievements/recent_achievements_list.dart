import 'package:brainup/presentation/pages/archievement/widget/provider_recent_achievements/bloc/recent_achievements_bloc.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_recent_achievements/bloc/recent_achievements_state.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_recent_achievements/model/achievement_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentAchievementsList extends StatelessWidget {
  const RecentAchievementsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentAchievementsBloc, RecentAchievementsState>(
      builder: (context, state) {
        if (state is AchievementsLoading) {
          return const CircularProgressIndicator();
        } else if (state is AchievementsLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Recent Achievements",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ...state.achievements.map((item) => _buildCard(item)).toList()
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildCard(AchievementModel achievement) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: achievement.backgroundColor,
            child: Icon(achievement.icon, size: 18, color: Colors.black87),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(achievement.title,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(achievement.description,
                    style:
                        const TextStyle(color: Colors.black54, fontSize: 12)),
                Text(achievement.timeAgo,
                    style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
          Text(
            "+${achievement.points} pts",
            style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 13),
          )
        ],
      ),
    );
  }
}
