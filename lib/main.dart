import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

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
  List<Widget> answerResult = [];
  int rightAnswers = 0;

  void checkAnswer(bool whatUserPicked) {
    bool correctAnswer = appBrain.getQuestionAnswer();
    setState(() {
      if (whatUserPicked == correctAnswer) {
        rightAnswers++;
        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(Icons.thumb_up, color: Colors.green),
          ),
        );
      } else {
        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(Icons.thumb_down, color: Colors.red),
          ),
        );
      }

      if (appBrain.isFinshed() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "انتعاء الاختبار",
          desc: "لقد أجبت على $rightAnswersأسئلة صحيحة من 7أسئلة",
          buttons: [
            DialogButton(
              child: Text(
                "ابدء من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            ),
          ],
        ).show();
        appBrain.reset();

        answerResult = [];

        rightAnswers = 0;
      } else {
        appBrain.nextQuestion();
      }
    });
  }

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
              Image.asset(appBrain.getQuestionImage()),
              SizedBox(height: 20.0),
              Text(
                appBrain.getQuestionText(),
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
                checkAnswer(true);
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
                checkAnswer(false);
              },
            ),
          ),
        ),
      ],
    );
  }
}
