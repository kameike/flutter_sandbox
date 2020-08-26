import 'package:flutter/material.dart';

class PrimeVideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorbg = Color.fromARGB(255, 49, 49, 49);
    final tabs = ["ホーム", "オリジナル", "TV番組", "映画", "キッズ"];

    return Scaffold(
      backgroundColor: colorbg,
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, isSome) {
            return [
              SliverToBoxAdapter(
                child: SafeArea(
                  bottom: false,
                  child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 100,
                        child: Placeholder(
                          fallbackWidth: 100,
                          fallbackHeight: 30,
                        ),
                      )),
                ),
              ),
              SliverToBoxAdapter(
                child: TabBar(
                  tabs: tabs.map((String name) => Tab(text: name)).toList(),
                  isScrollable: true,
                ),
              ),
            ];
          },
          floatHeaderSlivers: true,
          body: TabBarView(
            children: tabs.map((name) {
              return CustomScrollView(
                key: PageStorageKey<String>(name),
                slivers: [
                  SliverToBoxAdapter(
                    child: Header(),
                  ),
                  Contents(),
                  Contents(),
                  Contents(),
                  Contents(),
                  Contents(),
                  Contents(),
                  Contents(),
                  Contents(),
                ],
              );
            }).toList(),
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }
}

class Contents extends StatelessWidget {
  const Contents({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 40,
              right: 20,
              bottom: 2,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("プライム会員特典",
                      style: TextStyle(
                        color: Colors.blue.withBlue(-50),
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "最近追加された番組",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Thumbnail())),
                SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Thumbnail())),
                SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Thumbnail())),
                SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Thumbnail())),
                SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Thumbnail())),
                SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Thumbnail())),
                SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Thumbnail())),
                SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Thumbnail())),
                SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Thumbnail())),
                SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Thumbnail())),
              ],
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Placeholder(),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 8,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (context, index) {
          return Container(
            child: Placeholder(),
            color: Colors.white
                .withRed(255 - index * 20)
                .withBlue(255 - index * 10)
                .withGreen(255 - index * 10),
          );
        },
      ),
    );
  }
}
