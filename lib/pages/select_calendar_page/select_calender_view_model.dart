import 'package:flutter/material.dart';
import 'package:for_cash/pages/all_set_page/all_set_page.dart';

class SelectCalendarViewModel {
  dynamic state;

  SelectCalendarViewModel(this.state) {
    this.state = state;
  }

  void onTapOfNext() {
    Navigator.of(state.context).push(MaterialPageRoute(builder: (builder) => AllSetPage()));
  }

}