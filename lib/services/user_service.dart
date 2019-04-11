import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:ict_staff_info_demo/models/user_model.dart';
import 'dart:io';

String url = 'http://localhost:800/api/auth';
String token = '';

Future<List<User>> getAllUsers() async {
  final response = await http.get(url);
  print(response.body);
  return allUsersFromJson(response.body);
}

Future<User> getUser() async{
  final response = await http.get('$url/user');
  return userFromJson(response.body);
}

Future<http.Response> createPost(User User) async{
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: userToJson(User)
  );
  return response;
}
Future<http.Response> login(User User) async{
  final response = await http.post('$url/login',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: userToJson(User)
  );
  return response;
}