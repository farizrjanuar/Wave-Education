import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: SizedBox(
              height: 8000,
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
                  Center(
                    child: Container(
                      // border radius
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFFD4E1FF),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Tren Penggunaan Bahasa Pemrograman Tahun Ini",
                                  style: GoogleFonts.poppins(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF4366DE),
                                  )),
                              const SizedBox(height: 20),
                              Text(
                                  "JavaScript (JS) menduduki posisi teratas dengan 62.3% pengguna, menjadikannya bahasa pemrograman paling banyak digunakan.\n\n HTML/CSS mengikuti dengan 52.9%, yang mendukung pengembangan front-end dan desain web.",
                                  style: GoogleFonts.poppins(fontSize: 21)),
                            ]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.bottomRight,
                    child:
                        Image.asset(width: 400, "assets/images/dboard_1.png"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
