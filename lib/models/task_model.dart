class Task {
  String title;
  bool isComplet;

  Task({
    required this.title,
    required this.isComplet,
    });

  void isDone() {
    isComplet = !isComplet;
  }
}
