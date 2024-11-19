// import 'dart:convert';

// import 'package:flutter_application_1/modules/loginrequest.dart';
// import 'package:flutter_application_1/modules/questionrequest.dart';
// import 'package:http/http.dart' as http;

// Future<List<Subject>> fetchSubjects() async {
//   const String apiUrl = 'http://192.168.33.34:3000/subjects'; // Your API URL for subjects

//   try {
//     final response = await http.get(Uri.parse(apiUrl));
//     if (response.statusCode == 200) {
//       final List subjectsData = json.decode(response.body);
//       return subjectsData.map((json) => Subject.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load subjects');
//     }
//   } catch (e) {
//     throw Exception('Error: $e');
//   }
// }
// Future<List<QuizSet>> fetchQuizSets(int subjectId) async {
//   final String apiUrl = 'http://192.168.32.179/subjects/$subjectId/quizsets'; // Adjusted API for quiz sets

//   try {
//     final response = await http.get(Uri.parse(apiUrl));
//     if (response.statusCode == 200) {
//       final List quizSetsData = json.decode(response.body);
//       return quizSetsData.map((json) => QuizSet.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load quiz sets');
//     }
//   } catch (e) {
//     throw Exception('Error: $e');
//   }
// }

// Future<List<Question>> fetchQuestions(int setId) async {
//   final String apiUrl = 'http://192.168.33.34:3000/sets/$setId/questions';

//   try {
//     final response = await http.get(Uri.parse(apiUrl));
//     if (response.statusCode == 200) {
//       final List questionsData = json.decode(response.body);
//       return questionsData.map((json) => Question.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load questions');
//     }
//   } catch (e) {
//     throw Exception('Error: $e');
//   }
// }

