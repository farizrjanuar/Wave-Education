import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_education/controller/CourseController.dart';
import 'package:wave_education/controller/UserController.dart';
import 'package:wave_education/data/dummyCourse.dart';
import 'package:wave_education/model/CourseModel.dart';
import 'package:wave_education/model/User.dart';
import 'package:wave_education/view/core/dashboard/widget/course_card.dart';
import 'package:wave_education/view/core/dashboard/widget/enrolling_card.dart';
import 'package:wave_education/view/core/dashboard/widget/get_course_card.dart';
import 'package:wave_education/view/widgets/main_footer.dart';
import 'package:wave_education/view/widgets/main_header.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final courseController = Get.put(CourseController());
    courseController.getAllCourse();

    // print(courseController.course.value);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MainHeader(),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => SafeArea(
              child: userController.isLoading.value == true
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
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
                                    "${userController.user.value?.name} + ${"HALOOOO ${courseController.course.value?.length}"}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 50),
                                  // const SizedBox(height: 5),
                                  const SectionEnrolledCourse(),
                                  const SizedBox(height: 50),
                                  const SectionEnrollCourse(),
                                  const SizedBox(height: 50),
                                ],
                              ),
                            ),
                          ),
                        ),
                        MainFooter(),
                      ],
                    )),
        ),
      ),
    );
  }
}

class SectionEnrollCourse extends StatelessWidget {
  const SectionEnrollCourse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final courseController = Get.put(CourseController());
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Courses",
            style:
                GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 50),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Jumlah kolom dalam grid
              crossAxisSpacing: 10, // Jarak antar kolom
              mainAxisSpacing: 10, // Jarak antar baris
            ),
            itemCount: courseController.course.value?.length ??
                0, // Jumlah total item yang akan ditampilkan
            itemBuilder: (BuildContext context, int index) {
              final course = courseController
                  .course.value?[index]; // Mengakses elemen berdasarkan index
              if (course == null) {
                return const SizedBox
                    .shrink(); // Jika null, tampilkan widget kosong
              }
              return EnrollingCard(
                courseId: course['courseId'],
                courseName: course['title'],
                courseDesc: course['description'],
              );
            },
          )
        ],
      ),
    );
  }
}

class SectionEnrolledCourse extends StatelessWidget {
  const SectionEnrolledCourse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    userController.getUserEnrolledCoursesById(1);
    // print("kesini ${userController.enrolledCourses.value!.length}");
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Courses",
            style:
                GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 50),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Jumlah kolom dalam grid
              crossAxisSpacing: 10, // Jarak antar kolom
              mainAxisSpacing: 10, // Jarak antar baris
            ),
            itemCount: userController.enrolledCourses.value?.length ?? 0,
            // Jumlah total item yang akan ditampilkan
            itemBuilder: (BuildContext context, int index) {
              final course = userController.enrolledCourses.value?[index];
              final courseDetail = course['courseDTO'];
              if (course == null) {
                return const SizedBox
                    .shrink(); // Jika null, tampilkan widget kosong
              }

              return CoursesCard(
                courseName: courseDetail['title'],
                courseDesc: courseDetail['description'],
              );
            },
          )
        ],
      ),
    );
  }
}
