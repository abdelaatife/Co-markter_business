import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:line_icons/line_icons.dart';
import 'package:soultion/Data/data.dart';
import 'package:soultion/matrial/const.dart';
import 'package:soultion/screens/facebookSignein.dart';
import 'package:soultion/screens/homepage/addoffer.dart';
import 'package:soultion/screens/homepage/offerpage.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(160),
          onTap: () {},
          child: CircleAvatar(
            maxRadius: 40,
            backgroundColor: dark,
            child: usersData == null
                ? Image.asset('assets/images/Man thinking-pana.png')
                : Image.network('${usersData!["picture"]["data"]["url"]} '),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        usersData == null ? Text("user") : Text('${usersData!['name']} '),
        const SizedBox(
          height: 15,
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => addoffer()));
          },
          trailing: const Icon(LineIcons.tag),
          title: const Text('Add offer'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => offeroage()));
          },
          trailing: const Icon(LineIcons.tags),
          title: const Text('your offers'),
        ),
        ListTile(
          onTap: () {},
          trailing: const Icon(Icons.settings),
          title: const Text('settings'),
        ),
        ListTile(
          onTap: () {},
          trailing: const Icon(Icons.info),
          title: const Text('more info'),
        ),
        ListTile(
          onTap: () {},
          trailing: const Icon(Icons.contact_support),
          title: const Text('contact support'),
        ),
        const SizedBox(
          height: 40,
        ),
        const Divider(),
        ListTile(
          onTap: () async {
            if (usersData != null) {
              await FacebookAuth.instance.logOut();

              setState(() {
                accessTokens = null;
                usersData = null;
              });
            } else {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => signin()));
            }
          },
          trailing: usersData != null
              ? Icon(Icons.logout)
              : Icon(Icons.login_rounded),
          title: usersData != null ? Text('logout') : Text('login'),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    ));
  }
}
