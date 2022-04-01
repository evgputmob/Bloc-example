import 'package:http/http.dart' as http;
import '../models/bored_activity.dart';

class BoredService {
  static const baseUrl = 'https://www.boredapi.com/api';

  Future<BoredActivity> getBoredActivity() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/activity'));
      await Future.delayed(const Duration(seconds: 1));
      return boredActivityFromJson(response.body);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
