import 'package:flutter/material.dart';
import 'package:viewmodel/viewmodel.dart';
import 'package:viewmodel_example/pages/future_increment_stream.dart';
import 'package:viewmodel_example/pages/future_increment_widget.dart';
import 'package:viewmodel_example/pages/countdown_widget.dart';
import 'package:viewmodel_example/viewmodel/counter_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ViewModel Example",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ViewModel Example"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FutureIncrementStream()),
                  );
                },
                child: const Text('Future Stream'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FutureIncrementWidget()),
                  );
                },
                child: const Text('Future Widget'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CountdownWidget()),
                  );
                },
                child: const Text('Countdown'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
