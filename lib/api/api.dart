import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {

  String baseUrl = 'http://25.67.19.232:5000/';

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

  registration(String email, String password) async {
    try {
      final response = await Dio().post('${baseUrl}registration', data: {
        'email': email,
        'password': password
      });
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

}