import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_education/src/widgets/main_footer.dart';
import 'package:wave_education/src/widgets/main_header.dart';
import 'package:go_router/go_router.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key});

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
                      "Course Artificial Intelligence",
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
                    const ModulesContent(),
                    const ModulesContent(),
                    const ModulesContent(),
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

class ModulesContent extends StatelessWidget {
  const ModulesContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed("modules");
      },
      child: Container(
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
              "Modul A",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Text(
              "Artificial Intelligence (AI) Overview adalah kursus pengantar yang dirancang untuk memberikan pemahaman mendasar tentang konsep, aplikasi, dan potensi AI dalam berbagai industri. Kursus ini mencakup definisi AI, sejarah perkembangan, dan teknologi terkini seperti machine learning, neural networks, serta penggunaan AI dalam kehidupan sehari-hari. Peserta akan mempelajari berbagai penerapan AI, mulai dari kendaraan otonom hingga asisten virtual, serta bagaimana teknologi ini memengaruhi masa depan pekerjaan, etika, dan masyarakat.",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            const ButtonApp()
          ],
        ),
      ),
    );
  }
}

class ButtonApp extends StatelessWidget {
  const ButtonApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // Border radius di sini
            ),
            backgroundColor: Colors.amber[400], // Warna background tombol
            padding: const EdgeInsets.symmetric(
                horizontal: 24, vertical: 12), // Padding tombol
          ),
          onPressed: () {
            context.goNamed("quiz");
          },
          child: Row(
            children: [
              Icon(
                Icons.quiz,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Kerjakan Quiz!",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          )),
    );
  }
}
