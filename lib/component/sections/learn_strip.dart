import 'package:canprep/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LearnStrip extends StatelessWidget {
  const LearnStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = [
      ('📖', 'Reading'),
      ('✍️', 'Writing'),
      ('🎧', 'Listening'),
      ('🗣️', 'Speaking'),
      ('📝', 'Essay'),
      ('💬', 'Oral'),
      ('🧪', 'Mock Exam'),
    ];

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Text(
            'I want to practice',
            style: GoogleFonts.merriweather(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 28),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: sections.map((s) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: _SectionButton(emoji: s.$1, label: s.$2),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionButton extends StatefulWidget {
  final String emoji;
  final String label;

  const _SectionButton({required this.emoji, required this.label});

  @override
  State<_SectionButton> createState() => _SectionButtonState();
}

class _SectionButtonState extends State<_SectionButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _hovered
                    ? AppColors.primaryOrange.withValues(alpha: 0.1)
                    : AppColors.background,
                border: Border.all(
                  color: _hovered ? AppColors.primaryOrange : AppColors.border,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  widget.emoji,
                  style: const TextStyle(fontSize: 28),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.label,
              style: GoogleFonts.merriweather(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: _hovered
                    ? AppColors.primaryOrange
                    : AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
