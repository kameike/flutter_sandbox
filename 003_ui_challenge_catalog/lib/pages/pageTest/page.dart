import 'package:flutter/material.dart';

class PageingDelegateSample extends StatefulWidget {
  PageingDelegateSample({Key key}) : super(key: key);

  _PagingDelegateState createState() => _PagingDelegateState();
}

class _PagingDelegateState extends State<PageingDelegateSample> {
  PageController _pageController;
  int page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    print("inited");
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("$page",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: 200,
                height: 200,
                child: PageView.builder(
                  onPageChanged: (p) {
                    setState(() {
                      page = p;
                    });
                  },
                  controller: _pageController,
                  itemBuilder: (cotext, index) {
                    if (index == 0) {
                      return Container(color: Colors.teal);
                    }
                    if (index == 1) {
                      return Container(color: Colors.pink);
                    }
                    if (index == 2) {
                      return Container(color: Colors.cyan);
                    }
                    if (index == 3) {
                      return Container(color: Colors.amber);
                    }
                    if (index == 4) {
                      return Container(color: Colors.orange);
                    }
                  },
                  itemCount: 5,
                ),
              ),
            ),
            Container(
              width: 80,
              height: 50,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                        width: 10,
                        height: 10,
                        color: Colors.black.withAlpha(page == 0 ? 200 : 50)),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                        width: 10,
                        height: 10,
                        color: Colors.black.withAlpha(page == 1 ? 200 : 50)),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                        width: 10,
                        height: 10,
                        color: Colors.black.withAlpha(page == 2 ? 200 : 50)),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                        width: 10,
                        height: 10,
                        color: Colors.black.withAlpha(page == 3 ? 200 : 50)),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                        width: 10,
                        height: 10,
                        color: Colors.black.withAlpha(page == 4 ? 200 : 50)),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageingDelegationTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageingDelegateSample(),
    );
  }
}
