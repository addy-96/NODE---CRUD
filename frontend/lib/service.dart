import 'dart:developer';
import 'package:http/http.dart' as http;

class AppServices {
  // Change URI if on emulator or real device
  static final uri = Uri.parse('http://10.0.2.2:3000'); // or your PC's IP

  static Future<http.Response> getUser() async {
    try {
      final res = await http.get(uri);

      log('Status: ${res.statusCode}');
      log('Body: ${res.body}');

      return res;
    } catch (err, stack) {
      log('Error: $err');
      log('Stack: $stack');
      rethrow;
    }
  }
}
