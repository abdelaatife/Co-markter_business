import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:soultion/matrial/const.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:soultion/screens/homepage/Store.dart';

class addproduct extends StatefulWidget {
  const addproduct({Key? key}) : super(key: key);

  @override
  _addproductState createState() => _addproductState();
}

class _addproductState extends State<addproduct> {
  File? image;

// texte faild function and var
  GlobalKey<FormState> formState = new GlobalKey<FormState>();
  var prodctename, discrption, number, imageUrl;
  CollectionReference product =
      FirebaseFirestore.instance.collection('product');
  File? file;
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
      await ref?.putFile(file!);
      imageUrl = await ref?.getDownloadURL();
      await product.add({
        'productname': prodctename,
        'discrption': discrption,
        'number': number,
        'imageUrl ': imageUrl
      });
      store().createState();
      Navigator.pop(this.context);
    }
  }

  // end texte faild function and var
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
                      child: const Text('Add a product to your store',
                          style: TextStyle(
                            fontSize: 19,
                          ))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: getScreenWidth(context) - 20,
                      height: getScreenheight(context) / 3.6,
                      child: image == null
                          ? Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: dark, width: 0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: InkWell(
                                onTap: () async {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title:
                                              const Text("pick image from :"),
                                          content: Container(
                                            height:
                                                getScreenheight(context) / 4.5,
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  leading: const Icon(
                                                      LineIcons.camera),
                                                  title: const Text('Camera'),
                                                  //function
                                                  onTap: () async {
                                                    var image = await ImagePicker
                                                        .platform
                                                        .pickImage(
                                                            source: ImageSource
                                                                .camera);
                                                    if (image != null) {
                                                      setState(() async {
                                                        file = File(image.path);
                                                        var rand = Random()
                                                            .nextInt(10000);
                                                        var imagename =
                                                            '$rand' +
                                                                basename(
                                                                    image.path);
                                                        print(image.path);
                                                        ref = FirebaseStorage
                                                            .instance
                                                            .ref('images')
                                                            .child(
                                                                "$imagename");
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    }
                                                  },
                                                  //end function
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Divider(),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                ListTile(
                                                  leading: const Icon(
                                                      LineIcons.photoVideo),
                                                  title: const Text('Gallery'),
                                                  onTap: () async {
                                                    var image = await ImagePicker
                                                        .platform
                                                        .pickImage(
                                                            source: ImageSource
                                                                .gallery);
                                                    if (image != null) {
                                                      setState(() async {
                                                        file = File(image.path);
                                                        var rand = Random()
                                                            .nextInt(10000);
                                                        var imagename =
                                                            '$rand' +
                                                                basename(
                                                                    image.path);
                                                        print(image.path);
                                                        ref = FirebaseStorage
                                                            .instance
                                                            .ref('images')
                                                            .child(
                                                                "$imagename");
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      LineIcons.photoVideo,
                                      size: 50,
                                    ),
                                    Text(
                                        '  tap to add a photo for your product')
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: dark, width: 0.5),
                              ),
                              child: Image.file(
                                image!,
                                fit: BoxFit.fill,
                              ),
                            )),
                ],
              ),
              ///////form /////////////
              Form(
                key: formState,
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: Column(
                    children: [
                      /*name of your product input */
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
                            labelText: 'name of your product',
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            prefixIcon: Icon(
                              LineIcons.tag,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(),
                            focusColor: blue),
                        keyboardType: TextInputType.text,
                        //fonction

                        controller: textname,
                      ),
                      const SizedBox(
                        height: 15,
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
                            labelText: 'description for your product',
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            prefixIcon: Icon(
                              LineIcons.fileAlt,
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
                        height: 15,
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
                          number = newValue;
                        },

                        //end function
                        decoration: const InputDecoration(
                            labelText: 'Quantity of your product',
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            prefixIcon: Icon(
                              LineIcons.dolly,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(),
                            focusColor: blue),
                        keyboardType:
                            const TextInputType.numberWithOptions(signed: true),
                      ),
                      const SizedBox(
                        height: 20,
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
                                    'add',
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
