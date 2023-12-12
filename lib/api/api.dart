import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {

  String baseUrl = 'http://192.168.0.104:5000/';

  login(String email, String password) async {
    try {
      final response = await Dio().post('${baseUrl}login', data: {
        'email': email,
        'password': password
      });
      return response.data['id'];
    } catch(e) {
      return 'Error';
    }
  }

  Future<String> registration(String name, String email, String password) async {
    try {
      debugPrint('name ${name}, email ${email}, password ${password}');
      final response = await Dio().post('${baseUrl}registration', data: {
        'name': name,
        'email': email,
        'password': password
      });
      if (response.data["message"] == 'Name_taken') {
        return 'Name_taken';
      }
      return 'Successfully';
    } catch(e) {
      return 'Error';
    }
  }

  Future<Map<String, dynamic>> showUser(int id) async {
    final response = await Dio().post('${baseUrl}showUser', data: {
      'id': id
    });
    return response.data;
  }

 Future<List> showListMarker(int id) async {
    final response = await Dio().post('${baseUrl}showListMarker', data: {'idUser': id});
    if(response.statusCode == 400) {
      return [{"message": "Error"}];
    }
    return response.data;

  }

}