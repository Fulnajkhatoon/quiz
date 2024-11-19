import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quiz/question.dart';
import 'package:http/http.dart' as http; // Import the QuestionScreen

class QuizSetScreen extends StatefulWidget {
  final String subjectName;

  const QuizSetScreen({Key? key, required this.subjectName}) : super(key: key);

  @override
  _QuizSetScreenState createState() => _QuizSetScreenState();
}

class _QuizSetScreenState extends State<QuizSetScreen> {
  List<dynamic> quizSets = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchQuizSets(widget.subjectName);
  }

  Future<void> fetchQuizSets(String subjectName) async {
    const String apiUrl = 'http://192.168.32.182:3000/quizsets'; // API endpoint

    try {
      final response = await http.get(
        Uri.parse('$apiUrl/$subjectName'), // Subject name in the URL path
      );

      print("API Response Status: ${response.statusCode}");
      print("API Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> quizSetsData = json.decode(response.body);
        setState(() {
          quizSets = quizSetsData;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to fetch quiz sets")),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching quiz sets: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          '${widget.subjectName} Quiz Sets',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
              ),
            )
          : quizSets.isEmpty
              ? Center(
                  child: Text(
                    'No quiz sets available',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: quizSets.length,
                  itemBuilder: (context, index) {
                    final quizSet = quizSets[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          leading: Icon(
                            Icons.quiz,
                            color: Colors.deepPurple,
                            size: 30,
                          ),
                          title: Text(
                            quizSet['setname'] ?? 'Unnamed Set',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          subtitle: Text(
                            'Tap to start the quiz',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          onTap: () {
                            // Pass the setId to the QuestionScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionScreen(
                                  setid: quizSet['setid'],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
