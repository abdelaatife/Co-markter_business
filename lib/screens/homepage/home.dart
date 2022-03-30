import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:soultion/matrial/crcular.dart';
import 'package:soultion/matrial/HomeDrawer.dart';
import 'package:soultion/matrial/const.dart';
import 'package:badges/badges.dart';
import 'package:soultion/screens/homepage/plane.dart';
import '../../Data/data.dart';
import 'package:banner_listtile/banner_listtile.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  initialMessage() async {
    var message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      //function
    }
  }

  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
  List taskes = [];
  getData() async {
    taskes = [];

    var respons = await tasks.get();
    respons.docs.forEach((element) {
      setState(() {
        taskes.add(element.data());
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: dark,
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: CircleAvatar(
                backgroundColor: dark,
                child: usersData == null
                    ? Image.asset('assets/images/Man thinking-pana.png')
                    : Image.network('${usersData!["picture"]["data"]["url"]} '),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        elevation: 0,
        actions: [
          Badge(
            position: BadgePosition.bottomStart(start: 22, bottom: 20),
            //badge notifcation

            badgeContent: Text(
              ' ${notfi} ',
              style: TextStyle(color: Colors.red),
            ),
            badgeColor: Colors.white,

            child: IconButton(
                onPressed: () {
                  //notification action
                },
                icon: const Icon(
                  LineIcons.bell,
                  size: 30,
                  color: dark,
                )),
          ),
        ],
      ),
      drawer: SafeArea(
        child: HomeDrawer(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
            child: Container(
                //  color: red,
                ),
          ),
          Row(
            children: [
              Container(
                height: 190,
                width: getScreenWidth(context),
                decoration: BoxDecoration(
                    // color: red,
                    image: DecorationImage(
                        alignment: AlignmentDirectional.topEnd,
                        opacity: 0.2,
                        image: AssetImage(
                          "assets/images/Mobile apps-bro.png",
                        ),
                        fit: BoxFit.scaleDown)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 40, top: 35, left: 30, bottom: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Hello  ',
                                style: TextStyle(fontSize: 35),
                              ),
                              Icon(
                                LineIcons.grinningFace,
                                color: red,
                                size: 30,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'start now and grow \n with your business',
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [Circular()],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.stars_rounded,
                                color: Colors.amberAccent[400],
                              ),
                              Text(
                                "${star}    ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                LineIcons.medal,
                                color: Colors.amber[800],
                              ),
                              Text(
                                " ${midel} ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          // body of home
          //today mission
          Text(
            'Today mission',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: taskes.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    return Container(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BannerListTile(
                            borderRadius: BorderRadius.circular(5),
                            backgroundColor: Colors.transparent,
                            title: Text(
                              '${taskes[i]['title']}',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            subtitle: Text('${taskes[i]['countent']}',
                                style: TextStyle(
                                  fontSize: 13,
                                )),
                            showBanner: false,
                            imageContainer: Icon(
                              LineIcons.tasks,
                              size: 35,
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    taskes.indexOf(taskes[i]);
                                    taskes.removeAt(i);
                                    xp += 2;
                                    midel += 1;
                                    star += 2;
                                    notfi -= 1;
                                  });
                                },
                                icon: Icon(
                                  Icons.square_outlined,
                                )),
                          )),
                    );
                  })),

          Text(
            'your planes',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Expanded(
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 6,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          indeximg = i;
                        });
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => planes()));
                      },
                      child: Card(
                        child: Image.asset("assets/images/${img[i]}"),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
