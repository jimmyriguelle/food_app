import 'package:flutter/material.dart';
import 'package:food_app/pages/home_page.dart';
import 'package:food_app/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  List activeTabs = [
    LineIcons.home,
    LineIcons.barcode,
    LineIcons.comment,
    LineIcons.user
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: activeTab,
        children: const <Widget>[
          HomePage(),
          Center(
            child: Text(
              'Product List',
              style: TextStyle(fontSize: 35),
            ),
          ),
          Center(
            child: Text(
              'Chat',
              style: TextStyle(fontSize: 35),
            ),
          ),
          Center(
            child: Text(
              'Account',
              style: TextStyle(fontSize: 35),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: white),
        width: MediaQuery.of(context).size.width,
        height: 90,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 15, left: 15, right: 15),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(30),
                color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(activeTabs.length, (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        activeTab = index;
                      });
                    },
                    icon: Icon(
                      activeTabs[index],
                      color: Colors.white,
                      size: 25,
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
