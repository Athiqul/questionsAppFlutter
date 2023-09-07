class QuestionModel {
  const QuestionModel(this.question, this.guess);
  final String question;
  final List<String> guess;
  //shuffle guess copy to new array then shuffle the guess
  List<String> shuffleGuess() {
    final copy = List.of(guess);
    copy.shuffle();
    return copy;
  }
}
