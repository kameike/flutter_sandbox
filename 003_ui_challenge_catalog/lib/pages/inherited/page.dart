import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  final pageData = [
    {
      "color": Colors.orange,
      "name": "test1",
    },
    {
      "color": Colors.amber,
      "name": "test1",
    },
    {
      "color": Colors.yellow,
      "name": "test1",
    },
  ];

  @override
  State<CarouselWidget> createState() => CaruselState();
}

class CaruselState extends State<CarouselWidget> {
  @override
  void initState() {
    super.initState();
    data = _PageStateData(page: 0);
  }

  _PageStateData data;

  void pageDidUpdate(int page) {
    setState(() {
      data = _PageStateData(page: page);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageData = widget.pageData;
    return Scaffold(
      backgroundColor: Colors.white,
      body: InheritedPageingSample(
        data: data,
        cotents: pageData,
        onPageChanged: pageDidUpdate,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                width: 200,
                height: 200,
                child: CarouselBackground(),
              ),
              const Counter(),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var page = InheritedPageingSample.of(context, listen: true).data.page;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text("Page$page",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}

class CarouselBackground extends StatelessWidget {
  const CarouselBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build");
    final List<Map<String, Object>> data =
        InheritedPageingSample.of(context).cotents;
    final void Function(int) onPageUpdate =
        InheritedPageingSample.of(context).onPageChanged;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: PageView.builder(
        itemBuilder: (context, index) {
          final color = data[index]["color"] as Color;
          final text = data[index]["name"] as String;
          return ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: color,
                child: Center(
                  child: Text(text,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),
            ),
          );
        },
        itemCount: data.length,
        onPageChanged: onPageUpdate,
      ),
    );
  }
}

class _PageStateData {
  const _PageStateData({
    this.page,
  });

  final int page;
}

class InheritedPageingSample extends InheritedWidget {
  const InheritedPageingSample({
    Key key,
    @required Widget child,
    @required this.data,
    @required this.cotents,
    @required this.onPageChanged,
  }) : super(key: key, child: child);

  final _PageStateData data;
  final List<Map<String, Object>> cotents;
  final void Function(int) onPageChanged;

  @override
  bool updateShouldNotify(InheritedPageingSample old) {
    return old.data.page != data.page;
  }

  static InheritedPageingSample of(BuildContext context,
      {bool listen = false}) {
    return listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedPageingSample>()
        : (context
            .getElementForInheritedWidgetOfExactType<InheritedPageingSample>()
            .widget as InheritedPageingSample);
  }
}
