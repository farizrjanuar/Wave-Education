class Question {
  final int questionId;
  final String questionText;
  String questionType = '';
  List<String>? option;

  Question({required this.questionText, this.option, required this.questionId});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionId: json['questionId'],
      // questionType : json['question_type'],
      questionText: json['questionText'],
      // option: List<String>.from(json['options']),
    );
  }
}
