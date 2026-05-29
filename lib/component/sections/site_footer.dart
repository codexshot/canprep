import 'package:canprep/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 800;

    return Container(
      width: double.infinity,
      color: AppColors.footerBg,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _LogoSection(),
                    const SizedBox(width: 80),
                    Expanded(child: _LinksGrid()),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _LogoSection(),
                    const SizedBox(height: 40),
                    _LinksGrid(),
                  ],
                ),
          const SizedBox(height: 48),
          const Divider(color: Color(0xFF2E2E2E)),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  '© 2024 CanPrep. All rights reserved.',
                  style: GoogleFonts.merriweather(
                    fontSize: 12,
                    color: const Color(0xFF888888),
                  ),
                ),
              ),
              Row(
                children: const [
                  _SocialIcon(Icons.language_rounded),
                  SizedBox(width: 10),
                  _SocialIcon(Icons.camera_alt_rounded),
                  SizedBox(width: 10),
                  _SocialIcon(Icons.music_note_rounded),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LogoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('images/logo.svg', height: 48),
        const SizedBox(height: 16),
        SizedBox(
          width: 220,
          child: Text(
            'Your fastest path to a 10+ CELPIP score. AI-powered, personalized, and free to start.',
            style: GoogleFonts.merriweather(
              fontSize: 13,
              color: const Color(0xFF888888),
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}

class _LinksGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final columns = [
      (
        'Features',
        ['Mock Exams', 'AI Feedback', 'Progress Tracking', 'Study Plans', 'Pronunciation'],
      ),
      (
        'Use With',
        ['CELPIP General', 'CELPIP Academic', 'Writing Tasks', 'Oral Practice', 'Plugin'],
      ),
      (
        'Help & Support',
        ['FAQ', 'Study Guides', 'Contact Us', 'Community', 'CELPIP Tips'],
      ),
      (
        'About CanPrep',
        ['Our Story', 'Careers', 'Press', 'Privacy Policy', 'Terms of Use'],
      ),
    ];

    return Wrap(
      spacing: 40,
      runSpacing: 32,
      children: columns.map((col) {
        return SizedBox(
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                col.$1,
                style: GoogleFonts.oswald(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              ...col.$2.map(
                (link) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    link,
                    style: GoogleFonts.merriweather(
                      fontSize: 12,
                      color: const Color(0xFF888888),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;

  const _SocialIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0xFF2E2E2E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: const Color(0xFF888888), size: 18),
    );
  }
}
