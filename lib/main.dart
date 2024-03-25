import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hello World App')),
        body: Center(
          child: PlatformText(),
        ),
      ),
    );
  }
}

class PlatformText extends StatefulWidget {
  @override
  _PlatformTextState createState() => _PlatformTextState();
}

class _PlatformTextState extends State<PlatformText> {
  static const platform = MethodChannel('helloWorld');

  String message = 'Hello World';

  @override
  void initState() {
    super.initState();
    getMessage();
  }

  Future<void> getMessage() async {
    String platformMessage;
    try {
      print("--------------1");
      final String result = await platform.invokeMethod('getMessage');
      platformMessage = 'Result: $result';
      print(platformMessage);
      print("--------------2");
    } on PlatformException catch (e) {
      print("--------------3");
      platformMessage = 'Failed to get message: ${e.message}';
      print(platformMessage);
      print("--------------4");
    }

    setState(() {
      message = platformMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
