import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TestViewComponents(),
    );
  }
}

class TestViewComponents extends StatelessWidget {
  Widget build(BuildContext context) {
    var data = [
      {
        "icon": "https://github.com/identicons/bbb.png",
        "name": "bbb",
        "description": "this is the description",
      },
      {
        "icon": "https://github.com/identicons/ccc.png",
        "name": "ccc",
        "description": "this is the description",
      },
      {
        "icon": "https://github.com/identicons/100.png",
        "name": "100",
        "description": "this is the description",
      },
      {
        "icon": "https://github.com/identicons/101.png",
        "name": "101",
        "description": "this is the description",
      },
      {
        "icon": "https://github.com/identicons/108.png",
        "name": "108",
        "description": "this is the description",
      },
      {
        "icon": "https://github.com/identicons/110.png",
        "name": "110",
        "description": "this is the description",
      },
      {
        "icon": "https://github.com/identicons/109.png",
        "name": "109",
        "description": "this is the description",
      },
      {
        "icon": "https://github.com/identicons/108.png",
        "name": "108",
        "description": "this is the description",
      },
      {
        "icon": "https://github.com/identicons/107.png",
        "name": "107",
        "description": "this is the description",
      },
      {
        "icon": "https://github.com/identicons/106.png",
        "name": "106",
        "description": "this is the description",
      },
      {
        "icon": "https://github.com/identicons/105.png",
        "name": "105",
        "description": "this is the description",
      },
      {
        "icon": "https://github.com/identicons/104.png",
        "name": "104",
        "description": "this is the description",
      },
      {
        "icon": "https://github.com/identicons/103.png",
        "name": "103",
        "description": "this is the description",
      },
      {
        "icon": "https://github.com/identicons/102.png",
        "name": "102",
        "description": "this is the description",
      },
      {
        "icon":
            'https://pbs.twimg.com/profile_images/378800000544535184/9bd879417976fbfc5477155fddd7ca74_400x400.png',
        "name": 'kameike',
        "description": 'this is the description',
      }
    ];

    return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            var d = data[index];
            return NewWidget(
              imageUrl: d["icon"],
              name: d["name"],
              description: d["description"],
            );
          },
          itemCount: data.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.transparent,
          ),
        ));
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
    this.name,
    this.imageUrl,
    this.description,
  }) : super(key: key);

  final String name;
  final String imageUrl;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 7,
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Container(
                        width: 80,
                        height: 80,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000)),
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ]),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Text(name,
                          style: Theme.of(context).textTheme.headline4),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        description,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ' have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
