import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:geocoding/geocoding.dart';
import 'package:soultion/matrial/const.dart';
import 'package:soultion/screens/homepage.dart';

import '../../Data/data.dart';

class Location extends StatefulWidget {
  Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
//location function
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      AwesomeDialog(
              context: context,
              title: 'services',
              body: const Text('services not Enable'))
          .show();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return clo = await Geolocator.getCurrentPosition();
  }

//end location function

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset('assets/images/map.png'),
          Text(
            'Lorem ipsum dolor sit amet consectetur adcing elit. Omnis a, ea neque  sit iure Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis a, ea neque sit iure fugiat fugiat!',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: loc.isNotEmpty ? white : dark,
            onPressed: () async {
              await _determinePosition();
              List<Placemark> placemarks =
                  await placemarkFromCoordinates(clo!.latitude, clo!.longitude);
              loc = placemarks;

              if (placemarks.isNotEmpty) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home()));
              }
            },
            height: 50,
            elevation: loc.isNotEmpty ? 0 : 2,
            child: Text(
              "Get Your Location ",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
