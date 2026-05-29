import 'package:canprep/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoreBubbles extends StatelessWidget {
  const ScoreBubbles({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 800;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isDesktop ? 80 : 24,
      ),
      child: Column(
        children: [
          Text(
            'Find Your Study Community',
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
              fontSize: isDesktop ? 32 : 26,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Connect with CELPIP test-takers by target score, hometown, and more',
            textAlign: TextAlign.center,
            style: GoogleFonts.merriweather(
              fontSize: 15,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 48),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _Bubble('CLB 9+', AppColors.primaryOrange, Colors.white),
                _Bubble('Hello!', AppColors.accentBlue, Colors.white),
                _Bubble('Writing Pro', AppColors.accentPurple, Colors.white),
                _Bubble('CLB 10', AppColors.accentGreen, Colors.white),
                _Bubble('你好', const Color(0xFFE53935), Colors.white),
                _Bubble('Exam Ace', AppColors.accentTeal, Colors.white),
                _Bubble('CLB 8', const Color(0xFF6D4C41), Colors.white),
                _Bubble('ਸਤਿ ਸ੍ਰੀ ਅਕਾਲ', AppColors.accentPink, Colors.white),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _Bubble('안녕하세요', AppColors.accentYellow, AppColors.textPrimary),
                _Bubble('CLB 7', AppColors.accentGreen, Colors.white),
                _Bubble('Bonjour', AppColors.accentBlue, Colors.white),
                _Bubble('Speaking 10', AppColors.primaryOrange, Colors.white),
                _Bubble('Hola!', const Color(0xFF7B1FA2), Colors.white),
                _Bubble('Test Ready', AppColors.accentGreen, Colors.white),
                _Bubble('Привет', AppColors.accentBlue, Colors.white),
                _Bubble('CLB 9', AppColors.accentTeal, Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  final String text;
  final Color bg;
  final Color textColor;

  const _Bubble(this.text, this.bg, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: GoogleFonts.merriweather(
          fontSize: 15,
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
