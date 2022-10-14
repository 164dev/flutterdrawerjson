import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutterdrawerjson/side_menu.dart';

class SideMenuApi extends StatefulWidget {
  @override
  SideMenuApiPageState createState() => new SideMenuApiPageState();
}

class SideMenuApiPageState extends State<SideMenuApi> {
  List? data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = jsonDecode(response.body);
    });
    print(data![1]["title"]);
    return "Sukses!";
  }

  @override
  void initState() {
    print('init state here');
    getData();
    print('init state sudah');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        Container(
          height: 55.0,
          child: DrawerHeader(
              child: Center(
                  child: Text('Main Menu',
                      style: TextStyle(
                        color: Color.fromARGB(255, 32, 85, 184),
                      ))),
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 227, 238, 247)),
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0)),
        ),
        Container(
          height: double.maxFinite,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              itemCount: data == null ? 0 : data!.length,
              // itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return new ListTile(
                  title: Text(data![index]["title"],
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 224, 238, 255))),
                  // title: Text("dfd"),
                  leading: SvgPicture.asset(
                    "assets/icons/menu_dashbord.svg",
                    color: Colors.white54,
                    height: 16,
                  ),
                  horizontalTitleGap:
                      1.0, // The horizontal gap between the titles and the leading/trailing widgets.
                  dense: true,
                  visualDensity: VisualDensity(vertical: 0.01), // to expand
                  onTap: () {},
                );
              }),
        ),
      ],
    ));
  }
}
