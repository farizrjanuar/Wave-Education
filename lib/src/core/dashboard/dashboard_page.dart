import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_education/data/dummyCourse.dart';
import 'package:wave_education/src/core/Controller/fetchData_course.dart';
import 'package:wave_education/src/core/dashboard/widget/course_card.dart';
import 'package:wave_education/src/core/dashboard/widget/module_course_card.dart';
import 'package:wave_education/src/widgets/main_footer.dart';
import 'package:wave_education/src/widgets/main_header.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MainHeader(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<Map<String, dynamic>>(
                future: fetchDataCourse(),
                builder: (context, snapshot) {
                  // Jika masih dalam proses pengambilan data
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  // Jika terjadi error
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  // Jika data berhasil diambil
                  if (snapshot.hasData) {
                    final courses = snapshot.data!;
                    return Padding(
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
                                "${courses['fullname']}",
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
                    );
                  }

                  // Jika tidak ada data
                  return Center(child: Text('No data available'));
                }),
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
    List data = jsonDecode(dataJson);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Courses",
          style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 50),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Jumlah kolom dalam grid
            crossAxisSpacing: 10, // Jarak antar kolom
            mainAxisSpacing: 10, // Jarak antar baris
          ),
          itemCount: 3, // Jumlah total item yang akan ditampilkan
          itemBuilder: (BuildContext context, int index) {
            // Membangun setiap item berdasarkan index
            return CoursesCard(
              path: data[index]['courseName'],
            );
          },
        )
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     CoursesCard(
        //       path: "pbo",
        //     ),
        //     CoursesCard(
        //       path: "algoritma pemrograman",
        //     ),
        //     CoursesCard(
        //       path: "struktur data",
        //     ),
        //   ],
        // )
      ],
    );
  }
}
