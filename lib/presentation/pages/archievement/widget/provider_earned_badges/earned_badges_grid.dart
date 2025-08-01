import 'package:brainup/presentation/pages/archievement/widget/provider_earned_badges/bloc/earned_badges_bloc.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_earned_badges/bloc/earned_badges_state.dart';
import 'package:brainup/presentation/pages/archievement/widget/provider_earned_badges/model/badge_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EarnedBadgesGrid extends StatelessWidget {
  const EarnedBadgesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EarnedBadgesBloc, EarnedBadgesState>(
      builder: (context, state) {
        if (state is BadgesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BadgesLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Earned Badges",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: state.badges.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final badge = state.badges[index];
                    return _buildBadgeCard(badge);
                  },
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildBadgeCard(BadgeModel badge) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: badge.gradientColors,
              ),
            ),
            child: Center(
              child: Icon(badge.icon, size: 18, color: Colors.white),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            badge.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
