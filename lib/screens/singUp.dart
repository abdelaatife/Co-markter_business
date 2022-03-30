import 'package:flutter/material.dart';
import 'package:soultion/matrial/const.dart';
import '../../../Data/data.dart';
import 'package:soultion/screens/SignupPages/Location.dart';
import 'package:soultion/screens/SignupPages/workInfo.dart';
import 'package:soultion/screens/homepage.dart';
import 'package:soultion/screens/facebookSignein.dart';
import 'package:soultion/screens/singIn.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  PageController pageController = PageController(
    initialPage: 0,
  );

  nextpage() {
    if (loc.isNotEmpty) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Home()));
    }
  }

  double _el = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          Container(
              height: getScreenheight(context) - 145,
              child: PageView(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    if (index >= 2) {
                      iconindex = 0;
                      _el = 0;
                      lestcolor = white;
                      textbutton = 'Submit';
                      if (index == 3) {
                        nextpage();
                      }
                    } else {
                      textbutton = 'Next';
                      iconindex = 1;
                    }

                    pageindex = index;
                  });
                },
                controller: pageController,
                children: [
                  signin(),
                  workinfo(),
                  Location(),
                  Container(
                    child: null,
                  ),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (usersData != null)
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      elevation: _el,
                      primary: loc.isEmpty? white : dark,
                      fixedSize: const Size(120, 50)),
                  onPressed: () {
                    if (pageindex < 2) {
                      pageController.animateToPage(++pageindex,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInCubic);
                    } else {
                      nextpage();
                    }
                  },
                  label: Text('${textbutton}'),
                  icon: Icon(icon[iconindex]),
                )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("you allerdy hava account?",
                    style: TextStyle(
                      fontSize: 14,
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => singin()));
                  },
                  child: const Text("Sign in",
                      style: TextStyle(
                        fontSize: 14,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
