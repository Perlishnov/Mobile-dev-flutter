import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}
class User{
  final String name;
  final String email;
  final String password;
  const User({required this.name, required this.email, required this.password});
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<User?> signup (String name, String email, String password) async{
   final response = await http.post(
     Uri.parse('http://10.0.2.2:3000/api/signup/'),
     headers: <String, String>{
       'Content-Type': 'application/json; charset=UTF-8',
     },
     body: jsonEncode({
       "fullName": name,
       "email": email,
       "password": password
     }),
   );
   if (response.statusCode == 200){
     return User(
         name: jsonDecode(response.body)['fullName'],
         email: jsonDecode(response.body)['email'],
         password: jsonDecode(response.body)['password']);
   }
   else{
     return null;
   }
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      // Aquí puedes manejar el registro del usuario
      final user = await signup (_nameController.text,_emailController.text, _passwordController.text);
      if(user != null){
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
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Full Name"),
                validator: (value) => value!.isEmpty ? "Enter your name" : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.contains("@") ? null : "Enter a valid email",
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) => value!.length >= 6 ? null : "Password must be at least 6 characters",
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                child: Text("Register"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
