import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postech_creator_state_1/main.dart';
import 'package:postech_creator_state_1/student_state.dart';
import 'package:provider/provider.dart';

class HomePageStateProvider extends StatelessWidget {
  const HomePageStateProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Student_State>.value(
            value: Student_State(age: 20, name: '하재현', studentId: 20180673)),
        Provider<Student_State>.value(
            value: Student_State(age: 20, name: '이상오', studentId: 20202020)),
      ],
      child: HomePage3(),
    );
  }
}

class HomePage3 extends StatelessWidget {
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
                'Provider로 전달받은 이름은',
              ),
              Text(
                '${context.watch<Student_State>().name}',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'Provider로 전달받은 나이는',
              ),
              Text(
                '${context.watch<Student_State>().age}',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'Provider로 전달받은 학번은',
              ),
              Text(
                '${context.watch<Student_State>().studentId}',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'Provider로 전달받은 전체 정보는',
              ),
              Text(
                '${context.watch<Student_State>().getFullInformation()}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MyHomePageProvider())),
        ));
  }
}
