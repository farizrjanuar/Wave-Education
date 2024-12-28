import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_education/controller/UserController.dart';
import 'package:wave_education/view/widgets/form_attribute.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormAuthSignUp extends StatelessWidget {
  // TextEditingController confirmPasswordController = TextEditingController();

  const FormAuthSignUp({
    super.key,
    required this.heightScreen,
  });

  final double heightScreen;

  @override
  Widget build(BuildContext context) {
    TextEditingController fullnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SizedBox(
      height: heightScreen * 0.82,
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
                      width: 110,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text("Sign Up",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    )),
                const SizedBox(height: 13),
                FormAttribute(
                  controller: fullnameController,
                  title: "Full Name",
                  hintText: "Enter your full name",
                  isObsecure: false,
                ),
                const SizedBox(height: 13),
                FormAttribute(
                  controller: emailController,
                  title: "Email",
                  hintText: "Enter your email",
                  isObsecure: false,
                ),
                const SizedBox(height: 13),
                FormAttribute(
                  controller: passwordController,
                  title: "Password",
                  hintText: "Enter your password",
                  isObsecure: true,
                ),
                const SizedBox(height: 13),
                const FormAttribute(
                  title: "Confirm Password",
                  hintText: "Enter your confirm password",
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
                    onPressed: () async {
                      final user = Get.put(UserController());
                      http.Response response = await user.register(
                          fullnameController.text,
                          emailController.text,
                          passwordController.text);

                      if (response.statusCode == 200) {
                        context.goNamed("login");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Failed to register"),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Sign Up",
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
