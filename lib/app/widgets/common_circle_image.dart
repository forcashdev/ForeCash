import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';

class CommonCircleImage extends StatelessWidget {
  String imagePath ='';
  CommonCircleImage({@required this.imagePath});
  @override
  Widget build(BuildContext context) {
    print('->  image path -> $imagePath');
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        circleImage(),
        cameraIcon()
      ],
    );
  }

  Widget cameraIcon() => Container(
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
    ),
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppTheme.colorAccent,
        shape: BoxShape.circle,
      ),
      child: CommonImageAsset(
        image: Constants.ic_camera,
        height: 12,
        width: 12,
      ),
    ),
  );

  Widget circleImage() => Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
    ),
    child: CommonImageAsset(
      image: imagePath,
      height: 120,
      width: 120,
    ),
  );

}
