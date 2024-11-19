import 'package:flutter/material.dart';
import 'package:quiz/quizset.dart';
import 'package:quiz/updateprofile.dart'; // Import the QuizSetScreen

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2), // Light grey background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Center(
          child: Text(
            'Test Your Skills',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PersonScreen(email: '',)),
                );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          children: <Widget>[
            SkillButton(
              label: 'Flutter',
              onTap: () {
                // Navigate to Quiz Set screen with 'Flutter' as subject
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizSetScreen(subjectName: 'Flutter'),
                  ),
                );
              },
            ),
            SkillButton(
              label: 'Python',
              onTap: () {
                // Navigate to Quiz Set screen with 'Python' as subject
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizSetScreen(subjectName: 'Python'),
                  ),
                );
              },
            ),
            SkillButton(
              label: 'Android',
              onTap: () {
                // Navigate to Quiz Set screen with 'Python' as subject
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizSetScreen(subjectName: 'Android'),
                  ),
                );
              },
            ),SkillButton(
              label: 'PHP',
              onTap: () {
                // Navigate to Quiz Set screen with 'Python' as subject
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizSetScreen(subjectName: 'PHP'),
                  ),
                );
              },
            ),
            // Add more subjects here as needed
          ],
        ),
      ),
    );
  }
}

// Reusable Skill Button Widget
class SkillButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const SkillButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.book, size: 60), // Placeholder icon
              const SizedBox(height: 10.0),
              Text(
                label,
                style: const TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
        height: 180.0, // Adjusted container height
      ),
    );
  }
}
