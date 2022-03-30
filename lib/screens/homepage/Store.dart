import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:soultion/matrial/const.dart';
import 'package:soultion/screens/homepage/store_sceens/addProdectPage.dart';
import '../../../Data/data.dart';
import 'package:soultion/matrial/search.dart';
import 'package:soultion/screens/homepage/store_sceens/infoproduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class store extends StatefulWidget {
  store({Key? key}) : super(key: key);

  @override
  _storeState createState() => _storeState();
}

class _storeState extends State<store> {
  CollectionReference product =
      FirebaseFirestore.instance.collection('prodect');
  getData() async {
    data = [];
    var responsebody = await product.get();
    responsebody.docs.forEach((element) {
      setState(() {
        data.add(element.data());
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
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const addproduct()));
        },
        backgroundColor: dark,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: Container(),
        backgroundColor: dark,
        centerTitle: true,
        title: Text('Your Store'),
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
        child: ListView.builder(
            itemCount: data.length,
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
                    title: Text('${data[index]['prodectname']} '),
                    subtitle: Text('${data[index]['discrption']}'),
                    leading: data[index]['imageUrl '] == null
                        ? LineIcon(
                            LineIcons.boxes,
                            size: 50,
                          )
                        : Image.network(" ${data[index]['imageUrl']}"),
                    trailing: Text('${data[index]['number']}'),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
