import 'package:flutter/material.dart';
import 'package:soultion/matrial/const.dart';

class workinfo extends StatefulWidget {
  workinfo({Key? key}) : super(key: key);

  @override
  _workinfoState createState() => _workinfoState();
}

class _workinfoState extends State<workinfo> {
  var workinf;
  var shadowColor = dark;
  double elevation = 1;
  double pading = 70;

  @override
  Widget build(BuildContext context) {
    var worktype;
    return Padding(
      padding: const EdgeInsets.only(top: 65, left: 7, bottom: 20),
      child: Wrap(children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('CO-markter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: const Text('your worke inforamtion',
                        style: TextStyle(fontSize: 19, height: 2.5))),
              ],
            ),
            Container(
              height: 400,
              child: GridView(
                children: [
                  InkWell(
                    child: Card(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text('Beauty salon'.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Image.asset('assets/images/Beauty salon.png'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    hoverColor: dark,
                    child: Card(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text('clothes  store'.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Image.asset('assets/images/clothes  store.png'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Card(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            'Supermarket'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Image.asset('assets/images/Supermarket.png'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        elevation = 8;
                        shadowColor = red;
                        workinf = 'restaurant';
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        elevation = 1;
                        shadowColor = dark;
                        workinf = null;
                      });
                    },
                    hoverColor: dark,
                    child: Card(
                      elevation: elevation,
                      shadowColor: shadowColor,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text('restaurant'.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Image.asset('assets/images/restaurant.png'),
                        ],
                      ),
                    ),
                  ),
                ],
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20),
                primary: true,
              ),
            )
          ],
        ),
      ]),
    );
  }
}
