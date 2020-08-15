import 'package:flutter/material.dart';
import './constants.dart';

final listMargin = EdgeInsets.only(left: kDefaultMargin, right: kDefaultMargin);

class TopContentData {
  const TopContentData({
    @required this.address,
    @required this.summary,
    @required this.title,
  });

  final String address;
  final String title;
  final String summary;

  String get dateString {
    return "2020/4/2~2020/4/10(7泊9日)";
  }

  String get allWorkTimeString {
    return "50時間50分";
  }

  String get limitString {
    return "応募可能人数 2名まで";
  }
}

class PhotoAndDescription {
  const PhotoAndDescription({
    @required this.imageURL,
    @required this.description,
  });

  final String imageURL;
  final String description;
}

class TravelDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tcd = TopContentData(
      title: "北海道の大自然の中で、お米を作りつつ地域おこしのお手伝いをする4泊5日のタイミートラベル",
      address: "北海道石見沢市北村大願4120番地",
      summary: "ハスカップの収穫",
    );

    var child = SizedBox(
      height: kDefaultMargin,
      width: double.infinity,
    );

    var aboutText =
        "地球科学系で「天然」を頭高型アクセント(て↑んねん)で発音するの何故なんだろうか。知り合いに聞いた限りでは化学系や農学系は平板型で発音しているようなので理系一般の文化でもなさそうだし";

    var photos = [
      PhotoAndDescription(
        imageURL:
            "https://www.orion-tour.co.jp/air/fair/kyusyu/yakushima/img/keyword_img03.jpg",
        description: "太古からの記憶を今に伝える1000年以上の樹齢を誇る巨樹",
      ),
      PhotoAndDescription(
        imageURL:
            "https://www.orion-tour.co.jp/air/fair/kyusyu/yakushima/img/keyword_img06.jpg",
        description: "コケに愛される緑の楽園",
      ),
      PhotoAndDescription(
        imageURL:
            "https://www.orion-tour.co.jp/air/fair/kyusyu/yakushima/img/keyword_img05.jpg",
        description: "芸術作品のような巨石の謎",
      ),
    ];

    var items = [
      "交通費",
      "宿泊施設",
      "昼食",
      "トイレ",
      "風呂",
      "洗面所",
      "Wi-Fi",
      "冷暖房",
      "電気ケトル",
      "ハンガー",
      "アイロン",
    ];

    var checkList = [
      "筆記用具",
      "タオル",
      "着替え",
      "ハンカチ",
      "軍手",
      "サンダル",
      "30L以上のリュックサック",
    ];

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: kColorWhite,
      //   shadowColor: Color.fromARGB(30, 0, 0, 0),
      //   title: Text("トラベルバイト詳細", style: kTitleStyle),
      //   leading: BackButton(color: kColorText),
      // ),
      body: Container(
        color: kColorBG,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height / 2,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.network(
                        "https://www.orion-tour.co.jp/air/fair/kyusyu/yakushima/img/keyword_img06.jpg",
                        fit: BoxFit.cover),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xffffffff),
                          const Color(0x00ffffff),
                        ],
                        stops: const [
                          0.0,
                          0.8,
                        ],
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                      ),
                    ),
                    child: SizedBox(
                        width: double.infinity, height: double.infinity),
                  ),
                ]),
                stretchModes: [StretchMode.zoomBackground],
              ),
              pinned: true,
              backgroundColor: kColorWhite,
              shadowColor: Color.fromARGB(30, 0, 0, 0),
              title: Text("トラベルバイト詳細", style: kTitleStyle),
              leading: BackButton(color: kColorText),
            ),
            SliverToBoxAdapter(child: SizedBox(height: kDefaultMargin)),
            SliverToBoxAdapter(child: Top(tcd: tcd)),
            SliverToBoxAdapter(
                child: DetailText(title: "このトラベルについて", text: aboutText)),
            SliverToBoxAdapter(child: PhotoList(photos: photos)),
            SliverToBoxAdapter(
                child: DetailText(title: "スケジュールの一例", text: aboutText)),
            SliverToBoxAdapter(
                child: CheckList(title: "準備されるもの", checkList: items)),
            SliverToBoxAdapter(
                child: CheckList(title: "当日の持ち物", checkList: checkList)),
          ],
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        ),
      ),
    );
  }
}

