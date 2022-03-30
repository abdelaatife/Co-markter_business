import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soultion/matrial/const.dart';
import 'package:country_code_picker/country_code_picker.dart';


class personalinfo extends StatefulWidget {
  personalinfo({Key? key}) : super(key: key);

  @override
  _personalinfoState createState() => _personalinfoState();
}

class _personalinfoState extends State<personalinfo> {
  var countrycode;

  _updatePadding(double value) => setState(() => pading = value);

  _updateheight(double value) => setState(() => height = value);

  _updatetop(double value) => setState(() => top = value);
  var selected;
  var mypassword, myemail;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  //auth firebase code sign up
  singin() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: myemail, password: mypassword);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      print('error');
    }
  }
  //end auth firebase code sign up

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
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
                    child: Text('your personnal inforamtion',
                        style: TextStyle(fontSize: 19, height: height))),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Form(
                key: formstate,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'full name',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 0.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(),
                          focusColor: blue),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: dark, width: 1))),
                      child: CountryCodePicker(
                        initialSelection: 'ALG',
                        onChanged: (CountryCode) {
                          setState(() {
                            countrycode = CountryCode;
                          });
                        },
                        padding: const EdgeInsets.only(right: 7),
                        showCountryOnly: true,
                        showOnlyCountryWhenClosed: true,
                        favorite: const ['+213', 'ALG'],
                        alignLeft: true,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'your city',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            Icons.location_city_rounded,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 0.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(),
                          focusColor: blue),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    /*phone input */
                    TextFormField(
                      onSaved: (val) {
                        myemail = val;
                      },
                      validator: (val) {
                        if (val!.length < 10) {
                          return "phone number can't be less than 10 letter";
                        }
                        return null;
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
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
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
                          pading = 0;
                          height = 3.5;
                          top = 10;
                          topsignin = 10;
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
