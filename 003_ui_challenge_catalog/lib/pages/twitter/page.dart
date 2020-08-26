import 'package:flutter/material.dart';

final themeColor = Color.fromARGB(255, 29, 161, 242);
final iconSize = 80.0;
final baseMargin = 12.0;
final double backgroudRetio = 16 / 6;
final List<String> _tabs = ['Tab 1', 'Tab 2', 'Tab 3'];

class TwitterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = {
      "name": "かめいけ",
      "id": "kameike",
      "description":
          "タイミーのCTOやってます。 理想的なフローで理想的なチームで理想的なプロダクトをつくりたい。エンジニアリング、サービス設計、組織やチームワークについて情報を呟きます。リーンに始まりものづくりのプロセスが好きです。 趣味で絵やgoとかswiftをやっていきます",
      "place": "発言は個人のものランド",
      "birthday": "1992年12月25日",
      "start": "2009年9月からTwitterを利用しています",
      "start": "2009年9月からTwitterを利用しています",
      "follower": "1,508",
      "followee": "2,019",
      "background":
          "https://pbs.twimg.com/profile_banners/76262342/1581604299/1500x500"
    };

    return Scaffold(
      body: Container(
        child: MyStatelessWidget(),
        color: Colors.white,
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = {
      "name": "かめいけ",
      "id": "kameike",
      "description":
          "タイミーのCTOやってます。 理想的なフローで理想的なチームで理想的なプロダクトをつくりたい。エンジニアリング、サービス設計、組織やチームワークについて情報を呟きます。リーンに始まりものづくりのプロセスが好きです。 趣味で絵やgoとかswiftをやっていきます",
      "place": "発言は個人のものランド",
      "birthday": "1992年12月25日",
      "start": "2009年9月からTwitterを利用しています",
      "start": "2009年9月からTwitterを利用しています",
      "follower": "1,508",
      "followee": "2,019",
      "background":
          "https://pbs.twimg.com/profile_banners/76262342/1581604299/1500x500"
    };

    var tab = TabBar(
      tabs: _tabs.map((String name) => Tab(text: name)).toList(),
      indicatorColor: themeColor,
      labelColor: themeColor,
      unselectedLabelColor: Colors.grey,
    );

    return DefaultTabController(
      length: _tabs.length, // This is the number of tabs.
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // These are the slivers that show up in the "outer" scroll view.

          return <Widget>[
            SliverPersistentHeader(
              delegate: _StickyTabBarDelegate(
                LayoutBuilder(
                  builder: (context, contstraint) {
                    return Container(
                      color: Color.fromARGB(
                          255, 255, 255, contstraint.maxHeight.toInt() % 255),
                    );
                  },
                ),
              ),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Header(data: data),
            ),
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverToBoxAdapter(
                child: SizedBox.shrink(),
              ),
            ),
            SliverPersistentHeader(
              delegate: StickySlivereDelegate(
                maxExtent: tab.preferredSize.height,
                minExtent: tab.preferredSize.height,
                contents: tab,
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          // These are the contents of the tab views, below the tabs.
          children: _tabs.map((String name) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                // This Builder is needed to provide a BuildContext that is
                // "inside" the NestedScrollView, so that
                // sliverOverlapAbsorberHandleFor() can find the
                // NestedScrollView.
                builder: (BuildContext context) {
                  return CustomScrollView(
                    // The "controller" and "primary" members should be left
                    // unset, so that the NestedScrollView can control this
                    // inner scroll view.
                    // If the "controller" property is set, then this scroll
                    // view will not be associated with the NestedScrollView.
                    // The PageStorageKey should be unique to this ScrollView;
                    // it allows the list to remember its scroll position when
                    // the tab view is not on the screen.
                    key: PageStorageKey<String>(name),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        // This is the flip side of the SliverOverlapAbsorber
                        // above.
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(8.0),
                        // In this example, the inner scroll view has
                        // fixed-height list items, hence the use of
                        // SliverFixedExtentList. However, one could use any
                        // sliver widget here, e.g. SliverList or SliverGrid.
                        sliver: SliverFixedExtentList(
                          // The items in this example are fixed to 48 pixels
                          // high. This matches the Material Design spec for
                          // ListTile widgets.
                          itemExtent: 48.0,
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              // This builder is called for each child.
                              // In this example, we just number each list item.
                              return ListTile(
                                title: Text('Item $index'),
                              );
                            },
                            // The childCount of the SliverChildBuilderDelegate
                            // specifies how many children this inner list
                            // has. In this example, each tab has a list of
                            // exactly 30 items, but this is arbitrary.
                            childCount: 30,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SampleList extends StatelessWidget {
  const SampleList({
    Key key,
    @required this.c,
  }) : super(key: key);

  final int c;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Color.fromARGB(255, 0, c * 8 % 255, c * 13 % 255),
        child: SizedBox(
          width: double.infinity,
          height: 100,
        ),
      ),
    );
  }
}

class MainTweetListDelegate extends SliverChildDelegate {
  @override
  int get estimatedChildCount {
    return 100;
  }

  @override
  Widget build(BuildContext context, int index) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Container(
          color: Color.fromARGB(255, 100, 100, index * 10 % 255),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverChildDelegate oldDelegate) {
    return false;
  }
}

class TimeLine extends StatelessWidget {
  const TimeLine({
    Key key,
    @required this.data,
  }) : super(key: key);

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverToBoxAdapter(
            child: Header(data: data),
          ),
        ];
      },
      body: Container(),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.data,
  }) : super(key: key);

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.width / backgroudRetio +
                  iconSize / 2,
              child: Stack(
                children: [
                  BackGround(data: data),
                  Align(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: baseMargin, right: baseMargin),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: MainIcon(),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ChangeButton(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(baseMargin),
              child: Column(children: [
                Text(data["name"]),
                Text("@" + data["id"]),
                Text(data["description"]),
                Row(children: [
                  Text(data["place"]),
                  Text("誕生日 " + data["birthday"]),
                ]),
                Row(children: [
                  Text(data["follower"] + "フォロー"),
                  Text(data["followee"] + "フォロワー"),
                ])
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class StickySlivereDelegate extends SliverPersistentHeaderDelegate {
  StickySlivereDelegate({
    this.minExtent,
    this.maxExtent,
    this.contents,
  });

  final double minExtent;
  final double maxExtent;
  final Widget contents;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: contents,
      color: Colors.white,
    );
  }

  @override
  bool shouldRebuild(StickySlivereDelegate oldDelegate) {
    return contents != oldDelegate.contents;
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate(this.tabBar);

  final Widget tabBar;

  @override
  double get minExtent => 100;

  @override
  double get maxExtent => 200;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}

class BackGround extends StatelessWidget {
  const BackGround({
    Key key,
    @required this.data,
  }) : super(key: key);

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: backgroudRetio,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                data["background"],
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withAlpha(50),
                    Colors.black.withAlpha(0),
                  ],
                  stops: [
                    0,
                    0.8,
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                ),
              ),
              child: SizedBox.expand(),
            ),
          ],
        ),
      ),
    );
  }
}

class ChangeButton extends StatelessWidget {
  const ChangeButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: themeColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10000))),
      child: Padding(
        padding: EdgeInsets.only(
            left: baseMargin, right: baseMargin, top: 5, bottom: 5),
        child: Text(
          "変更",
          style: TextStyle(
              fontSize: 20, color: themeColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class MainIcon extends StatelessWidget {
  const MainIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: iconSize,
      height: iconSize,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50),
              spreadRadius: 0,
              blurRadius: 5,
            ),
          ],
          border: Border.all(
            width: 3,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(100000)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(100000)),
          child: Image.network(
            "https://pbs.twimg.com/profile_images/378800000544535184/9bd879417976fbfc5477155fddd7ca74_400x400.png",
          ),
        ),
      ),
    );
  }
}
