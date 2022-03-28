import 'package:flutter/services.dart';

characterInputFormatter() {
  return WhitelistingTextInputFormatter(RegExp("[a-z A-Z]"));

// return WhitelistingTextInputFormatter(RegExp("[a-z A-Z á-ú Á-Ú 0-9]"));
}

digitInputFormatter() {
  return WhitelistingTextInputFormatter(RegExp("[0-9]"));
}
