import 'package:wave_education/model/Question.dart';
import 'package:wave_education/model/Scoreable.dart';

class Quiz implements Scoreable {
  int quizID;
  int materiID;
  int rewardPoints;
  List<Question> question;

  Quiz(
      {required this.quizID,
      required this.materiID,
      required this.rewardPoints,
      required this.question});

  @override
  int calculateScore() {
    return 0;
  }
}
