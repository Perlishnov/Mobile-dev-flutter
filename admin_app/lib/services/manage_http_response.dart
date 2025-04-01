import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void manageHttpReponse({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSucess
}){
  switch(response.statusCode){
    case 200:
      onSucess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
    case 500:
      showSnackBar(context, jsonDecode(response.body)['err']);
  }
}

void showSnackBar(BuildContext context, String title){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(title)));
}