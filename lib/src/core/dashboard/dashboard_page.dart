import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_education/data/dummyCourse.dart';
import 'package:wave_education/src/core/dashboard/widget/course_card.dart';
import 'package:wave_education/src/core/dashboard/widget/module_course_card.dart';
import 'package:wave_education/src/widgets/main_footer.dart';
import 'package:wave_education/src/widgets/main_header.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> data = jsonDecode(dummyCourse);
    // List<dynamic> courses = data['courses'];
    // List<String> courseNames =
    //     courses.map((course) => course['course_id'] as String).toList();

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MainHeader(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                child: SizedBox(
                  // height: 8000,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Halo, Ghefin!",
                        style: GoogleFonts.poppins(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 50),
                      const ContainerNews(),
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                            width: 400, "assets/images/dboard_1.png"),
                      ),
                      const SizedBox(height: 5),
                      const SectionCourseDashboard(),
                      const SizedBox(height: 50),
                      const SectionModuleDashboard(),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
            const MainFooter(),
          ],
        ),
      ),
    );
  }
}

class SectionModuleDashboard extends StatelessWidget {
  const SectionModuleDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Get Course’s Module",
          style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 50),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ModuleCourseCard(),
            ModuleCourseCard(),
            ModuleCourseCard(),
          ],
        )
      ],
    );
  }
}

class SectionCourseDashboard extends StatelessWidget {
  const SectionCourseDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> data = jsonDecode(dummyCourse);
    // List<dynamic> courses = data['courses'];
    // List<String> courseNames =
    //     courses.map((course) => course['course_name'] as String).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Courses",
          style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 50),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CoursesCard(),
            CoursesCard(),
            CoursesCard(),
          ],
        )
      ],
    );
  }
}
