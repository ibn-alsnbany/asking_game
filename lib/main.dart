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
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('اختبار'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
          child: Column(
            children: [
              Image.asset('images/image-1.jpg'),
              SizedBox(height: 20.0),
              Text('عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
              ),
              ),
            ],
          )
          ),
          Expanded(
            
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextButton(
                   style: TextButton.styleFrom(
                    foregroundColor: Colors.white, // لون النص
                    backgroundColor: Colors.indigo,
                    
                   ),
                child: Text('صح',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white, 
                ),
                ),
                onPressed: (){
              
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
                child: Text('خطأ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white, 
                ),
                ),
                onPressed: (){
              
                },
              ),
            ),
            ),
      ],
    );
  }
}

