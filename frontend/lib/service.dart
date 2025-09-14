import 'dart:developer';

import 'package:flutter_node/user.dart';
import 'package:http/http.dart' as http;

class AppServices {
  static final hostUri = Uri.parse('http://localhost:8000');

  static Future<bool> createUser(
    String name,
    String email,
    int phone,
  ) async {
    try {
      final String endPoint = '/create-user';
      log(hostUri.toString());
      return true;
    } catch (err, st) {
      throw Exception('error while creating user : $err at $st');
    }
  }

  static Future<User> readUser(String name) async {
    try {
      return User(email: 'adad', phone: 892357892375,name: 'aki');
    } catch (err, st) {
      throw Exception('error while creating user : $err at $st');
    }
  }

  static Future<bool> updateUser(
    String? name,
    String? email,
    int? phone,
  ) async {
    try {
      return true;
    } catch (err, st) {
      throw Exception('error while updating user : $err at $st');
    }
  }

  static Future<bool> deleteUser(String name) async {
    try {
      return true;
    } catch (err, st) {
      throw Exception('error while deleting user : $err at $st');
    }
  }
}
