import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyectolab/main.dart';
import 'package:proyectolab/services/manage_http_response.dart';
import '../global_variables.dart';
import '../models/user.dart';
import '../views/auth_screens/login_screen.dart';

class AuthController {
  //method to register a new user
  Future<void> signUpUsers(
      {required context,
        required String email,
        required String fullName,
        required String password}) async {
    try {
      final user = User(
          id: '',
          fullName: fullName,
          email: email,
          state: '',
          city: '',
          locality: '',
          password: password,
          token: '');
      final response = await http.post(Uri.parse('$uri/api/signup'),
          body: userToJson(user),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          });
      manageHttpReponse(
          response: response,
          context: context,
          onSucess: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginScreen();
            },));
            showSnackBar(context, 'Account Successfully Created');
          });
    } catch (e) {
      print("Error: $e");
    }
  }

  //Method for sign in users
  Future<void> signInUsers(
      {required context,
        required String email,
        required String password}) async {
    try {
      final response = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({"email": email, "password": password}),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          });
      manageHttpReponse(
        response: response,
        context: context,
        onSucess: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyApp(),),
                (route) => false,);
          showSnackBar(context, 'Login Successfully');
        },
      );
    } catch (e) {
      print("Error: $e");
    }
  }
}
