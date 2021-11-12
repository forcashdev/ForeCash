import 'package:flutter/material.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/pages/select_monthly_income/widgets/select_monthly_income_text.dart';

class WebSelectMonthlyIncomePage extends StatefulWidget {
  const WebSelectMonthlyIncomePage({Key key}) : super(key: key);

  @override
  _WebSelectMonthlyIncomePageState createState() => _WebSelectMonthlyIncomePageState();
}

class _WebSelectMonthlyIncomePageState extends State<WebSelectMonthlyIncomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Column(
        children: [
          SelectMonthlyIncomeText(),
          SizedBox(
            height: 50.0,
          ),
          Table(
            border: TableBorder.symmetric(outside: BorderSide(color: AppTheme.colorGrey, width: 1)),
            children: [
              TableRow(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.teal),
                  ),
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 48.0,
                          width: 38.0,
                        ),
                        Text("“Winners”"),
                      ],
                    ),
                    Text("“Year”"),
                    Text("“Country”"),
                    Text("“Club Name”"),
                  ]),
              TableRow(children: [
                Row(
                  children: [
                    Checkbox(
                        value: true,
                        onChanged: (val) {
                          return val;
                        }),
                    Text("“Ronaldo”"),
                  ],
                ),
                Text("“1997”"),
                Text("“Brazil”"),
                Text("“Internazionale”"),
              ]),
              TableRow(children: [
                Row(
                  children: [
                    Checkbox(
                        value: true,
                        onChanged: (val) {
                          return val;
                        }),
                    Text("“Zinedine Zidane”"),
                  ],
                ),
                Text("“1998”"),
                Text("“France”"),
                Text("“Juventus”"),
              ]),
              TableRow(children: [
                Text("“Rivaldo”"),
                Text("“1999”"),
                Text("“Brazil”"),
                Text("“Barcelona”"),
              ]),
              TableRow(children: [
                Text("“Luís Figo”"),
                Text("“2000”"),
                Text("“Portugal”"),
                Text("“Real Madrid”"),
              ]),
              TableRow(children: [
                Text("“Michael Owen”"),
                Text("“2001”"),
                Text("“England”"),
                Text("“Liverpool”"),
              ]),
              TableRow(children: [
                Text("“Ronaldo”"),
                Text("“2002”"),
                Text("“Brazil”"),
                Text("“Real Madrid”"),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
