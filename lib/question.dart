import 'package:flutter/material.dart';
import 'package:quiz/score.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int score = 0; // Track score
  int currentQuestionIndex = 0; // Track current question
  int? selectedAnswerIndex; // Track selected answer index
  List<String> questions = [
    'What is a widget in flutter?',
    // Add more questions as needed
  ];
  List<List<String>> options = [
    [
      'A building block of the user interface',
      'A programming language',
      'A UI framework',
      'None of the above'
    ],
  ];
  List<bool> correctAnswers = [true, false, false, false]; // Correct answers

  void _selectAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index; // Update selected answer index
    });
  }

  void _submitQuiz() {
    if (selectedAnswerIndex != null) {
      if (correctAnswers[selectedAnswerIndex!]) {
        score++; // Increment score if the answer is correct
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScoreScreen(score: score)),
      );
    } else {
      // Show a message if no answer is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an answer')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text(
            'Questions',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Question ${currentQuestionIndex + 1}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[600],
                ),
              ),
              SizedBox(height: 20),
              Text(
                questions[currentQuestionIndex],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: ListView.builder(
                  itemCount: options[currentQuestionIndex].length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: _buildAnswerOption(
                        options[currentQuestionIndex][index],
                        index,
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle next button action (if needed)
                    },
                    child: Text('Next'),
                  ),
                  ElevatedButton(
                    onPressed: _submitQuiz,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerOption(String text, int index) {
    bool isSelected = selectedAnswerIndex == index;
    return ElevatedButton(
      onPressed: () {
        _selectAnswer(index);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        textStyle: TextStyle(fontSize: 18),
        minimumSize: Size(double.infinity, 0), // Full width button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.pink[200]!, width: 1),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
