import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Transparent gesture in stack'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool ifTap = true;

  void _ifTap(){
      setState(() {ifTap = false;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            _ifTap();
          },
          child: Stack(
            children: <Widget>[
                if (ifTap)
                  TransparentWidget()
            ],
          )
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TransparentWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
                'Вы увидите, когда ваш заказ будет выполнен',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white
                )
            ),
            SizedBox(height: 20,),
            Text(
              'мне всё понятно,\nнажмите чтобы продолжить',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                  color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

