import 'package:flutter/material.dart';
import 'package:quiz/image.dart';
import 'package:quiz/quizset.dart'; // Import SetScreen here

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
            onPressed: () {},
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
            // Flutter Button
            SkillButton(
              icon: Image.asset(
                book,
                height: 100.0,
                width: 100.0,
              ),
              label: 'Flutter',
              onTap: () {
                // Navigate to SetScreen when this button is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SetScreen()),
                );
              },
            ),

            // Python Button
            SkillButton(
              icon: Image.asset(
                python,
                height: 100.0,
                width: 100.0,
              ),
              label: 'Python',
              onTap: () {},
            ),

            // PHP Button
            SkillButton(
              icon: Image.asset(
                php,
                height: 100.0,
                width: 100.0,
              ),
              label: 'PHP',
              onTap: () {},
            ),

            // Android Button
            SkillButton(
              icon: Image.asset(
                android,
                height: 100.0,
                width: 100.0,
              ),
              label: 'Android',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Skill Button Widget
class SkillButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final Function onTap;

  const SkillButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

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
              icon,
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
