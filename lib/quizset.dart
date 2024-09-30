import 'package:flutter/material.dart';
import 'package:quiz/question.dart';

class SetScreen extends StatelessWidget {
  const SetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Center(
          child: Text(
            'Flutter Quiz Set',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Quiz Set 1 Button
            QuizSetButton(
              label: 'Quiz Set 1',
              onTap: () {
                // Navigate to QuestionScreen when Quiz Set 1 is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuestionScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0), // Spacing between buttons
            // Quiz Set 2 Button
            QuizSetButton(
              label: 'Quiz Set 2',
              onTap: () {
                // Add navigation or other actions for Quiz Set 2 here
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF2F2F2), // Light grey background color
    );
  }
}

class QuizSetButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const QuizSetButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 60.0, // Adjust the height as per your design
        width: double.infinity, // Makes the button stretch horizontally
        decoration: BoxDecoration(
          color: const Color(0xFFDCDCDC), // Grey button background
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18.0, // Font size of the button label
              color: Colors.black, // Text color
            ),
          ),
        ),
      ),
    );
  }
}

// Create the QuestionScreen page
