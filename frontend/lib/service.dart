import 'dart:developer';
import 'package:http/http.dart' as http;

class AppServices {
  static final uri = Uri.parse('http://10.0.2.2:3000');

  static Future<http.Response> getHome() async {
    try {
      final url = Uri.parse('$uri/');
      final res = await http.get(url);
      log('--------------------------');
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
