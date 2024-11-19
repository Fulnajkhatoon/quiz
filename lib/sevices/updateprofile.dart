import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quiz/modules/updaterequest.dart';
import 'package:http/http.dart' as http;

Future<void> updateUser(Profile user, BuildContext context) async {
  const String apiUrl = 'http://192.168.32.179:3000/update-profile';

  try {
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(user.toJson()), // Pass user object as JSON
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile updated successfully!")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to update profile")));
    }
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Error: $e")));
  }
}
