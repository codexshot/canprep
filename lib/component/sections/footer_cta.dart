import 'package:canprep/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterCta extends StatelessWidget {
  const FooterCta({super.key});

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
            'Join over 10,000+ global,\nmotivated CELPIP\nlearners on CanPrep.',
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
              fontSize: isDesktop ? 44 : 30,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'The #1 CELPIP prep platform for newcomers and advanced test-takers.',
            textAlign: TextAlign.center,
            style: GoogleFonts.merriweather(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryOrange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 44,
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: Text(
              'Start Learning Free',
              style: GoogleFonts.oswald(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'No credit card required · Free plan available',
            style: GoogleFonts.merriweather(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 56),
          isDesktop
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _AwardBadge(
                      Icons.workspace_premium_rounded,
                      "Editor's Choice",
                      'Google Play',
                    ),
                    const SizedBox(width: 32),
                    _AwardBadge(
                      Icons.star_rounded,
                      'App of the Day',
                      'App Store',
                    ),
                    const SizedBox(width: 32),
                    _AwardBadge(
                      Icons.verified_rounded,
                      'Top Rated',
                      'CELPIP Prep',
                    ),
                  ],
                )
              : Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    _AwardBadge(
                      Icons.workspace_premium_rounded,
                      "Editor's Choice",
                      'Google Play',
                    ),
                    _AwardBadge(
                      Icons.star_rounded,
                      'App of the Day',
                      'App Store',
                    ),
                    _AwardBadge(
                      Icons.verified_rounded,
                      'Top Rated',
                      'CELPIP Prep',
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class _AwardBadge extends StatelessWidget {
  final IconData icon;
  final String title;
  final String platform;

  const _AwardBadge(this.icon, this.title, this.platform);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.accentYellow, size: 28),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.oswald(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                platform,
                style: GoogleFonts.merriweather(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
