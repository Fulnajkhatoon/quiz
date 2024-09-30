import 'package:flutter/material.dart';
import 'dashboard.dart'; // Ensure this is the correct path

class ScoreScreen extends StatelessWidget {
  final int score; // Score parameter

  const ScoreScreen({super.key, required this.score}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F7), // Light grey background
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context); // Go back to previous screen
                    },
                  ),
                  Text(
                    'Score',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 40), // Placeholder for balance
                ],
              ),
            ),
            SizedBox(height: 100.0),
            Center(
              child: _buildScoreCard(context), // Pass context here
            ),
            Spacer(), // Pushes the score card towards the top
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 100),
              // painter: BottomLeftPinkShape(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreCard(BuildContext context) {
    // Accept context
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: 300.0,
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Are Pass!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'You Have Scored',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '$score/10', // Display the score
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DashboardScreen(), // Ensure this is correct
                  ),
                );
              },
              child: Text('Home'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
