import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:soultion/matrial/const.dart';
import 'package:d_chart/d_chart.dart';

class analtices extends StatefulWidget {
  const analtices({Key? key}) : super(key: key);

  @override
  _analticesState createState() => _analticesState();
}

class _analticesState extends State<analtices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'know more about your  audience \nin ALGERIA',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                ' Facebook users in  ALGERIA',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Card(
                    shadowColor: red,
                    margin: EdgeInsets.only(left: 10),
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      width: getScreenWidth(context) - 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: DChartPie(
                              data: [
                                {
                                  'domain': 'men',
                                  'measure': 16045204,
                                  'per': 58.49
                                },
                                {
                                  'domain': 'women',
                                  'measure': 11382495,
                                  'per': 41.51
                                },
                              ],
                              pieLabel: (pieData, index) {
                                return "${pieData['domain']}";
                              },
                              labelColor: light,
                              fillColor: (pieData, index) {
                                switch (pieData['domain']) {
                                  case 'women':
                                    return Colors.pink;

                                  default:
                                    return Colors.blue;
                                }
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                LineIcons.mars,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("men = 58.49%"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                LineIcons.venus,
                                color: Colors.pink,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("women = 41.51%"),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                ' Facebook users by gender in   ALGERIA',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Card(
                    shadowColor: red,
                    margin: EdgeInsets.only(left: 10),
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      width: getScreenWidth(context) - 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 300,
                            width: 340,
                            child: DChartBar(
                              yAxisTitle: 'users by gender',
                              xAxisTitle: 'Number',
                              data: [
                                {
                                  'id': 'Bar 1',
                                  //men
                                  'data': [
                                    {'domain': '+65 ', 'measure': 392700},
                                    {'domain': '25-34 ', 'measure': 5500000},
                                    {'domain': '18-24 ', 'measure': 4000000},
                                    {'domain': '13-17 ', 'measure': 1100000},
                                    {'domain': '55-64 ', 'measure': 546000},
                                    {'domain': '45-54 ', 'measure': 1300000},
                                    {'domain': '35-44 ', 'measure': 3200000},
                                  ],
                                },
                                {
                                  'id': 'Bar 2',
                                  //women
                                  'data': [
                                    {'domain': '13-17 ', 'measure': 1200000},
                                    {'domain': '18-24 ', 'measure': 3900000},
                                    {'domain': '25-34 ', 'measure': 3600000},
                                    {'domain': '35-44 ', 'measure': 1600000},
                                    {'domain': '45-54 ', 'measure': 618700},
                                    {'domain': '55-64 ', 'measure': 286000},
                                    {'domain': '+65 ', 'measure': 201600},
                                  ],
                                },
                              ],
                              minimumPaddingBetweenLabel: 1,
                              domainLabelPaddingToAxisLine: 20,
                              axisLineTick: 2,
                              axisLinePointTick: 2,
                              axisLinePointWidth: 10,
                              axisLineColor: dark,
                              measureLabelPaddingToAxisLine: 10,
                              barColor: (barData, index, id) => id == 'Bar 1'
                                  ? Colors.blue
                                  : id == 'Bar 2'
                                      ? Colors.pink
                                      : Colors.pink,
                              verticalDirection: false,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                LineIcons.mars,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("men "),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                LineIcons.venus,
                                color: Colors.pink,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("women "),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                ' Instagram  users in  ALGERIA',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Card(
                    shadowColor: red,
                    margin: EdgeInsets.only(left: 10),
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      width: getScreenWidth(context) - 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: DChartPie(
                              data: [
                                {
                                  'domain': 'men',
                                  'measure': 4954494,
                                  'per': 58.49
                                },
                                {
                                  'domain': 'women',
                                  'measure': 4169806,
                                  'per': 41.51
                                },
                              ],
                              pieLabel: (pieData, index) {
                                return "${pieData['domain']}";
                              },
                              labelColor: light,
                              fillColor: (pieData, index) {
                                switch (pieData['domain']) {
                                  case 'women':
                                    return Colors.pink;

                                  default:
                                    return Colors.blue;
                                }
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                LineIcons.mars,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                  "men = ${((4954494 * 100) / 9124300).ceil()} %"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                LineIcons.venus,
                                color: Colors.pink,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                  "women = ${((4169806 * 100) / 9124300).floor()} %"),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                ' Instagram users by gender in   ALGERIA',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Card(
                    
                    shadowColor: red,
                    margin: EdgeInsets.only(left: 10),
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      width: getScreenWidth(context) - 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 300,
                            width: 340,
                            child: DChartBar(
                              yAxisTitle: 'users by gender',
                              xAxisTitle: 'Number',
                              data: [
                                {
                                  'id': 'Bar 1',
                                  //men
                                  'data': [
                                    {'domain': '+65 ', 'measure': 63000},
                                    {'domain': '55-64 ', 'measure': 77000},
                                    {'domain': '45-54 ', 'measure': 204900},
                                    {'domain': '35-44 ', 'measure': 622800},
                                    {'domain': '25-34 ', 'measure': 1700000},
                                    {'domain': '18-24 ', 'measure': 1800000},
                                    {'domain': '13-17 ', 'measure': 482900},
                                  ],
                                },
                                {
                                  'id': 'Bar 2',
                                  //women
                                  'data': [
                                    {'domain': '13-17 ', 'measure': 508400},
                                    {'domain': '18-24 ', 'measure': 1600000},
                                    {'domain': '25-34 ', 'measure': 3600000},
                                    {'domain': '35-44 ', 'measure': 469900},
                                    {'domain': '45-54 ', 'measure': 183600},
                                    {'domain': '55-64 ', 'measure': 71400},
                                    {'domain': '+65 ', 'measure': 40400},
                                  ],
                                },
                              ],
                              minimumPaddingBetweenLabel: 1,
                              domainLabelPaddingToAxisLine: 20,
                              axisLineTick: 2,
                              axisLinePointTick: 2,
                              axisLinePointWidth: 10,
                              axisLineColor: dark,
                              measureLabelPaddingToAxisLine: 10,
                              barColor: (barData, index, id) => id == 'Bar 1'
                                  ? Colors.blue
                                  : id == 'Bar 2'
                                      ? Colors.pink
                                      : Colors.pink,
                              verticalDirection: false,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                LineIcons.mars,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("men "),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                LineIcons.venus,
                                color: Colors.pink,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("women "),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
