import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soultion/Data/data.dart';
import 'package:soultion/matrial/const.dart';
import 'package:soultion/matrial/search.dart';
import 'package:soultion/screens/homepage/addoffer.dart';
import 'package:soultion/screens/homepage/store_sceens/infoproduct.dart';

class offeroage extends StatefulWidget {
  const offeroage({Key? key}) : super(key: key);

  @override
  _offeroageState createState() => _offeroageState();
}

class _offeroageState extends State<offeroage> {
  CollectionReference product = FirebaseFirestore.instance.collection('offers');
  getData() async {
    listeoffer = [];
    var responsebody = await product.get();
    responsebody.docs.forEach((element) {
      setState(() {
        listeoffer.add(element.data());
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const addoffer()));
        },
        backgroundColor: dark,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: Container(),
        backgroundColor: dark,
        centerTitle: true,
        title: Text('Your offers'),
        titleSpacing: 20,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: RefreshIndicator(
        color: dark,
        displacement: 30,
        onRefresh: (() async {
          initState();
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          child: ListView.builder(
            itemCount: listeoffer.length,
            itemBuilder: ((context, index) {
              return InkWell(
                //ontap
                onTap: () {
                  ind = index;
                  print(ind);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => infoproduct()));
                },
                //ondoubletap
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Container(
                            margin: const EdgeInsets.only(left: 12),
                            child: const Text("More actions :"),
                          ),
                          content: Container(
                            height: getScreenheight(context) / 4,
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
                                  leading: const Icon(Icons.add),
                                  title: const Text("shaw detail"),
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
                splashColor: Colors.grey,
                highlightColor: Colors.black12,
                borderRadius: BorderRadius.circular(10),

                child: Container(
                  height: 80,
                  margin: EdgeInsets.symmetric(
                      horizontal: getScreenWidth(context) / 20, vertical: 7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: .25,
                        color: blue,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: ListTile(
                    focusColor: red,
                    hoverColor: red,
                    title: Text('${listeoffer[index]['offername']} '),
                    subtitle: Text('${listeoffer[index]['discrption']}'),
                    leading: Text('${listeoffer[index]['prix']}DA'),
                    trailing: Text('${listeoffer[index]['date ']}'),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
