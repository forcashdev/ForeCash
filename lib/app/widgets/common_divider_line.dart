import 'package:flutter/material.dart';

class CommonDividerLine extends StatelessWidget {
  var height,width,color;
  CommonDividerLine({Key key, this.height, this.width,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width:width,
      height:height,
      color: color,
    );
  }
}
