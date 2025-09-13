import 'package:flutter_node/user.dart';
import 'package:http/http.dart' as http;

class AppServices {
  static final uri = Uri.parse('http://localhost:8000');

  static Future<bool> createUser(
    String name,
    String email,
    String password,
  ) async {
    try {
      return true;
    } catch (err, st) {
      throw Exception('error while creating user : $err at $st');
    }
  }

  static Future<User> _readUser(String name) async {
    try {
      return User(email: 'adad', phone: 892357892375);
    } catch (err, st) {
      throw Exception('error while creating user : $err at $st');
    }
  }

  static Future<bool> _updateUser(
    String name,
    String email,
    String password,
  ) async {
    try {
      return true;
    } catch (err, st) {
      throw Exception('error while updating user : $err at $st');
    }
  }

  static Future<bool> _deleteUser(String name) async {
    try {
      return true;
    } catch (err, st) {
      throw Exception('error while deleting user : $err at $st');
    }
  }
}
