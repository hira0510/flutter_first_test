import 'package:flutter/material.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class ChatFriendPage extends StatelessWidget {
  ///🟢不一定要放ListTile 都可以放
  ///🟢generate生成資料🟢
  final List<FriendModel> mList = List<FriendModel>.generate(500, (i) {
    return FriendModel(name: '測試', id: '$i');
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      ///🟢大量資料要用ListView.builder,少於螢幕數量可以用ListView
      child: ListView.separated(
        itemCount: mList.length,
        itemBuilder: (context, index) {
          // ignore: prefer_const_constructors
          return ListTile(
            // ignore: prefer_const_constructors
            leading: Icon(
              Icons.category,
              color: Colors.deepOrange,
            ),
            title: Text(mList[index].name),
            subtitle: Text(mList[index].id),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0
              ? const Divider(color: Colors.deepOrange)
              : const Divider(color: Colors.deepPurple);
        },
      ),
    );
  }
}

class FriendModel {
  final String name;
  final String id;

  FriendModel({required this.name, required this.id});
}
