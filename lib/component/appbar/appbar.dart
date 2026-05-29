import 'package:canprep/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 800;
    final List<String> links = ['Mock Exams', 'Practice', 'CELPIP Wiki'];

    return Container(
      height: 72,
    
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 48 : 16),
      decoration: BoxDecoration(
        color: AppColors.headerBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('images/logo.svg', height: 44),
          if (isDesktop)
            Row(
              children: links.map((link) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                    ),
                    child: Text(
                      link,
                      style: GoogleFonts.merriweather(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          Row(
            children: [
              if (isDesktop)
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Start Learning',
                    style: GoogleFonts.oswald(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                )
              else
                IconButton(
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: AppColors.textPrimary,
                  ),
                  onPressed: () {},
                ),
            ],
          ),
        ],
      ),
    );
  }
}
