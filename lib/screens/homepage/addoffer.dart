import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:line_icons/line_icons.dart';
import 'package:soultion/Data/data.dart';
import 'package:soultion/matrial/const.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:soultion/screens/homepage/offerpage.dart';

class addoffer extends StatefulWidget {
  const addoffer({Key? key}) : super(key: key);

  @override
  _addofferState createState() => _addofferState();
}

class _addofferState extends State<addoffer> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

// texte faild function and var
  GlobalKey<FormState> formState = new GlobalKey<FormState>();
  var prodctename, discrption, prix, date;
  CollectionReference product = FirebaseFirestore.instance.collection('offers');

  Reference? ref;
  additem() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      LoadingIndicator(
          indicatorType: Indicator.ballPulse,
          colors: const [Colors.white],
          strokeWidth: 2,
          backgroundColor: Colors.black,
          pathBackgroundColor: Colors.black);
      formdata.save();

      await product.add({
        'offername': prodctename,
        'discrption': discrption,
        'prix': prix,
        'date ': date
      });
      offeroage().createState();
      Navigator.pop(this.context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 20, top: 5),
                      child: const Text(
                          'Add offers to your customers \n who are near to you ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19,
                          ))),
                ],
              ),

              ///////form /////////////
              Form(
                key: formState,
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      /*name of your product input */

                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onSaved: (newValue) {
                          prodctename = newValue;
                        },
                        /* validator  name of your product input */
                        validator: (val) {
                          if (val!.length < 4) {
                            return "name of your product can't be lesse than 4 ";
                          }
                          if (val.length > 100) {
                            return "name of your product can't be longer than 100 ";
                          }
                          return null;
                        },
                        /* end  validator  name of your product input */
                        //function

                        //end function

                        decoration: const InputDecoration(
                          labelText: 'name of your offer',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            LineIcons.tag,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        //fonction
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        /* validator  descrption for your product input */
                        validator: (val) {
                          if (val!.length < 10) {
                            return "name of your product can't be lesse than 10 ";
                          }
                          if (val.length > 300) {
                            return "name of your product can't be longer than 300 ";
                          }
                          return null;
                        },
                        /* end  validator  descrption for your product input */
                        //function
                        onSaved: (newValue) {
                          discrption = newValue;
                        },

                        //end function
                        decoration: const InputDecoration(
                          labelText: 'descrption of your offer',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            LineIcons.fileAlt,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        /* validator  Quantity of your product input */
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Quantity of your product can't be empty ";
                          }
                          if (val == 0) {
                            return "Quantity of your product can't be = 0  ";
                          }

                          return null;
                        },
                        /* end  validator  Quantity of your product input */
                        //function
                        onSaved: (newValue) {
                          prix = newValue;
                        },

                        //end function
                        decoration: const InputDecoration(
                            labelText: 'new Prix of your offer',
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            prefixIcon: Icon(
                              LineIcons.dolly,
                            ),
                            border: OutlineInputBorder(),
                            focusColor: blue),
                        keyboardType:
                            const TextInputType.numberWithOptions(signed: true),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        onSaved: (alue) {
                          date = alue;
                        },
                        /* validator  name of your product input */
                        validator: (val) {
                          if (val!.length < 4) {
                            return "name of your product can't be lesse than 4 ";
                          }
                          if (val.length > 100) {
                            return "name of your product can't be longer than 100 ";
                          }
                          return null;
                        },
                        /* end  validator  name of your product input */
                        //function

                        //end function

                        decoration: const InputDecoration(
                          labelText: 'finishing date of your offer',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            LineIcons.clock,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.datetime,
                        //fonction
                      ),
                      /*password input */

                      /*submit button */
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              onPressed: () async {
                                await additem();
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    'Add',
                                    style:
                                        TextStyle(color: light, fontSize: 17),
                                  ),
                                ],
                              ),
                              minWidth: getScreenWidth(context) - 55,
                              height: 50,
                              color: dark,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9))),
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
        ),
      ]),
    );
  }
}
