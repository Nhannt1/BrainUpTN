import 'package:brainup/presentation/pages/your_group/widget/provider_group_activity/bloc/group_activity_bloc.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_activity/bloc/group_activity_state.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_activity/model_activity/model_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentActivitySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentActivityBloc, RecentActivityState>(
      builder: (context, state) {
        if (state is RecentActivityLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RecentActivityLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Activity',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ...state.activities
                    .map((activity) => _ActivityItem(activity: activity))
                    .toList(),
              ],
            ),
          );
        } else if (state is RecentActivityError) {
          return Text("Error: ${state.message}");
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final Activity activity;

  const _ActivityItem({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white54,
              shape: BoxShape.circle,
            ),
            child: Icon(activity.icon, size: 20, color: Colors.amberAccent),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                    children: [
                      TextSpan(
                        text: activity.userName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' ${activity.action}'),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${activity.timeAgo} day ago",
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
