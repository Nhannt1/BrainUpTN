import 'package:brainup/presentation/pages/your_group/widget/provider_group_state/bloc/group_state_bloc.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_state/bloc/group_state_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class GroupStats extends StatelessWidget {
  const GroupStats({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupStatsBloc, GroupStatsState>(
      builder: (context, state) {
        if (state is GroupStatsLoading) {
          return Center(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(3, (_) => _buildShimmerCard()),
              ),
            ),
          );
        } else if (state is GroupStatsLoaded) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _StatCard(
                  icon: Icons.groups,
                  label: 'Members',
                  value: state.stats.members.toString(),
                  backgroundColor: Color(0xFFF1F5FF),
                  iconColor: Color(0xFF6366F1),
                ),
                _StatCard(
                  icon: Icons.check_circle,
                  label: 'Completed',
                  value: state.stats.completed.toString(),
                  backgroundColor: Color(0xFFE8F9F0),
                  iconColor: Color(0xFF10B981),
                ),
                _StatCard(
                  icon: Icons.emoji_events,
                  label: 'Avg Score',
                  value: "${state.stats.avgScore.toString()}%",
                  backgroundColor: Color(0xFFF6F1FF),
                  iconColor: Color(0xFF8B5CF6),
                ),
              ],
            ),
          );
        } else if (state is GroupStatsError) {
          return Text('Error: ${state.message}');
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color backgroundColor;
  final Color iconColor;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 24),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildShimmerCard() {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 60,
              height: 14,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 4),
            Container(
              width: 40,
              height: 18,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    ),
  );
}
