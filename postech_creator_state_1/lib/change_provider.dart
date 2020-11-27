import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePageChangeProvider(),
    );
  }
}

class HomePageChangeProvider extends StatelessWidget {
  const HomePageChangeProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: HomePage4(),
    );
  }
}

class Counter with ChangeNotifier {
  int _centerButtonCount = 0;
  bool _isCenterThreeClicked = false;
  int _count = 0;
  int get count => _count;
  bool get isCenterThreeClicked => _isCenterThreeClicked;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void afterThreeIncrement() {
    _centerButtonCount++;
    _isCenterThreeClicked = false;
    if (_centerButtonCount == 3) {
      _isCenterThreeClicked = true;
      notifyListeners();
    }
  }
}

class HomePage4 extends StatelessWidget {
  const HomePage4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Example'),
        ),
        body: Stack(children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () => context.read<Counter>().increment(),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              child: FloatingActionButton(
                heroTag: null,
                onPressed: () => context.read<Counter>().decrement(),
                tooltip: 'Increment',
                child: const Icon(Icons.remove),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: FloatingActionButton(
                heroTag: null,
                onPressed: () => context.read<Counter>().afterThreeIncrement(),
                tooltip: 'Click three times',
                child: const Text(
                  '3',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('몇 번 클릭'),
                const Count(),
                const Text('곱하기 2'),
                const Count2(),
                const Text('3번 클릭해야 True'),
                const Count3()
              ],
            ),
          ),
        ]));
  }
}

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Counter>().count}',
        style: Theme.of(context).textTheme.headline4);
  }
}

class Count2 extends StatelessWidget {
  const Count2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Counter>().count * 2}',
        style: Theme.of(context).textTheme.headline4);
  }
}

class Count3 extends StatelessWidget {
  const Count3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Text('${context.watch<Counter>().isCenterThreeClicked}',
        style: Theme.of(context).textTheme.headline4);
  }
}
