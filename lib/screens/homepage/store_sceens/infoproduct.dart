import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:soultion/matrial/const.dart';
import 'package:soultion/screens/homepage/Store.dart';

import '../../../Data/data.dart';

class infoproduct extends StatefulWidget {
  infoproduct({Key? key}) : super(key: key);

  @override
  _infoproductState createState() => _infoproductState();
}

class _infoproductState extends State<infoproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar

      appBar: AppBar(
        //bake button
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => store()));
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: dark,
        title: Text(" ${data[ind]['name']}"),
        actions: [
          //detaille buttone
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Container(
                          margin: const EdgeInsets.only(left: 12),
                          child: const Text("More actions :"),
                        ),
                        content: Container(
                          height: getScreenheight(context) / 6,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                onTap: () {},
                                leading: const Icon(Icons.edit),
                                title: const Text("edit"),
                              ),
                              ListTile(
                                onTap: () {},
                                iconColor: red,
                                leading: const Icon(Icons.delete_outline),
                                title: const Text(
                                  "Delete",
                                  style: TextStyle(color: red),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              icon: Icon(LineIcons.stream)),
        ],
      ),
      //END APP BAR
      //container
      body: Column(
        children: [
          Container(
            child: Image.asset('${data[ind]['Image']} '),
          )
        ],
      ),
    );
  }
}
