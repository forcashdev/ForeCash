import 'package:flutter/services.dart';

TextInputFormatter characterInputFormatter() {
  return WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"));
}

digitInputFormatter() {
  return WhitelistingTextInputFormatter(RegExp("[0-9]"));
}
