import 'package:flutter/material.dart';
import 'package:soultion/matrial/const.dart';
import 'package:soultion/screens/singUp.dart';

class startPage extends StatefulWidget {
  startPage({Key? key}) : super(key: key);

  @override
  _startPageState createState() => _startPageState();
}

class _startPageState extends State<startPage>
    with SingleTickerProviderStateMixin {
  /* fonction for know widht & height*/
  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getScreenheight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  late List<Widget> cont = <Widget>[
    Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/Dropshipping model-bro.png'),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Titele',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis a, ea neque sit iure fugiat!',
              textAlign: TextAlign.center)
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/Mobile Marketing-bro.png'),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Titele',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis a, ea neque sit iure fugiat!',
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/Mobile Marketing-pana.png'),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Titele',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis a, ea neque sit iure fugiat!',
              textAlign: TextAlign.center)
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/Social Dashboard-pana.png'),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Titele',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis a, ea neque sit iure fugiat!',
              textAlign: TextAlign.center),
          Container(
            margin: const EdgeInsets.only(top: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => signup()));
                  },
                  child: const Text('start now ',
                      style: TextStyle(
                        color: light,
                        fontSize: 17,
                      )),
                  color: dark,
                  height: 50,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9))),
                  minWidth: getScreenWidth(context) - 68,
                  splashColor: red,
                )
              ],
            ),
          )
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: cont.length,
        child: Builder(
          builder: (BuildContext context) => Column(
            children: <Widget>[
              Expanded(
                  child: TabBarView(
                children: cont,
              )),
              const TabPageSelector(
                indicatorSize: 10,
                selectedColor: primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
