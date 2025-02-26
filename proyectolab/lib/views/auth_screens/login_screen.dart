import 'package:flutter/material.dart';
import 'package:proyectolab/controllers/auth_controller.dart';
import 'package:proyectolab/views/components/main_button.dart';
import '../components/my_text_formfield.dart';
import 'register_screen.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController _authController = AuthController();
  
  void login() async {
    if (_formKey.currentState!.validate()) {
      // Ejecutar el proceso de login
      if(_formKey.currentState!.validate()){
        await _authController.signInUsers(context: context, email: emailController.text, password: passwordController.text).whenComplete((){
          setState(() {
            _formKey.currentState!.reset();
          });
        });
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
