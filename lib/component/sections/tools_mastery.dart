import 'package:canprep/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToolsMastery extends StatelessWidget {
  const ToolsMastery({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 800;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: _UsersGrid()),
                const SizedBox(width: 60),
                Expanded(flex: 5, child: _ToolsText()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ToolsText(),
                const SizedBox(height: 48),
                _UsersGrid(),
              ],
            ),
    );
  }
}

class _UsersGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = [
      ('A', AppColors.accentPurple, '🇨🇦', '9.0'),
      ('B', AppColors.accentBlue, '🇮🇳', '8.5'),
      ('C', AppColors.accentGreen, '🇵🇭', '10.0'),
      ('D', AppColors.primaryOrange, '🇨🇳', '7.5'),
      ('E', AppColors.accentTeal, '🇰🇷', '9.5'),
      ('F', AppColors.accentPink, '🇧🇷', '8.0'),
      ('G', AppColors.accentYellow, '🇳🇬', '9.0'),
      ('H', AppColors.accentRed, '🇵🇰', '8.5'),
      ('I', const Color(0xFF00695C), '🇫🇷', '7.0'),
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: users.map((u) {
        return Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: u.$2.withValues(alpha: 0.15),
                  radius: 36,
                  child: Text(
                    u.$1,
                    style: TextStyle(
                      color: u.$2,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Text(u.$3, style: const TextStyle(fontSize: 14)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: u.$2.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'CLB ${u.$4}',
                style: TextStyle(
                  color: u.$2,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class _ToolsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Smarter tools for exam mastery',
          style: GoogleFonts.oswald(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Improve your writing with AI scoring, practice speaking with instant pronunciation feedback, and build reading comprehension with timed exercises—all in one platform designed for CELPIP success.',
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
