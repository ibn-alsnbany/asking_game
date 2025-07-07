import 'question.dart';

class AppBrain {
  int _questionsNumber = 0;
  List<Question> _questionGroup = [
    Question(
      q: 'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
      i: 'images/image-1.jpg',
      a: true,
    ),
    Question(q: 'القطط هي حيوانات اليفة', i: 'images/image-2.jpg', a: true),
    Question(
      q: 'الصين موجودة في القارة الأفريقية',
      i: 'images/image-3.jpg',
      a: false,
    ),
    Question(q: 'الأرض مسطحه وليست كروية', i: 'images/image-4.jpg', a: false),
    Question(
      q: 'بإستطاعة الإنسان البقاء على قيد الحياة بدون أكل اللحوم',
      i: 'images/image-5.jpg',
      a: true,
    ),
    Question(
      q: 'الشمس تدور حول الأرض والأرض تدور حول القمر',
      i: 'images/image-6.jpg',
      a: false,
    ),
    Question(q: 'الحيوانات لا تشعر بالألم', i: 'images/image-7.jpg', a: false),
  ];
  void nextQuestion() {
    if (_questionsNumber < _questionGroup.length - 1) {
      _questionsNumber++;
    }
  }

  String getQuestionText() {
    return _questionGroup[_questionsNumber].questionText;
  }

  String getQuestionImage() {
    return _questionGroup[_questionsNumber].questionImage;
  }

  bool getQuestionAnswer() {
    return _questionGroup[_questionsNumber].questionAnswer;
  }
}
