import 'package:canprep/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlexibleJourney extends StatelessWidget {
  const FlexibleJourney({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 800;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: _JourneyText()),
                const SizedBox(width: 60),
                Expanded(flex: 5, child: _CourseCard()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _JourneyText(),
                const SizedBox(height: 48),
                _CourseCard(),
              ],
            ),
    );
  }
}

class _JourneyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discover a flexible prep journey',
          style: GoogleFonts.oswald(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Reach your CELPIP target with courses tailored to your level, band goals, and schedule. Stay motivated with instant feedback, progress tracking, and AI coaching—like a tutor in your pocket.',
          style: GoogleFonts.merriweather(
            fontSize: 15,
            color: AppColors.textSecondary,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 36),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.textPrimary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: Text(
            'Start learning',
            style: GoogleFonts.oswald(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }
}

class _CourseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.accentGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.accentGreen.withValues(alpha: 0.3),
              ),
            ),
            child: Text(
              'Self-study course',
              style: GoogleFonts.merriweather(
                fontSize: 12,
                color: AppColors.accentGreenDark,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'CELPIP Complete Prep',
            style: GoogleFonts.oswald(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'All 8 components covered',
            style: GoogleFonts.merriweather(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 28),
          const _CourseProgress('Reading Skills', 0.75, AppColors.accentBlue),
          const SizedBox(height: 16),
          const _CourseProgress('Writing Tasks', 0.58, AppColors.accentPurple),
          const SizedBox(height: 16),
          const _CourseProgress(
            'Listening Skills',
            0.82,
            AppColors.accentGreen,
          ),
          const SizedBox(height: 16),
          const _CourseProgress(
            'Speaking & Oral',
            0.44,
            AppColors.primaryOrange,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Text(
                'Overall Progress',
                style: GoogleFonts.merriweather(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              Text(
                '65%',
                style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CourseProgress extends StatelessWidget {
  final String label;
  final double value;
  final Color color;

  const _CourseProgress(this.label, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.merriweather(
                fontSize: 13,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              '${(value * 100).toInt()}%',
              style: GoogleFonts.merriweather(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: color.withValues(alpha: 0.12),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}