class CheckList extends StatelessWidget {
  const CheckList({
    Key key,
    @required this.checkList,
    @required this.title,
  }) : super(key: key);

  final List<String> checkList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return DetailContainer(
        title: title,
        child: Column(
          children: checkList
              .map((check) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Icon(
                            IconData(58826, fontFamily: 'MaterialIcons'),
                            size: 16,
                            color: Color.fromARGB(255, 112, 211, 139)),
                      ),
                      Expanded(
                        child: Text(check),
                      )
                    ]),
                  ))
              .toList(),
        ));
  }
}

class PhotoList extends StatelessWidget {
  const PhotoList({
    Key key,
    @required this.photos,
  }) : super(key: key);

  final List<PhotoAndDescription> photos;

  @override
  Widget build(BuildContext context) {
    return DetailContainer(
      title: "受け入れ先の雰囲気",
      child: Column(
        children: photos.map(
          (data) {
            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(data.imageURL, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(data.description, style: kDetailText),
                ),
                SizedBox(
                  height: kDefaultMargin,
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}

class Top extends StatelessWidget {
  const Top({
    Key key,
    @required this.tcd,
  }) : super(key: key);

  final TopContentData tcd;

  @override
  Widget build(BuildContext context) {
    return RoundWraper(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: kDefaultMargin,
                right: kDefaultMargin,
                top: kDefaultMargin),
            child: Text(tcd.title, style: kTitleStyle),
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(kDefaultMargin),
            decoration: BoxDecoration(
              color: kColorGray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                RequirementRowForTop(
                  icondata: IconData(59387, fontFamily: 'MaterialIcons'),
                  text: tcd.limitString,
                ),
                RequirementRowForTop(
                  icondata: IconData(57544, fontFamily: 'MaterialIcons'),
                  text: tcd.address,
                ),
                RequirementRowForTop(
                  icondata: IconData(59701, fontFamily: 'MaterialIcons'),
                  text: tcd.dateString,
                ),
                RequirementRowForTop(
                  icondata: IconData(57746, fontFamily: 'MaterialIcons'),
                  text: tcd.allWorkTimeString,
                ),
                RequirementRowForTop(
                  icondata: IconData(57922, fontFamily: 'MaterialIcons'),
                  text: tcd.summary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RequirementRowForTop extends StatelessWidget {
  const RequirementRowForTop({
    Key key,
    @required this.icondata,
    @required this.text,
  }) : super(key: key);

  final IconData icondata;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              icondata,
              size: 16,
              color: kColorText,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: kColorText,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailText extends StatelessWidget {
  const DetailText({
    Key key,
    @required this.text,
    @required this.title,
  }) : super(key: key);

  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return DetailContainer(
      title: title,
      child: SizedBox(
        width: double.infinity,
        child: Text(text, style: kDetailText),
      ),
    );
  }
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({
    Key key,
    @required this.child,
    @required this.title,
  }) : super(key: key);

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RoundWraper(
      child: Container(
        padding: EdgeInsets.all(kDefaultMargin),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Text(
                title,
                style: TextStyle(
                  color: kColorText,
                  fontSize: kDefaultMargin,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 15),
            child,
          ],
        ),
      ),
    );
  }
}

class RoundWraper extends StatelessWidget {
  const RoundWraper({
    Key key,
    @required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kColorWhite,
        borderRadius: BorderRadius.all(Radius.circular(kDefaultMargin)),
        boxShadow: [kShadow],
      ),
      margin: listMargin.add(EdgeInsets.only(bottom: kDefaultMargin)),
      child: child,
    );
  }
}
