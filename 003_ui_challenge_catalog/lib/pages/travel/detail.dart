import 'package:flutter/material.dart';
import './constants.dart';

final listMargin = EdgeInsets.only(left: 20, right: 20);

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
    return "50時間20分";
  }

  String get limitString {
    return "応募可能人数 2名まで";
  }
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
      height: 20,
      width: double.infinity,
    );

    var text =
        "地球科学系で「天然」を頭高型アクセント(て↑んねん)で発音するの何故なんだろうか。知り合いに聞いた限りでは化学系や農学系は平板型で発音しているようなので理系一般の文化でもなさそうだし";
    return Scaffold(
      body: Container(
        color: kColorBG,
        child: ListView(children: <Widget>[
          DetailText(
            title: "このトラベルについて",
            text: text,
          ),
          DetailText(
              title: "このトラベルにつて",
              text:
                  "国内線の飛行機で前後の席に乗り合わせた人同士が感染です。 　千葉県によりますと、13日に八千代市の40代の男性が感染していることが確認されました。男性は3日に成田空港に到着した国内線の飛行機に乗っていて、この男性の前の席に座っていた20代の男性警察官が9日に感染が確認されたため濃厚接触者として検査を受けていました。2人に面識はなく会話もありませんでした。"),
          RoundWraper(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: kColorGray,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      RequeirmentRow(
                        icondata: IconData(59387, fontFamily: 'MaterialIcons'),
                        text: tcd.limitString,
                      ),
                      RequeirmentRow(
                        icondata: IconData(57544, fontFamily: 'MaterialIcons'),
                        text: tcd.address,
                      ),
                      RequeirmentRow(
                        icondata: IconData(59701, fontFamily: 'MaterialIcons'),
                        text: tcd.dateString,
                      ),
                      RequeirmentRow(
                        icondata: IconData(57746, fontFamily: 'MaterialIcons'),
                        text: tcd.allWorkTimeString,
                      ),
                      RequeirmentRow(
                        icondata: IconData(57922, fontFamily: 'MaterialIcons'),
                        text: tcd.summary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DetailContainer(title: "このトラベルについて", child: child),
          DetailContainer(title: "このトラベルについて", child: child),
          DetailContainer(title: "このトラベルについて", child: child),
          DetailContainer(title: "このトラベルについて", child: child),
        ]),
      ),
    );
  }
}

class RequeirmentRow extends StatelessWidget {
  const RequeirmentRow({
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
        child: Text(text),
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
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Text(
                title,
                style: TextStyle(
                  color: kColorText,
                  fontSize: 20,
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
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [kShadow],
      ),
      margin: listMargin.add(EdgeInsets.only(bottom: 20)),
      child: child,
    );
  }
}
