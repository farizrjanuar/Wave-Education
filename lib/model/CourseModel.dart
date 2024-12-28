// Class Course
// import 'package:wave_education/model/Modules.dart';

class Course {
  int courseID;
  String title;
  String description;
  // double progress;
  // List<Modules> modules;

  Course({
    required this.courseID,
    required this.title,
    required this.description,
    // required this.progress,
    // required this.modules,
  });

  // from json

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseID: json['courseId'],
      title: json['title'],
      description: json['description'],
      // progress: json[''],
      // modules: List<Modules>.from(
      //     json['modulesDTO'].map((module) => Modules.fromJson(module))),
    );
  }

  // Methods
  void setCourseID(int id) {
    courseID = id;
  }

  void setTitle(String title) {
    this.title = title;
  }

  void setDescription(String description) {
    this.description = description;
  }

  // void setProgress(double progress) {
  //   this.progress = progress;
  // }

  int getCourseID() => courseID;

  String getTitle() => title;

  String getDescription() => description;

  // double getProgress() => progress;

  void startCourse() {
    print("Course '$title' has started!");
  }
}
