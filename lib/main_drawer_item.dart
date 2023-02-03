import 'package:flutter/material.dart';

typedef _DrawerCallBack = void Function(int index);
class MainDrawerItem extends StatefulWidget {
  final _DrawerCallBack clickTestBtn;

  const MainDrawerItem({Key? key, required this.clickTestBtn}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => MainDrawerItemState();
}

class MainDrawerItemState extends State<MainDrawerItem> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/0005022428_B.png')),
            accountName: Text('Hira'),
            accountEmail: Text('uuby688'),
          ),
          ListTile(
              leading: const Icon(Icons.ac_unit),
              title: const Text('首頁'),
              onTap: () {
                didClickItem(0);
              }),
          ListTile(
              leading: const Icon(Icons.circle),
              title: const Text('聊天'),
              onTap: () {
                didClickItem(1);
              }),
          ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('會員'),
              onTap: () {
                didClickItem(2);
              })
        ],
      ),
    );
  }

  void didClickItem(int index) {
    //🟢setState加上這段狀態才會變化🟢
    Navigator.of(context).pop();
    setState(() {
      widget.clickTestBtn(index);
    });
  }
}