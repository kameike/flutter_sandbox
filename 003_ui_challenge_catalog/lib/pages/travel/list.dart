import 'package:flutter/material.dart';
import './detail.dart';
import './constants.dart';

class ListItemData {
  const ListItemData({
    this.title,
    this.address,
    this.imageURL,
    this.id,
  });

  final String title;
  final String address;
  final String imageURL;
  final String id;

  String get statusDescription {
    return "募集は狩猟しました";
  }
}

class TravelListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = [
      ListItemData(
        id: "1",
        title: "北海道の大自然の中で、お米を作りつつ地域おこしのお手伝いをする4泊5日のタイミートラベル",
        address: "北海道石見沢市北村大願4120番地",
        imageURL:
            "https://dol.ismcdn.jp/mwimgs/2/2/670m/img_220bed3b7216101fc84134b7d6cacb6a90866.jpg",
      ),
      ListItemData(
        id: "1",
        title: "四国らしさを満喫しながら、100年続くみかん農家さんをお手伝いするタイミートラベル！",
        address: "〒796-8053 愛媛県八幡市真綱代丙370",
        imageURL:
            "https://www.city.hamamatsu.shizuoka.jp/nousei/portal/sinkisyunosyaiv/images/takehira1png.png",
      ),
      ListItemData(
        id: "1",
        title: "シュノーケリングを楽しめる、沖縄民泊でのお手伝いタイミートラベル！",
        address: "沖沖縄県座間味島座間味村阿真縄県座間味島座間味村阿真14-5-20",
        imageURL:
            "http://www.oi-crew.com/photo/assets_c/2018/06/%E6%B2%96%E7%B8%84%E3%82%A2%E3%82%A4%E3%83%A9%E3%83%B3%E3%83%89%E3%82%AF%E3%83%AB%E3%83%BC%E3%83%80%E3%82%A4%E3%83%93%E3%83%B3%E3%82%B0%20%2813%29-thumb-600x450-94153.jpg",
      ),
    ];

    return Scaffold(
      body: Container(
        color: kColorBG,
        child: ListView.separated(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final d = data[index];
            return TravelListCell(d: d);
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 30);
          },
        ),
      ),
    );
  }
}

class TravelListCell extends StatelessWidget {
  const TravelListCell({
    Key key,
    @required this.d,
  }) : super(key: key);

  final ListItemData d;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return TravelDetailPage();
          },
        ));
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: kColorWhite,
          boxShadow: [kShadow],
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 10,
                child: Image.network(
                  d.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(d.title,
                          style: TextStyle(
                            color: kColorText,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        d.statusDescription,
                        style: TextStyle(
                          color: kColorText,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        d.address,
                        style: TextStyle(
                          color: kColorText,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
