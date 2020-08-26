import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class ProviderTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _Label(),
              const CountUpButton(),
              const CounteDownButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class CounteDownButton extends StatelessWidget {
  const CounteDownButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => context.read<Counter>().decrement(),
        child: const Button(label: "decrement"),
      ),
    );
  }
}

class CountUpButton extends StatelessWidget {
  const CountUpButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => context.read<Counter>().increment(),
        child: const Button(label: "increment"),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: ColoredBox(
        color: Colors.amber,
        child: SizedBox(
          width: 200,
          height: 60,
          child: Center(child: Text(label, textAlign: TextAlign.center)),
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counter = context.watch<Counter>();
    return Text("couter is ${counter.count}");
  }
}

class Counter with ChangeNotifier {
  int _count = 1;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
