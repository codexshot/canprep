import 'package:canprep/constants/app_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final _controller = PageController(viewportFraction: 0.85);
  int _current = 0;

  static const _testimonials = [
    (
      'CanPrep helped me go from CLB 7 to CLB 9 in just 6 weeks. The AI feedback on my writing was incredibly accurate and helped me understand exactly what the test markers look for.',
      'Priya Singh',
      'Software Engineer',
      '🇨🇦',
    ),
    (
      'I was struggling with the speaking component, but CanPrep\'s pronunciation practice and mock recordings gave me the confidence I needed. I scored 10 on speaking!',
      'Carlos Mendez',
      'Healthcare Professional',
      '🇵🇭',
    ),
    (
      'The mock exams are incredibly realistic. I felt completely prepared on test day—no surprises. The instant scoring and detailed feedback were game-changers for my study plan.',
      'Aisha Mohammed',
      'Graduate Student',
      '🇳🇬',
    ),
    (
      'I love how CanPrep personalizes my study plan. It identified my weak areas in listening and focused my practice there. Saved me so much time and helped me hit CLB 9!',
      'Wei Zhang',
      'International Applicant',
      '🇨🇳',
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      if (event.scrollDelta.dx > 0 || event.scrollDelta.dy > 0) {
        _controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        _controller.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'What our test-takers are saying',
              textAlign: TextAlign.center,
              style: GoogleFonts.oswald(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 52),
          SizedBox(
            height: 280,
            child: Listener(
              onPointerSignal: _onScroll,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: PageView.builder(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: _testimonials.length,
                  onPageChanged: (i) => setState(() => _current = i),
                  itemBuilder: (context, index) {
                    final t = _testimonials[index];
                    final isActive = _current == index;
                    return AnimatedScale(
                      scale: isActive ? 1.0 : 0.95,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: AppColors.cardYellow,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: List.generate(
                                5,
                                (_) => const Icon(
                                  Icons.star_rounded,
                                  color: Color(0xFFFFA000),
                                  size: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: Text(
                                '"${t.$1}"',
                                style: GoogleFonts.merriweather(
                                  fontSize: 14,
                                  color: AppColors.textPrimary,
                                  height: 1.7,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColors.accentGreen
                                      .withValues(alpha: 0.2),
                                  radius: 20,
                                  child: Text(
                                    t.$2[0],
                                    style: const TextStyle(
                                      color: AppColors.accentGreenDark,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      t.$2,
                                      style: GoogleFonts.oswald(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    Text(
                                      t.$3,
                                      style: GoogleFonts.merriweather(
                                        fontSize: 11,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(t.$4, style: const TextStyle(fontSize: 24)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_testimonials.length, (i) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _current == i ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _current == i
                      ? AppColors.textPrimary
                      : AppColors.border,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
