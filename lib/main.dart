import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone Demo',
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
      home: const MyHomePage(title: 'Xylophone'),
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
  void playSound(int noteNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$noteNumber.wav'));
  }

  Widget xyloButton(int noteNumber, Color buttonColor) {
    return Expanded(
      child: MaterialButton(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            color: buttonColor,
          ),
          onPressed: () {
            playSound(noteNumber);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              xyloButton(1, Colors.red),
              xyloButton(2, Colors.orange),
              xyloButton(3, Colors.yellow),
              xyloButton(4, Colors.green),
              xyloButton(5, Colors.teal),
              xyloButton(6, Colors.blue),
              xyloButton(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
