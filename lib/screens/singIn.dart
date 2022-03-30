import 'package:flutter/material.dart';
import 'package:soultion/matrial/const.dart';
import 'package:soultion/screens/singUp.dart';

class singin extends StatefulWidget {
  const singin({Key? key}) : super(key: key);

  @override
  _singinState createState() => _singinState();
}

class _singinState extends State<singin> {
  _updatePadding(double value) => setState(() => pading = value);

  _updateheight(double value) => setState(() => height = value);
  _updatetop(double value) => setState(() => top = value);
  //Firebase  Auth
  // FirebaseAuth auth = FirebaseAuth.instance;
  var mypassword, myphone;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  singin() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnimatedPadding(
          duration: const Duration(milliseconds: 700),
          padding: EdgeInsets.only(top: pading, left: 7, bottom: 20),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        child: Text('Login to your Account',
                            style: TextStyle(fontSize: 19, height: height))),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Form(
                    key: formstate,
                    child: Column(
                      children: [
                        /*phone input */
                        TextFormField(
                          onSaved: (val) {
                            myphone = val;
                          },
                          validator: (val) {
                            if (val!.length < 10) {
                              return "phone number can't be less than 10 letter";
                            }
                            return null;
                          },
                          onEditingComplete: () {
                            setState(() {
                              pading = 70;
                              height = 3.5;
                              top = 24;
                              topsignin = 24;
                            });
                          },
                          onTap: () {
                            setState(() {
                              pading = 38;
                              height = 3.5;
                              top = 60;
                              topsignin = 45;
                            });
                          },
                          decoration: const InputDecoration(
                              labelText: 'your Phone Number',
                              labelStyle: TextStyle(
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(
                                Icons.phone,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              focusColor: blue),
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        /*password input */
                        TextFormField(
                          onSaved: (val) {
                            mypassword = val;
                          },
                          validator: (val) {
                            if (val!.length < 5) {
                              return "password can't be less than 4 letter";
                            }
                            return null;
                          },
                          onEditingComplete: () {
                            setState(() {
                              pading = 70;
                              height = 3.5;
                              top = 24;
                              topsignin = 24;
                            });
                          },
                          onTap: () {
                            setState(() {
                              pading = 38;
                              height = 3.5;
                              top = 60;
                              topsignin = 45;
                            });
                          },
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              labelText: 'your password',
                              labelStyle: TextStyle(
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              focusColor: blue),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),

                        /*submit button */
                        Container(
                          margin: const EdgeInsets.only(top: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                onPressed: () async {
                                  await singin();
                                  topb = 16;
                                },
                                child: const Text(
                                  'submit',
                                  style: TextStyle(color: light, fontSize: 17),
                                ),
                                minWidth: getScreenWidth(context) - 70,
                                height: 50,
                                color: dark,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9))),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(primary: primary),
                                onPressed: () {},
                                child: const Text(
                                  'forget your password ?',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: topsignin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('- Or Sign in with -',
                      style: TextStyle(
                        fontSize: 16,
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: Image.asset(
                      'assets/images/google.png',
                      height: 55,
                      width: 55,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Image.asset(
                      'assets/images/facebook.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("don't have accont?",
                      style: TextStyle(
                        fontSize: 14,
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => signup()));
                    },
                    child: const Text("Sign up",
                        style: TextStyle(
                          fontSize: 14,
                        )),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
