import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APP',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wt = TextEditingController();
  var ft = TextEditingController();
  var inch = TextEditingController();
  var result = "";
  var bg = Colors.indigo.shade300;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('YOUR BMI'),
      ),
      body: Container(
        color: bg,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: wt,
                  decoration: InputDecoration(
                      label: Text('Enter your weight'),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: ft,
                  decoration: InputDecoration(
                      label: Text('Enter your height in feets'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: inch,
                  decoration: InputDecoration(
                      label: Text('Enter your height in inch'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wti = wt.text.toString();
                      var fti = ft.text.toString();
                      var inchi = inch.text.toString();

                      if (wti != " " && fti != "" && inchi != "") {
                        var a = int.parse(wti);
                        var b = int.parse(fti);
                        var c = int.parse(inchi);
                        var d = b * 12 + c;
                        var e = d * 2.54;
                        var f = e / 100;
                        var bmi = a / (f * f);
                        var msg = "";

                        if (bmi > 25) {
                          msg = "You are Overweight";
                          bg = Colors.orange.shade200;
                        } else if (bmi < 18) {
                          msg = "You are underweight";
                          bg = Colors.red.shade200;
                        } else {
                          msg = "You are healthy";
                          bg = Colors.green.shade200;
                        }
                        setState(() {
                          result = "$msg \n Your BMI is $bmi";
                        });
                        //result = "Your BMI is $bmi";

                      } else {
                        setState(() {
                          result = "pls fill all the required blanks";
                        });
                      }
                    },
                    child: Text('Calculate')),
                Text(result),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
