import 'package:canprep/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturesGrid extends StatelessWidget {
  const FeaturesGrid({super.key});

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
      child: Column(
        children: [
          Text(
            'Why prep for CELPIP with CanPrep?',
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
              fontSize: isDesktop ? 36 : 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: 620,
            child: Text(
              'Master CELPIP with bite-sized practice, AI-powered feedback, and personalized study plans. Join thousands of test-takers achieving their target scores.',
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: 15,
                color: AppColors.textSecondary,
                height: 1.7,
              ),
            ),
          ),
          const SizedBox(height: 52),
          isDesktop ? const _DesktopGrid() : const _MobileGrid(),
        ],
      ),
    );
  }
}

class _DesktopGrid extends StatelessWidget {
  const _DesktopGrid();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: _FeatureCard(
                bgColor: AppColors.cardPurple,
                title: 'Practice together',
                subtitle:
                    'Go beyond solo prep—practice with peers, share strategies, and explore CELPIP tips globally.',
                icon: Icons.groups_rounded,
                iconColor: AppColors.accentPurple,
                mockup: const _PracticeMockup(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  _FeatureCard(
                    bgColor: Colors.white,
                    title: 'Confident learning starts here',
                    subtitle:
                        'Track real progress with checkpoints, AI scoring, and detailed performance analytics.',
                    icon: Icons.trending_up_rounded,
                    iconColor: AppColors.accentGreen,
                    mockup: const _ProgressMockup(),
                  ),
                  const SizedBox(height: 16),
                  _FeatureCard(
                    bgColor: Colors.white,
                    title: 'Study anytime, anywhere',
                    subtitle:
                        "No matter your schedule, practice reading, writing, listening, and speaking at your own pace.",
                    icon: Icons.devices_rounded,
                    iconColor: AppColors.accentBlue,
                    mockup: const _DevicesMockup(),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: _FeatureCard(
                bgColor: Colors.white,
                title: 'Prepare for real test scenarios',
                subtitle:
                    'Overcome test anxiety with realistic practice tests and native English examples with instant AI feedback.',
                icon: Icons.assignment_turned_in_rounded,
                iconColor: AppColors.accentRed,
                mockup: const _TestScenarioMockup(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 4,
              child: _FeatureCard(
                bgColor: AppColors.primaryOrange,
                title: 'Personalized study plans',
                subtitle:
                    'Learn smarter with AI-tailored lessons based on your goals and weak areas.',
                icon: Icons.auto_awesome_rounded,
                iconColor: Colors.white,
                textColor: Colors.white,
                subtitleColor: Colors.white70,
                mockup: const _PersonalizedMockup(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MobileGrid extends StatelessWidget {
  const _MobileGrid();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _FeatureCard(
          bgColor: AppColors.cardPurple,
          title: 'Practice together',
          subtitle: 'Practice with peers and share CELPIP strategies globally.',
          icon: Icons.groups_rounded,
          iconColor: AppColors.accentPurple,
        ),
        const SizedBox(height: 16),
        _FeatureCard(
          bgColor: Colors.white,
          title: 'Confident learning starts here',
          subtitle: 'Track real progress with checkpoints and AI scoring.',
          icon: Icons.trending_up_rounded,
          iconColor: AppColors.accentGreen,
        ),
        const SizedBox(height: 16),
        _FeatureCard(
          bgColor: Colors.white,
          title: 'Study anytime, anywhere',
          subtitle: 'Practice at your own pace, on any device.',
          icon: Icons.devices_rounded,
          iconColor: AppColors.accentBlue,
        ),
        const SizedBox(height: 16),
        _FeatureCard(
          bgColor: Colors.white,
          title: 'Prepare for real test scenarios',
          subtitle: 'Realistic practice tests with instant AI feedback.',
          icon: Icons.assignment_turned_in_rounded,
          iconColor: AppColors.accentRed,
        ),
        const SizedBox(height: 16),
        _FeatureCard(
          bgColor: AppColors.primaryOrange,
          title: 'Personalized study plans',
          subtitle: 'AI-tailored lessons based on your goals and weak areas.',
          icon: Icons.auto_awesome_rounded,
          iconColor: Colors.white,
          textColor: Colors.white,
          subtitleColor: Colors.white70,
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final Color subtitleColor;
  final Widget? mockup;

  const _FeatureCard({
    required this.bgColor,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    this.textColor = AppColors.textPrimary,
    this.subtitleColor = AppColors.textSecondary,
    this.mockup,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.oswald(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: GoogleFonts.merriweather(
              fontSize: 13,
              color: subtitleColor,
              height: 1.6,
            ),
          ),
          if (mockup != null) ...[
            const SizedBox(height: 20),
            mockup!,
          ],
        ],
      ),
    );
  }
}

class _PracticeMockup extends StatelessWidget {
  const _PracticeMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.accentPurple.withValues(alpha: 0.2),
                radius: 16,
                child: const Text(
                  'A',
                  style: TextStyle(
                    color: AppColors.accentPurple,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aisha',
                    style: GoogleFonts.merriweather(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'Your practice partner',
                    style: GoogleFonts.merriweather(
                      fontSize: 10,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.cardPurple,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'The best approach for email writing is to organize your points clearly...',
              style: GoogleFonts.merriweather(
                fontSize: 11,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Vocabulary exercise',
            style: GoogleFonts.merriweather(
              fontSize: 10,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressMockup extends StatelessWidget {
  const _ProgressMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.check_circle_rounded,
                color: AppColors.accentGreen,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Checkpoint completed',
                style: GoogleFonts.merriweather(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentGreenDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _ProgressRow('Reading', 0.85, AppColors.accentGreen),
          const SizedBox(height: 6),
          _ProgressRow('Writing', 0.70, AppColors.accentBlue),
          const SizedBox(height: 6),
          _ProgressRow('Score', 0.90, AppColors.primaryOrange),
        ],
      ),
    );
  }
}

class _ProgressRow extends StatelessWidget {
  final String label;
  final double value;
  final Color color;

  const _ProgressRow(this.label, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Text(
            label,
            style: GoogleFonts.merriweather(
              fontSize: 10,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 6,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '${(value * 100).toInt()}%',
          style: GoogleFonts.merriweather(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _DevicesMockup extends StatelessWidget {
  const _DevicesMockup();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        _MiniPhone(Icons.headphones_rounded, AppColors.accentBlue, 'Listening'),
        _MiniPhone(Icons.edit_rounded, AppColors.accentPurple, 'Writing'),
        _MiniPhone(Icons.mic_rounded, AppColors.accentGreen, 'Speaking'),
      ],
    );
  }
}

class _MiniPhone extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _MiniPhone(this.icon, this.color, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 52,
          height: 84,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: color.withValues(alpha: 0.3), width: 2),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.merriweather(
            fontSize: 10,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _TestScenarioMockup extends StatelessWidget {
  const _TestScenarioMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardOrange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mock Test',
            style: GoogleFonts.oswald(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.accentRed,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.accentRed,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Reading',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Question 5 of 38',
                style: GoogleFonts.merriweather(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '"The email should be written in a professional tone, addressing the recipient formally..."',
            style: GoogleFonts.merriweather(
              fontSize: 11,
              color: AppColors.textPrimary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _PersonalizedMockup extends StatelessWidget {
  const _PersonalizedMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome, color: Colors.white, size: 16),
              const SizedBox(width: 8),
              Text(
                'AI Study Plan',
                style: GoogleFonts.oswald(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const _PlanItem('Focus on Writing Task 1', Icons.edit_rounded),
          const _PlanItem(
            'Practice Listening Part B',
            Icons.headphones_rounded,
          ),
          const _PlanItem(
            'Review Speaking criteria',
            Icons.record_voice_over_rounded,
          ),
        ],
      ),
    );
  }
}

class _PlanItem extends StatelessWidget {
  final String text;
  final IconData icon;

  const _PlanItem(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 14),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
