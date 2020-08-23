library flutter_admob_banner_area;

import 'package:flutter/material.dart';
import 'src/check_connection.dart';

class FlutterAdmobBannerArea extends StatefulWidget {

  final Widget child;
  final Color backgroundColor;

  FlutterAdmobBannerArea({Key key,
    @required this.child,
    this.backgroundColor
  }):super(key: key);

  @override
  _FlutterAdmobBannerAreaState createState() => _FlutterAdmobBannerAreaState();
}

class _FlutterAdmobBannerAreaState extends State<FlutterAdmobBannerArea> {

  static double paddingBottom = 0.0;
  static double paddingRight = 0.0;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    if(mediaQuery.orientation == Orientation.landscape){
      // paddingBottom = 0.0;
      // paddingRight = 50.0;
    }

    // check connection
    CheckConnection.check(
        onConnected: () {
          setState(() {
//            paddingBottom = 0.0; // when screenshot
            paddingBottom = 50.0; // normal
          });
        },
        onDisconnected: () {
          setState(() {
            paddingBottom = 0.0;
          });
        }
    );

    return Container(
      color: Colors.grey.shade50,
      child: Padding(
        child: widget.child,
        padding: new EdgeInsets.only(bottom: paddingBottom, right: paddingRight),
      ),
    );
  }
}


