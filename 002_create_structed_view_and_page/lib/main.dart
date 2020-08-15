import 'package:flutter/material.dart';
import './components/list.dart';

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
            return ProfileList(
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
