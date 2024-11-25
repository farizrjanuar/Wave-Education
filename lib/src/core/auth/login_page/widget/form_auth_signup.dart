import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_education/src/widgets/form_attribute.dart';
import 'package:go_router/go_router.dart';

class FormAuthSignIn extends StatelessWidget {
  const FormAuthSignIn({
    super.key,
    required this.heightScreen,
  });

  final double heightScreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightScreen * 0.6,
      width: 300,
      child: Center(
        child: Container(
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xFFD4E1FF),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Welcome to ",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    // const Spacer(),
                    Image.asset(
                      "assets/images/logo.png",
                      width: 100,
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                Text("Sign In",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    )),
                const SizedBox(height: 13),
                const FormAttribute(
                  title: "Email",
                  hintText: "Enter your email",
                  isObsecure: false,
                ),
                const SizedBox(height: 13),
                const FormAttribute(
                  title: "Password",
                  hintText: "Enter your password",
                  isObsecure: true,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      backgroundColor: const Color(0xFF2D59AF),
                    ),
                    onPressed: () {
                      context.goNamed("signup");
                    },
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
