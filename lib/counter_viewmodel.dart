import 'package:viewmodel/broadcast_stream_controller.dart';
import 'package:viewmodel/viewmodel.dart';

class CounterViewModel extends ViewModel {
  CounterViewModel();

  final number = BroadcastStream<int>();

  Future<int> _increment(int value  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return Future.value( value +1);
  }

  increment(int value ) {
    executeFuture(_increment(value), broadcastStreamController: number);
  }
}
