import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postech_creator_state_1/state_provider.dart';
import 'package:provider/provider.dart';

class HomePageMultiProvider extends StatelessWidget {
  const HomePageMultiProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<int>.value(value: 100),
        Provider<String>.value(value: 'Hello world'),
        Provider<double>.value(value: 10.2)
      ],
      child: HomePage2(),
    );
  }
}

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ProviderInt()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => HomePageStateProvider())),
      ),
    );
  }
}

class ProviderInt extends StatelessWidget {
  const ProviderInt({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Provider로 전달받은 int 값은',
        ),
        Text(
          '${context.watch<int>()}',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
