import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';

class BankImage extends StatelessWidget {
  String imagePath = '';

  BankImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.colorGrey)),
      padding: EdgeInsets.all(20),
      child: CommonImageAsset(
        image: imagePath,
      ),
    );
  }
}
