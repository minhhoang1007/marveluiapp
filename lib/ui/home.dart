import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marvel_uiapp/helper/swiper_helper.dart';
import 'package:marvel_uiapp/ui/twoscreen.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  HomeScreen({Key key, this.title}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SwiperController controller = SwiperController();

  int pageCount = 5;
  int currentIndex = 0;
  List<String> pageTitle = [
    "Iron Man \n Tony Stark",
    "Captain American \n Steve Rogers",
    "Black Window \n Natasha Romanoff",
    "Captain Marvel \n Carol Danvers",
    "Spider Man \n Peter Parker",
  ];

  String background = "assets/background.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              background,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: Swiper(
                  index: currentIndex,
                  controller: controller,
                  itemCount: pageCount,
                  onIndexChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  loop: false,
                  itemBuilder: (context, index) {
                    return createPage(
                      title: pageTitle[index],
                      icon: "assets/${index + 1}.jpg",
                    );
                  },
                  pagination: SwiperPagination(
                      builder: new CustomPaginationBuilder(
                          activeSize: Size(10.0, 20.0),
                          size: Size(10.0, 20.0),
                          color: Colors.grey.shade600)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              createButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget createPage({String title, String icon}) {
    TextStyle titleStyle =
        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(50.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        image: DecorationImage(
          image: AssetImage(icon),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.multiply),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            spreadRadius: 5.0,
            offset: Offset(5.0, 5.0),
            color: Colors.black26,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: titleStyle.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Widget createButton() {
    return Container(
      margin: EdgeInsets.only(right: 16.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            textColor: Colors.grey.shade700,
            child: Text("Skip"),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => TwoScreen()));
            },
          ),
          IconButton(
            icon: Icon(
              currentIndex < pageCount - 1
                  ? FontAwesomeIcons.arrowCircleRight
                  : FontAwesomeIcons.checkCircle,
              size: 40.0,
            ),
            onPressed: () async {
              if (currentIndex < pageCount - 1)
                controller.next();
              else {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => TwoScreen()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
