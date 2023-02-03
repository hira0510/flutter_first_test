import 'package:flutter/material.dart';
import 'package:flutter_first_test/chat_friend_page.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class ChatRoomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatRoomPageState();
}

// ignore: use_key_in_widget_constructors
class ChatRoomPageState extends State<StatefulWidget> {
  final List<FriendModel> mModel = List.generate(10, (index) {
    return FriendModel(name: 'name', id: '$index');
  });

  @override
  Widget build(BuildContext context) {
    ///🟢大量資料要用GridView.builder,GridView
    return Center(
      child: GridView.builder(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),

          ///🟢控制滑動方向🟢scrollDirection
          scrollDirection: Axis.vertical,
          itemCount: mModel.length,

          ///🟢每排的數量🟢crossAxisCount
          ///🟢item比例🟢childAspectRatio
          ///🟢左右滑的左右間距、上下滑的上下間距🟢mainAxisSpacing
          ///🟢左右滑的上下間距、上下滑的左右間距🟢crossAxisSpacing
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 50 / 60,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            if (index == mModel.length - 1 && mModel.length < 100) {
              request();
            }
            return Container(
              child: GestureDetector(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.category,
                        color: Colors.amberAccent,
                      ),
                      Container(
                        child: Text(
                          mModel[index].name + mModel[index].id,
                          overflow: TextOverflow.ellipsis,
                        ),
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        color: Colors.amber,
                      )
                    ]),
                // ignore: avoid_print
                onTap: () => print('$index'),
              ),
              color: Colors.blueAccent,
            );
          }),
    );
  }

  void request() {
    Future.delayed(const Duration(milliseconds: 400)).then((value) {
      final List<FriendModel> model = List<FriendModel>.generate(10, (index) {
        return FriendModel(name: 'name', id: '${mModel.length + index}');
      });

      setState(() {
        mModel.addAll(model);
      });
    });
  }
}
