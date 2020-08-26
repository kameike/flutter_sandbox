import 'package:flutter/material.dart';
import './pages/travel/list.dart';
import './pages/twitter/page.dart';
import './pages/scrollWithAnimation/main.dart';
import './pages/primevideo/page.dart';
import './pages/pageTest/page.dart';
import './pages/inherited/page.dart';
import './pages/provider/page.dart';

void main() {
  runApp(RootPage());
}

class SubPage {
  const SubPage({this.build, this.title, this.timestamp});

  final Widget Function(BuildContext context) build;
  final String title;
  final DateTime timestamp;
}

final pageData = <SubPage>[
  SubPage(
      title: 'copy of timee travel',
      timestamp: DateTime.now(),
      build: (context) {
        return TravelListPage();
      }),
  SubPage(
      title: 'copy of twitter',
      timestamp: DateTime.now(),
      build: (context) {
        return TwitterPage();
      }),
  SubPage(
      title: 'scroll animation',
      timestamp: DateTime.now(),
      build: (context) {
        return AnimateOnScrollFlutter();
      }),
  SubPage(
      title: 'prime video trace',
      timestamp: DateTime.now(),
      build: (context) {
        return PrimeVideoPage();
      }),
  SubPage(
      title: 'page call back test',
      timestamp: DateTime.now(),
      build: (context) {
        return PageingDelegationTest();
      }),
  SubPage(
      title: 'inherited widget',
      timestamp: DateTime.now(),
      build: (context) {
        return CarouselWidget();
      }),
  SubPage(
      title: 'provider',
      timestamp: DateTime.now(),
      build: (context) {
        return ProviderTest();
      }),
];

final kColorShadow = Color.fromARGB(30, 0, 0, 0);
final kColorBackGround = Colors.white;

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
