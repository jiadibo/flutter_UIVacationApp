import 'package:flutter/material.dart';
import 'package:vacation/CustomAppBar.dart';
import 'package:vacation/CustomShapeClipper.dart';
import 'package:vacation/pack_list.dart';

void main() => runApp(MaterialApp(
      title: 'Jiadibo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: appTheme,
    ));

Color firstColor = Color(0xff42a5f5);
Color secondColor = Color(0xff64b5f6);

ThemeData appTheme =
    ThemeData(primaryColor: Color(0xff42a5f5), fontFamily: 'Quicksand');

List<String> locations = ['Mataram', 'Bali', 'Surabaya', 'Sumbawa'];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: CustomAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            HomeScreenTopPart(),
            homeScreenBottomPart,
            homeScreenBottomPart,
            homeScreenBottomPart,
          ],
        ),
      ),
    );
  }
}

const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocIndex = 0;
  var isPaketSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 300.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [firstColor, secondColor]),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedLocIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              locations[selectedLocIndex],
                              style: dropDownLabelStyle,
                            ),
                            Icon(Icons.keyboard_arrow_down, color: Colors.white)
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                              PopupMenuItem(
                                child: Text(
                                  locations[0],
                                  style: dropDownMenuStyle,
                                ),
                                value: 0,
                              ),
                              PopupMenuItem(
                                child: Text(
                                  locations[1],
                                  style: dropDownMenuStyle,
                                ),
                                value: 1,
                              ),
                            ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Image(
                  height: 70.0,
                  image: AssetImage('assets/images/go_logo.png'),
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: TextField(
                      controller: TextEditingController(
                          text: locations[selectedLocIndex]),
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 15.0),
                        suffixIcon: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(28.0)),
                          child: InkWell(
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PackageListing(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: ChoiceChip(
                        icon: Icons.card_travel,
                        text: "Paket",
                        isSelected: isPaketSelected,
                      ),
                      onTap: () {
                        setState(() {
                          isPaketSelected = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: 22.0,
                    ),
                    InkWell(
                      child: ChoiceChip(
                        icon: Icons.hotel,
                        text: "Hotel",
                        isSelected: !isPaketSelected,
                      ),
                      onTap: () {
                        setState(() {
                          isPaketSelected = false;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  ChoiceChip({this.icon, this.text, this.isSelected});

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

var textLihatStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: appTheme.primaryColor,
);

var homeScreenBottomPart = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Promo Hari Ini",
            style: dropDownMenuStyle,
          ),
          Spacer(),
          Text(
            "Lihat Semua",
            style: textLihatStyle,
          ),
        ],
      ),
    ),
    Container(
      height: 210.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cityCards,
      ),
    ),
  ],
);

List<CityCard> cityCards = [
  CityCard(
    imagePath: "assets/images/sembalun.jpg",
    destiName: "Sembalun",
    montYear: "Dec 2019",
    discount: "20",
    nowPrice: 399,
    oldPrice: 599,
  ),
  CityCard(
    imagePath: "assets/images/kenawa.jpg",
    destiName: "Kenawa",
    montYear: "Nov 2019",
    discount: "25",
    nowPrice: 299,
    oldPrice: 499,
  ),
  CityCard(
    imagePath: "assets/images/kuta.jpg",
    destiName: "Kuta",
    montYear: "Oct 2019",
    discount: "30",
    nowPrice: 259,
    oldPrice: 499,
  ),
];

class CityCard extends StatelessWidget {
  final String imagePath, destiName, montYear, discount;
  final int oldPrice, nowPrice;

  CityCard(
      {this.imagePath,
      this.destiName,
      this.montYear,
      this.discount,
      this.oldPrice,
      this.nowPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 210.0,
                  width: 160.0,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  height: 80.0,
                  width: 160.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.1),
                            Colors.black87
                          ]),
                    ),
                  ),
                ),
                Positioned(
                  left: 8.0,
                  bottom: 6.0,
                  right: 10.0,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                destiName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18.0),
                              ),
                              Text(
                                montYear,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 2.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Text(
                              "$discount%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: appTheme.primaryColor,
                                  fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${nowPrice}rb",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            "${oldPrice}rb",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 12.0,
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Image(
                            height: 20.0,
                            fit: BoxFit.scaleDown,
                            image: AssetImage("assets/images/stars.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
