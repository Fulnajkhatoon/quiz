class Subject {
  final String subjectName;

  Subject({
    required this.subjectName,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      subjectName: json['subjectName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subjectName': subjectName,
    };
  }
}
