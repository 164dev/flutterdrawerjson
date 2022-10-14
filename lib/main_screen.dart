import 'package:flutter/material.dart';
import 'package:flutterdrawerjson/side_menu.dart';
import 'package:flutterdrawerjson/side_menu_api.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Drawer get API JSON',
          style: TextStyle(
            color: Color.fromARGB(232, 2, 47, 105),
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 2, 47, 105),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        shape: Border(
            bottom:
                BorderSide(color: Color.fromARGB(127, 8, 88, 119), width: 1)),
        elevation: 0,
      ),
      // drawer: Expanded(child: SideMenu()),
      drawer: Expanded(child: SideMenuApi()),
      body: Center(child: Text('test')),
    );
  }
}
