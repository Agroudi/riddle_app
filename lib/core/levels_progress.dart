class LevelProgress {
  final int score;

  LevelProgress(this.score);

  int get stars {
    if (score >= 90) return 3;
    if (score >= 70) return 2;
    if (score >= 50) return 1;
    return 0;
  }

  bool get unlocked => score >= 50;
}
