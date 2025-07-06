// class Question {
//   String questionText;
//   String questionImage;
//   bool questionAnswer;

//   Question ({String q, String i, bool a}) {

//     questionText = q;
//     questionImage = i;
//     questionAnswer = a;
//   }
// }
class Question {
  String questionText;
  String questionImage;
  bool questionAnswer;

  Question({required String q, required String i, required bool a})
    : questionText = q,
      questionImage = i,
      questionAnswer = a;
}
