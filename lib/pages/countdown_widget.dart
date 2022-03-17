import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:viewmodel_example/viewmodel/counter_viewmodel.dart';
import 'package:viewmodel/widget/snapshot_builder.dart';

import '../viewmodel/countdown_viewmodel.dart';

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({Key? key}) : super(key: key);

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  final int _number = 500;
  late TimerViewModel _timerViewModel;

  @override
  void initState() {
    _timerViewModel = TimerViewModel(_number);
    super.initState();
  }

  @override
  void dispose() {
    _timerViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countdown"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SnapshotBuilder<int>(
              broadcast: _timerViewModel.numberStream,
              initialData: _number,
              child: (value) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.stop),
                  onPressed: () {
                    _timerViewModel.stop();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.pause),
                  onPressed: () {
                    _timerViewModel.pause();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () {
                    _timerViewModel.play();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
