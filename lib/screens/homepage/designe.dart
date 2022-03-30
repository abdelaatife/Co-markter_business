import 'package:flutter/material.dart';
import 'package:soultion/Data/data.dart';
import 'package:soultion/matrial/const.dart';
import 'package:url_launcher/url_launcher.dart';

class designe extends StatefulWidget {
  designe({Key? key}) : super(key: key);

  @override
  _designeState createState() => _designeState();
}

class _designeState extends State<designe> {
  var img = image['images'].entries.toList();
  var link = image["imageslinke"].entries.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        centerTitle: true,
        title: Text('Design  your new post'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 25),
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            itemCount: 6,
            itemBuilder: (context, i) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: InkWell(
                  onTap: () async {
                    if (await canLaunch(link[i].value))
                      await launch(link[i].value);
                    else
                      // can't launch url, there is some error
                      throw "Could not launch $link[i].value";
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(img[i].value),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
// ElevatedButton(
//                     onPressed: () {
//                       print(img);
//                     },
//                     child: Text('data'))
