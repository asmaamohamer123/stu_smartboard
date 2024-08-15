class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  String? selectedAnswer;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    this.selectedAnswer,
  });
}