import 'package:canprep/component/appbar/appbar.dart';
import 'package:canprep/component/sections/app_showcase.dart';
import 'package:canprep/component/sections/features_grid.dart';
import 'package:canprep/component/sections/flexible_journey.dart';
import 'package:canprep/component/sections/footer_cta.dart';
import 'package:canprep/component/sections/hero_section.dart';
import 'package:canprep/component/sections/learn_strip.dart';
import 'package:canprep/component/sections/score_bubbles.dart';
import 'package:canprep/component/sections/site_footer.dart';
import 'package:canprep/component/sections/testimonials_section.dart';
import 'package:canprep/component/sections/tools_mastery.dart';
import 'package:canprep/constants/app_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Appbar(),
            HeroSection(),
            LearnStrip(),
            FeaturesGrid(),
            AppShowcase(),
            FlexibleJourney(),
            ToolsMastery(),
            TestimonialsSection(),
            ScoreBubbles(),
            FooterCta(),
            SiteFooter(),
          ],
        ),
      ),
    );
  }
}
