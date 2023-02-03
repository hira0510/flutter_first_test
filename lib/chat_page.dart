import 'package:flutter/material.dart';
import 'package:flutter_first_test/chat_friend_page.dart';
import 'package:flutter_first_test/chat_room_page.dart';
import 'package:flutter_first_test/chat_setup_page.dart';

// ignore: use_key_in_widget_constructors
class ChatPage extends StatelessWidget {
  final List<Tab> mTabs = <Tab>[
    const Tab(text: '好友'),
    const Tab(text: '聊天室'),
    const Tab(text: '設定')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: mTabs.length,
        child: Scaffold(
          appBar: PreferredSize(
              child: SizedBox(
                height: 44,
                child: TabBar(
                  tabs: mTabs,
                  indicatorColor: Colors.teal,
                  unselectedLabelColor: Colors.pink,
                  labelColor: Colors.deepOrange,
                ),
              ),
              preferredSize: const Size.fromHeight(kToolbarHeight)),
          body: TabBarView(
            children: [
              ChatFriendPage(),
              ChatRoomPage(),
              const ChatSetupPage(),
            ],
          ),
        ),
      ),
    );
  }
}

// body: NestedScrollView(
//   headerSliverBuilder: (context, value) { return [_appBar()]; },
//   body: TabBarView(
//     children: [
//       HomePage(),
//       HomePage(),
//       HomePage(),
//       HomePage(),
//       HomePage(),
//       HomePage(),
//       HomePage(),
//     ],
//   ),
// ),