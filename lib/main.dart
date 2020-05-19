import 'package:flutter/material.dart';
import './questions.dart';
import './answers.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0 ;
  var totalscore=0;

  void change(int score){
    totalscore += score;
    setState(() {
      index=index+1;
    });
  }

  String get result{
    String resultText;
    if(totalscore<=30){
      resultText='Hey, We\'re Same !';
    }
    if(totalscore<=25){
      resultText='We\'re Same somewhere !';
    }
    if(totalscore<=15){
      resultText='Yeah Cool, but We\'re not Same !';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    var ques = [{
      'question': 'What\'s your favourite Color ?' ,
      'answer': [{'text':'Black','score':10},
        {'text':'Grey','score':5},
        {'text':'White','score':5},
      ],
    },
      {
      'question': 'What\'s your favourite Cuisine ?' ,
      'answer': [{'text':'Chinese','score':5},
        {'text':'Indian','score':10},
        {'text':'Mughal','score':5},
      ],
    },
      {
      'question': 'NetFlix OR YouTube OR Prime ?' ,
      'answer': [{'text':'NetFlix','score':10},
        {'text':'YouTube','score':5},
        {'text':'Prime','score':5},
      ],
    },];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text('QUIZY',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
        body: index < ques.length ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Questions(ques[index]['question'],
            ),
            ...(ques[index]['answer'] as List<Map<String, Object>>).map((answer) {
              return Answers( () => change(answer['score']), answer['text']);
            }).toList()
            ],
        ) :
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(result,
            style: TextStyle(
              color: Colors.blue[600],
              fontSize: 35,
            ),textAlign: TextAlign.center,
          ),
        SizedBox(
          height: 20,
        ),
        FlatButton(onPressed: () {
          setState(() {
            index = 0 ;
            totalscore = 0 ;
          });
        },
          color: Colors.white,
          child: Text('Reset',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),),
        ),
        ],),
      ),
    );
  }
}
