import 'package:flutter/material.dart';
// import google fonts
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: const Color(0xFFDFE9FF),
            title: Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              width: 200,
              child: Image.asset(
                "assets/images/logo.png",
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 60, 0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Dashboard",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF5B5B5B),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Course",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF5B5B5B),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "About Us",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF5B5B5B),
                        ),
                      ),
                    ),
                    // Foto profile
                    const SizedBox(width: 30),
                    Row(
                      children: [
                        Container(
                            // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: 35,
                            // height: 45,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                                  fit: BoxFit.cover),
                            )),
                        const SizedBox(width: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Ghefin",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(width: 5),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                              child: Icon(
                                size: 15,
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
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
        ));
  }
}
