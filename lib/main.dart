import 'package:flutter/material.dart';
import 'package:flutter_first_test/chat_page.dart';
import 'package:flutter_first_test/home_page.dart';
import 'package:flutter_first_test/member_page.dart';

import 'main_drawer_item.dart';

void main() => runApp(MyApp());

// ignore: camel_case_types
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _myAppState();
}

// ignore: camel_case_types
class _myAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //🟢把右上DEBUG標籤刪掉🟢
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.greenAccent),
      home: const Scaffold(
        body: BottomNavigationController(),
      ),
    );
  }
}

class BottomNavigationController extends StatefulWidget {
  const BottomNavigationController({Key? key}) : super(key: key);

  @override
  BottomNavigationControllerState createState() =>
      BottomNavigationControllerState();
}

class BottomNavigationControllerState
    extends State<BottomNavigationController> {
  int mCurrentIndex = 0;
  final String spIndex = 'spIndex';
  final pages = [const HomePage(), ChatPage(), const MemberPage()];
  final mText = ['首頁', '聊天', '會員'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //🟢nav.title🟢
        appBar: AppBar(
          title: Text(mText[mCurrentIndex]),
          backgroundColor: Colors.deepPurple,
        ),
        drawer: MainDrawerItem(
          clickTestBtn: (i) {
            setState(() {
              mCurrentIndex = i;
            });
          },
        ),
        body: pages[mCurrentIndex],
        //🟢下導航欄元件🟢
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '首頁'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: '聊天'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: '會員')
          ],
          currentIndex: mCurrentIndex,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.green,
          onTap: didClickTab,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        // ignore: avoid_print
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.purpleAccent,
          onPressed: () {
            // ignore: avoid_print
            print('+++');
          },
        ));
  }

  void didClickTab(int index) {
    //🟢setState加上這段狀態才會變化🟢
    setState(() {
      mCurrentIndex = index;
    });
  }
}
