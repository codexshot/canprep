import 'package:canprep/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 800;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: isDesktop ? 80 : 48,
      ),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: _HeroText()),
                const SizedBox(width: 40),
                Expanded(flex: 5, child: _HeroIllustration()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeroText(),
                const SizedBox(height: 48),
                Center(child: _HeroIllustration()),
              ],
            ),
    );
  }
}

class _HeroText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 800;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ace your CELPIP\nexam the smart\nway—fast, free,\nforever.',
          style: GoogleFonts.oswald(
            fontSize: isDesktop ? 52 : 38,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Master CELPIP with bite-sized practice, AI-powered feedback, and personalized study plans. Join thousands of test-takers achieving their target scores.',
          style: GoogleFonts.merriweather(
            fontSize: isDesktop ? 15 : 14,
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
            'Get a Free Demo',
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

class _HeroIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: 340,
            height: 340,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accentGreen.withValues(alpha: 0.12),
            ),
          ),
          Positioned(
            top: 20,
            right: 30,
            child: _FloatingBubble(
              'Hello!',
              AppColors.accentTeal,
              Colors.white,
            ),
          ),
          Positioned(
            top: 70,
            left: 10,
            child: _FloatingBubble(
              'Score: 10+',
              const Color(0xFF7E57C2),
              Colors.white,
            ),
          ),
          Positioned(
            bottom: 90,
            right: 10,
            child: _FloatingBubble(
              'Writing: 9',
              AppColors.primaryOrange,
              Colors.white,
            ),
          ),
          Positioned(
            bottom: 60,
            left: 0,
            child: _FloatingBubble(
              'Speaking: 10',
              AppColors.accentGreen,
              Colors.white,
            ),
          ),
          Container(
            width: 220,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: const Color(0xFF2E7D32),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFFFCC80),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 55,
                    color: Color(0xFFE65100),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'CELPIP Ready! 🎉',
                    style: GoogleFonts.oswald(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2E7D32),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ScorePill('🇨🇦', '9.0 CLB', Colors.red),
                const SizedBox(width: 8),
                _ScorePill('✍️', '8.5 CLB', Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingBubble extends StatelessWidget {
  final String text;
  final Color bg;
  final Color textColor;

  const _FloatingBubble(this.text, this.bg, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ScorePill extends StatelessWidget {
  final String icon;
  final String score;
  final Color color;

  const _ScorePill(this.icon, this.score, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 6),
          Text(
            score,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
