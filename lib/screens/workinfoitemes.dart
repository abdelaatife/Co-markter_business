
import 'package:flutter/material.dart';

import '../matrial/const.dart';

bool tap = false;
List<Widget> itemes = [
  InkWell(
    onTap: () {
      tap = true;
      print(tap);
    },
    hoverColor: dark,
    child: Card(
      child: Column(
        children: [
          Image.asset('assets/images/Beauty salon.png'),
          Text('Beauty salon'.toUpperCase(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
        ],
      ),
    ),
  ),
  InkWell(
    onTap: () {},
    hoverColor: dark,
    child: Card(
      child: Column(
        children: [
          Image.asset('assets/images/clothes  store.png'),
          Text('clothes  store'.toUpperCase(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
        ],
      ),
    ),
  ),
  InkWell(
    onTap: () {
      
    },
    hoverColor: dark,
    child: Card(
      child: Column(
        children: [
          Image.asset('assets/images/restaurant.png'),
          Text('restaurant'.toUpperCase(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
        ],
      ),
    ),
  ),
  InkWell(
    onTap: () {},
    hoverColor: dark,
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/Supermarket.png'),
          Text(
            'Supermarket'.toUpperCase(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
    ),
  ),
];
