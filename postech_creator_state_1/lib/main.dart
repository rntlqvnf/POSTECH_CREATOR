import 'package:flutter/material.dart';
import 'package:postech_creator_state_1/multi_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePageProvider(),
    );
  }
}

class MyHomePageProvider extends StatelessWidget {
  const MyHomePageProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.value(value: 1, child: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Provider로 전달받은 값은',
              ),
              Text(
                '${context.watch<int>()}', //Q. 왜 watch를 쓸까?
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => HomePageMultiProvider())),
        ));
  }
}
