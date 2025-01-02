import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_education/controller/UserController.dart';
import 'package:wave_education/view/widgets/form_attribute.dart';
import 'package:wave_education/view/widgets/main_footer.dart';
import 'package:wave_education/view/widgets/main_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MainHeader(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: double.infinity,
                        height: const Size.fromHeight(100).height,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFF4EADA), Color(0xffDFE9FF)],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        width: double.infinity,
                        // color: Colors.red,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 60,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${userController.user.value?.name}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "${userController.user.value?.email}",
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey.shade400,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        width: double.infinity,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SizedBox(
                                // width: 200,
                                height: 100,
                                child: FormAttribute(
                                    title: "Full Name",
                                    hintText: "Change your name here!",
                                    isObsecure: false),
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              child: SizedBox(
                                // width: 200,
                                height: 100,
                                child: FormAttribute(
                                    title: "Full Name",
                                    hintText: "Change your name here!",
                                    isObsecure: false),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 0, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            onPressed: () {
                              final userController = Get.put(UserController());
                              userController.logout();
                              context.goNamed("login");
                            },
                            child: const Text(
                              "Sign Out",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
                const MainFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
