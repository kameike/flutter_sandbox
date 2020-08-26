import 'package:flutter/material.dart';

class AnimateOnScrollFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          List(maxSize: 200, size: 10),
          List(maxSize: 100, size: 5),
          List(maxSize: 400, size: 20),
        ],
      ),
    );
  }
}

class List extends StatelessWidget {
  const List({
    Key key,
    @required this.maxSize,
    @required this.size,
  }) : super(key: key);

  final double maxSize;
  final int size;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxSize,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 16 / 9,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.teal.withAlpha(255 - index * size),
            child: Text('grid item $index'),
          );
        },
        childCount: (255 / size).toInt(),
      ),
    );
  }
}
