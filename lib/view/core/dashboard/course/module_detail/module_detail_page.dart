import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_education/view/core/dashboard/course/course_detail/course_detail_page.dart';
import 'package:wave_education/view/widgets/main_footer.dart';
import 'package:wave_education/view/widgets/main_header.dart';

class ModuleDetailPage extends StatelessWidget {
  final String courseName;
  final String moduleName;
  const ModuleDetailPage({
    required this.courseName,
    required this.moduleName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MainHeader(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: SizedBox(
                width: widthScreen,
                // height: 700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Modul A",
                      style: GoogleFonts.poppins(
                          fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Artificial Intelligence (AI) Overview adalah kursus pengantar yang dirancang untuk memberikan pemahaman mendasar tentang konsep, aplikasi, dan potensi AI dalam berbagai industri. Kursus ini mencakup definisi AI, sejarah perkembangan, dan teknologi terkini seperti machine learning, neural networks, serta penggunaan AI dalam kehidupan sehari-hari. Peserta akan mempelajari berbagai penerapan AI, mulai dari kendaraan otonom hingga asisten virtual, serta bagaimana teknologi ini memengaruhi masa depan pekerjaan, etika, dan masyarakat.",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                      decoration: BoxDecoration(
                        // elevation
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 6,
                              blurRadius: 7,
                              offset: const Offset(0, 3))
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xFF4366DE),
                      ),
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Apa itu Java?",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Sintaks Java mirip seperti C/C++, karena Java banyak terinspirasi dari kedua bahasa ini. Java dirancang untuk tujuan umum (general-purpose) dan sepenuhnya menganut. paradigma OOP (Object Oriented Programming).\n\nStruktur Dasar Program Java \nStruktur program Java secara umum dibagi menjadi 4 bagian:\n- Deklarasi Package \n- Impor Library \n- Bagian Class Method Main \n- Mari kita lihat contohnya:",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 400,
                            child:
                                Image.asset("assets/images/dummy_materi.png"),
                          ),
                          const SizedBox(height: 20),
                          const ButtonApp()
                        ],
                      ),
                    )
                  ],
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
