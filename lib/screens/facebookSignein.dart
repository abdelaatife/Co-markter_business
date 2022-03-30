import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:soultion/matrial/const.dart';
import '../../../Data/data.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

//facebook page
String prettyPrint(Map json) {
  JsonEncoder encoder = new JsonEncoder.withIndent('');
  String pretty = encoder.convert(json);
  return pretty;
}

class signin extends StatefulWidget {
  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  bool _checking = true;

  @override
  void initState() {
    super.initState();
    _checkIfIsLogged();
  }

  Future<void> _checkIfIsLogged() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    setState(() {
      _checking = false;
    });
    if (accessToken != null) {
      print("is Logged:::: ${prettyPrint(accessToken.toJson())}");
      final userData = await FacebookAuth.instance.getUserData();
      accessTokens = accessToken;
      setState(() {
        usersData = userData;
      });
    }
  }

  void _printCredentials() {
    print(
      prettyPrint(accessTokens!.toJson()),
    );
  }

  Future<void> _login() async {
    final LoginResult result = await FacebookAuth.instance.login(permissions: [
      'email',
      'business_management',
      'pages_manage_cta',
      'pages_manage_posts',
      'pages_show_list',
      'read_insights'
    ]);

    if (result.status == LoginStatus.success) {
      accessTokens = result.accessToken;
      _printCredentials();
      final userData = await FacebookAuth.instance.getUserData();

      setState(() {
        usersData = userData;
      });
    } else {
      print(result.status);
      print(result.message);
    }

    setState(() {
      _checking = false;
    });
  }

  Future<void> logOut() async {
    await FacebookAuth.instance.logOut();

    setState(() {
      accessTokens = null;
      usersData = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _checking
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image.asset('assets/images/Social tree-pana.png'),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Lorem ipsum dolor sit amet consectetur adcing elit. Omnis a, ea neque sit iure Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis a, ea neque sit iure fugiat fugiat!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                        child: usersData == null
                            ? MaterialButton(
                                elevation: 1,
                                height: 50,
                                color: dark,
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(
                                        Icons.facebook,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "LOGIN WITH FACEBOOK",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ]),
                                onPressed: usersData != null ? logOut : _login,
                              )
                            : null),
                  ],
                ),
              ),
      ),
    );
  }
}
