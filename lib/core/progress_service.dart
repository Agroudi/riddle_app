import 'package:shared_preferences/shared_preferences.dart';

class ProgressService {
  static const String key = 'level_scores';

  static Future<List<int>> loadScores() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key)?.map(int.parse).toList() ??
        List.filled(8, 0);
  }

  static Future<void> saveScores(List<int> scores) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      key,
      scores.map((e) => e.toString()).toList(),
    );
  }
}
