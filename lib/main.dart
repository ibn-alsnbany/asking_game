import 'package:asking_game/question.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(backgroundColor: Colors.grey, title: Text('اختبار')),
        body: Padding(padding: const EdgeInsets.all(20.0), child: ExamPage()),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Padding> answerResult = [];
  // List<String> questions = [
  //   'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
  //   'القطط هي حيوانات اليفة',
  //   'الصين موجودة في القارة الأفريقية',
  //   'الأرض مسطحه وليست كروية',
  // ];
  // List<String> questionsImage = [
  //   'images/image-1.jpg',
  //   'images/image-2.jpg',
  //   'images/image-3.jpg',
  //   'images/image-4.jpg',
  // ];

  // List<bool> answers = [true, true, false, false];
  List<Question> questionGroup = [
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
  ];
  Question question1 = Question(
    q: 'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
    i: 'images/image-1.jpg',
    a: true,
  );

  int questionsNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: answerResult),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(questionGroup[questionsNumber].questionImage),
              SizedBox(height: 20.0),
              Text(
                questionGroup[questionsNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // لون النص
                backgroundColor: Colors.indigo,
              ),
              child: Text(
                'صح',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed: () {
                bool correctAnswer =
                    questionGroup[questionsNumber].questionAnswer;
                if (correctAnswer == true) {
                  print('اجابة صحيحة');
                  print(question1.questionText);
                  print(question1.questionImage);
                } else {
                  print('اجابة خاطئة ');
                }
                setState(() {
                  questionsNumber++;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // لون النص
                backgroundColor: Colors.deepOrange,
              ),
              child: Text(
                'خطأ',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed: () {
                bool correctAnswer =
                    questionGroup[questionsNumber].questionAnswer;
                if (correctAnswer == false) {
                  print('اجابة صحيحة');
                } else {
                  print('اجابة خاطئة ');
                }

                setState(() {
                  questionsNumber++;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
