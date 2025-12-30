import 'package:shared_preferences/shared_preferences.dart';

class ProgressService {
  static const String key = 'level_scores';

  static Future<List<int>> loadScores() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(key);

    if (data == null)
    {
      final initial = List.filled(8, 0);
      await saveScores(initial);
      return initial;
    }

    return data.map(int.parse).toList();
  }

  static Future<void> saveScores(List<int> scores) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      key,
      scores.map((e) => e.toString()).toList()
    );
  }
}