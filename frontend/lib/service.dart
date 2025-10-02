import 'dart:convert';

import 'package:flutter_node/user.dart';
import 'package:http/http.dart' as http;

class AppServices {
  static final hostUri = Uri.parse('http://10.48.189.64:3000');

  static Future<bool> createUser(User user) async {
    try {
      final String endPoint = '/create-user';

      final data = jsonEncode(user.toJson());

      final url = Uri.parse('$hostUri$endPoint');

      final res = await http.put(url, body: data);

      return true;
    } catch (err, st) {
      throw Exception('error while creating user : $err at $st');
    }
  }

  static Future<User> readUser(String name) async {
    try {
      return User(email: 'adad', phone: '892357892375', name: 'aki');
    } catch (err, st) {
      throw Exception('error while creating user : $err at $st');
    }
  }

  static Future<bool> updateUser(
    String? name,
    String? email,
    String? phone,
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
