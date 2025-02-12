import 'package:flutter/material.dart';
import 'package:proyectolab/views/components/main_button.dart';
import '../components/my_text_formfield.dart';
import 'main_screen.dart';
import 'register_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class UserToken {
  final String token;
  const UserToken({required this.token});
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<UserToken?> loginUser(String email, String password) async{
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/api/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "email": email,
        "password": password
      }),
    );
    if (response.statusCode == 200){
      return UserToken(token: jsonDecode(response.body)['token']);
    }
    else{
      return null;
    }
  }
  
  void login() async {
    if (_formKey.currentState!.validate()) {
      // Ejecutar el proceso de login
      final userToken = await loginUser(emailController.text,passwordController.text);
      if(userToken != null){
        Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context)=> MainScreen(),),
              (route)=> false,);
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Login failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade300,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login to your Account',
                    style: TextStyle(
                      fontSize: 23,
                      color: Color(0xff0d120e),
                    ),
                  ),
                  MyTextFormField(
                    controller: emailController,
                    obscureText: false,
                    prefixIcon: Icons.email_outlined,
                    labelText: "Enter your Email",
                    keyboardType: TextInputType.emailAddress,
                    hintText: "user@gmail.com",
                  ),
                  SizedBox(height: 20),
                  MyTextFormField(
                    controller: passwordController,
                    obscureText: true,
                    prefixIcon: Icons.password_outlined,
                    labelText: "Enter your password",
                    keyboardType: TextInputType.text,
                    hintText: "********",
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: login,
                    child: MainButton(buttonText: 'Login', onTap: login),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Need an account?"),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterScreen()),
                          );
                        },
                        child: Text(
                          "Register Here",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff130fba),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
