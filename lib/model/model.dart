class Category {
  final String name;
  final String image;
  final List<QuizSet> quizSets;
  Category({required this.name, required this.image, required this.quizSets});
}

class QuizSet {
  final String name;
  final List<QuizSet> questions;
  QuizSet({required this.name, required this.questions});
}

class Questions {
  final String question;
  final List<QuizSet> opetion;
  int selectedIndex;
  Questions(
      {required this.question,
      required this.opetion,
      required this.selectedIndex});
}
