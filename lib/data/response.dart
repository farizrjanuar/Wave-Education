String jsonString = '''[{
  "courseId": 1,
  "title": "Introduction to Java",
  "description": "Learn the basics of Java programming.",
  "moduleDTOS": [
    {
      "moduleId": 1,
      "title": "Java Basics",
      "description": "Introduction to Java syntax and structure.",
      "content": "Java content 1",
      "quizDTO": {
        "quizId": 1,
        "rewardPoint": 10,
        "questionDTO": [
          {
            "questionId": 1,
            "questionText": "What is the correct way to define a main method in Java?",
            "options": [
              { "public static void main(String[] args)": true },
              { "static public void main(String args[])": false },
              { "public void static main(String args[])": false },
              { "void static main(String[] args)": false }
            ]
          },
          {
            "questionId": 2,
            "questionText": "Which data type is used to create a variable that should store text?",
            "options": [
              { "int": false },
              { "float": false },
              { "String": true },
              { "boolean": false }
            ]
          },
          {
            "questionId": 3,
            "questionText": "Which of the following are valid Java keywords?",
            "options": [
              { "class": true },
              { "public": true },
              { "inherit": false },
              { "void": true }
            ]
          },
          {
            "questionId": 4,
            "questionText": "Which of the following are primitive data types in Java?",
            "options": [
              { "int": true },
              { "String": false },
              { "double": true },
              { "float": true }
            ]
          },
          {
            "questionId": 5,
            "questionText": "Select all valid access modifiers in Java:",
            "options": [
              { "public": true },
              { "private": true },
              { "protected": true },
              { "internal": false }
            ]
          }
        ]
      }
    }
    ]
  }
]''';
