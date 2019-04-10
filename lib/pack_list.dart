import 'package:flutter/material.dart';
import 'package:vacation/CustomShapeClipper.dart';
import 'package:vacation/main.dart';

final Color disBackColor = Color(0xffb3e5fc);
final Color packBorderColor = Color(0xffe0e0e0);
final Color chipBackColor = Color(0xffe0e0e0);

class PackageListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Seacrh Result",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          PackListTopPart(),
          PackListBottomPart(),
        ],
      ),
    );
  }
}

class PackListTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: BoxDecoration(color: firstColor),
            height: 160.0,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Mataram',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Divider(
                            height: 16.0,
                            color: Colors.grey,
                          ),
                          Text(
                            'Lombok Timur',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(Icons.card_travel),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PackListBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Paket Tour",
            style: dropDownMenuStyle,
          ),
          SizedBox(
            height: 10.0,
          ),
          PackCard(),
          // PackCard(),
        ],
      ),
    );
  }
}


class PackCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0)
            ),
            border: Border.all(color: packBorderColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("250rb", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                    Text("225rb", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey,decoration: TextDecoration.lineThrough, fontSize: 16.0),),
                  ],
                ),
                Wrap(
                  spacing: 4.0,
                  children: <Widget>[
                    PackDetailChip(Icons.calendar_today, "Juni 2019"),
                    PackDetailChip(Icons.flight_takeoff, "Jiadibo Air"),
                    PackDetailChip(Icons.star, "4.5"),
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

class PackDetailChip extends StatelessWidget {

  final IconData iconData;
  final String label;

  PackDetailChip(this.iconData, this.label);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(color: Colors.black, fontSize: 14.0),
      backgroundColor: chipBackColor,
      avatar: Icon(iconData, size: 16,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8),)
      ),
    );
  }
}