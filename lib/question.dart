import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuestionScreen extends StatefulWidget {
  final int setid; // Pass the quiz set ID to the screen

  const QuestionScreen({Key? key, required this.setid}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<Map<String, dynamic>> questions = [];
  int currentQuestionIndex = 0;
  int? selectedOptionId;
  bool isOptionSelected = false;
  int score = 0;

  @override
  void initState() {
    super.initState();
    fetchQuestions(widget.setid); // Fetch questions when the screen loads
  }

  // Fetch questions and options from the API
  Future<void> fetchQuestions(int setid) async {
    final response = await http.get(Uri.parse('http://192.168.32.182:3000/questions/$setid'));

    if (response.statusCode == 200) {
      List<dynamic> questionData = json.decode(response.body);
      setState(() {
        questions = questionData.map((q) {
          return {
            'questionid': q['questionid'],
            'question_text': q['question_text'],
            'options': q['options']
          };
        }).toList();
      });
    } else {
      setState(() {
        questions = []; // If no data is fetched, set questions as empty
      });
    }
  }

  // Function to calculate the score
  void submitAnswer() {
    setState(() {
      if (selectedOptionId != null) {
        // Check if selected option is correct
        final currentQuestion = questions[currentQuestionIndex];
        final selectedOption = currentQuestion['options'].firstWhere(
            (option) => option['optionid'] == selectedOptionId);

        if (selectedOption['is_correct']) {
          score++; // Increment score if answer is correct
        }
        isOptionSelected = false; // Reset option selected status
        selectedOptionId = null; // Reset selected option
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++; // Move to the next question
        } else {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("Quiz Completed"),
              content: Text("Your score is $score/${questions.length}"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                ),
              ],
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Quiz"),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion['question_text'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ...currentQuestion['options'].map<Widget>((option) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOptionId = option['optionid'];
                    isOptionSelected = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: selectedOptionId == option['optionid']
                        ? Colors.blueAccent
                        : Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    option['option_text'],
                    style: TextStyle(
                      fontSize: 18,
                      color: selectedOptionId == option['optionid']
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
            SizedBox(height: 20),
            if (isOptionSelected)
              ElevatedButton(
                onPressed: submitAnswer,
                child: Text("Submit"),
              ),
          ],
        ),
      ),
    );
  }
}
