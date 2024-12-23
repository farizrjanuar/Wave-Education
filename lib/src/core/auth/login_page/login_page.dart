import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wave_education/data/response.dart';
import 'package:wave_education/src/core/Controller/fetchData_course.dart';
import 'package:wave_education/src/core/auth/login_page/widget/form_auth_signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    fetchDataCourse();
    List<dynamic> data = jsonDecode(jsonString);
    final questions = data[0]['moduleDTOS'][0]['quizDTO']['questionDTO']
        as List; // Kondisi khusus untuk quizId 1 dan questionId 1
    for (var question in questions) {
      if (question['questionId'] == 1) {
        print('Question: ${question['questionText']}');
        final options = question['options'] as List;

        for (var option in options) {
          option.forEach((answer, isCorrect) {
            if (isCorrect) {
              print('Bener');
            } else {
              print('Salah');
            }
          });
        }
      }
    }

    // double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: SizedBox(
              // color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: [
                  Expanded(
                      child: Center(
                    child:
                        Image.asset(width: 350, "assets/images/logo_white.png"),
                  )),
                  Expanded(
                    child: FormAuthSignIn(heightScreen: heightScreen),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
