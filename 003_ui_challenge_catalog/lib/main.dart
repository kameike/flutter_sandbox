import 'package:flutter/material.dart';
import './pages/travel/list.dart';

void main() {
  runApp(RootPage());
}

class SubPage {
  const SubPage({this.build, this.title, this.timestamp});

  final Widget Function(BuildContext context) build;
  final String title;
  final DateTime timestamp;
}

final kColorShadow = Color.fromARGB(30, 0, 0, 0);
final kColorBackGround = Colors.white;

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "UI sandbox",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              for (final data in pageData) ComponentCell(data: data)
            ],
          ),
        ),
      ),
    );
  }
}

class ComponentCell extends StatelessWidget {
  const ComponentCell({
    Key key,
    @required this.data,
  }) : super(key: key);

  final SubPage data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: data.build));
      },
      child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: kColorShadow,
                blurRadius: 5,
              )
            ],
            color: kColorBackGround,
          ),
          child: Row(children: [
            Column(children: [Text(data.title)])
          ])),
    );
  }
}

final pageData = <SubPage>[
  SubPage(
      title: 'TestPage1',
      timestamp: DateTime.now(),
      build: (context) {
        return TravelListPage();
      }),
];
