import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/pages/spalsh/splash_page_view_model.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

  SplashPageViewModel model;

  @override
  Widget build(BuildContext context) {
    model ?? (model = SplashPageViewModel(this));
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: CommonImageAsset(
        image: "${Constants.img_splash_mobile}",
         fit: BoxFit.fitWidth,
        height: size.height,
        width: size.width,
      ),
    );
  }
}
