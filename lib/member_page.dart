import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_test/member_b_page.dart';

enum ConfirmType { accept, cancel }
enum SelectType { flutter, swift, java }

class MemberPage extends StatefulWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  _MemberPage createState() => _MemberPage();
}

class _MemberPage extends State<MemberPage> {
  // ignore: prefer_typing_uninitialized_variables
  var result;

  @override
  Widget build(BuildContext context) {
    final TextEditingController mController = TextEditingController();

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: const Text('這是',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.greenAccent,
                          decoration: TextDecoration.underline)),
                  color: Colors.blue),
              Container(
                child: const Text('一個',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.amber,
                        decoration: TextDecoration.overline)),
                color: Colors.deepPurple,
              ),
              Container(
                  child: const Text('問號',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.cyanAccent,
                          decoration: TextDecoration.lineThrough)),
                  color: Colors.deepOrange)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: const Text('還有',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold)),
                  color: Colors.teal),
              Container(
                child: const Text('一個',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.pink,
                        fontWeight: FontWeight.w100)),
                color: Colors.greenAccent,
              ),
              Container(
                  child: const Text('測試',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.green,
                          fontWeight: FontWeight.w900)),
                  color: Colors.amber)
            ],
            // ignore: avoid_print
          ),
          MaterialButton(
              child: const Text('跳到B頁'),
              color: Colors.greenAccent,
              // ignore: avoid_print
              onPressed: () {
                goToBPage(context);
              }),
          Text(
            'B頁返回值：$result',
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          // ignore: avoid_print
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TestBtn(
                mText: '回調',
                clickTestBtn: (str) => showSnackBar(context, str),
                str: '回調按鈕的回調',
              ),

              ///🟢可以用box控制間距🟢 const SizedBox(width: 20),
              TestBtn(
                mText: '回調加系統(輸入)窗',
                clickTestBtn: (str) async {
                  final ConfirmType? action =
                      await showAlertDialog(context, str);
                  // ignore: missing_enum_constant_in_switch
                  switch (action) {
                    case ConfirmType.cancel:
                      // ignore: avoid_print
                      return print('點擊關閉');
                    case ConfirmType.accept:
                      // ignore: avoid_print
                      return print('點擊確認');
                  }
                },
                str: '回調加系統(輸入)窗的回調',
              ),
              TestBtn(
                mText: '回調加選擇窗',
                clickTestBtn: (str) async {
                  final SelectType? action =
                      await showSimpleDialog(context, str);
                  // ignore: missing_enum_constant_in_switch
                  switch (action) {
                    case SelectType.java:
                      // ignore: avoid_print
                      return print('點擊Java');
                    case SelectType.swift:
                      // ignore: avoid_print
                      return print('點擊Swift');
                    case SelectType.flutter:
                      // ignore: avoid_print
                      return print('點擊Flutter');
                  }
                },
                str: '回調加選擇窗的回調',
              )
            ],
          ),
          Container(
            child: TextField(
              textAlign: TextAlign.left,
              cursorColor: Colors.amber,
              maxLength: 5,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.green),
              controller: mController,

              ///🟢是否設為隱碼🟢 obscureText: false,
              decoration: const InputDecoration(

                  ///🟢內容內邊距，影響高度contentPadding🟢
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),

                  ///🟢背景色isCollapsed🟢
                  isCollapsed: true,
                  helperText: 'helper',
                  helperStyle: TextStyle(color: Colors.deepOrange),
                  suffixText: 'suffix',
                  suffixStyle: TextStyle(color: Colors.teal),
                  prefixIcon: Icon(Icons.add_ic_call_sharp),
                  prefixText: '帳號  ',
                  prefixStyle: TextStyle(color: Colors.pink),
                  filled: true,
                  // fillColor: Colors.black12,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: '請輸入...',
                  hintStyle: TextStyle(color: Colors.cyanAccent)),
              // ignore: avoid_print
            ),
            margin: const EdgeInsets.only(left: 20, right: 20),
          ),
          ElevatedButton(
              child: const Text('印出輸入內容'),
              // ignore: avoid_print
              onPressed: () => print(mController.text)),
          Stack(
            children: [
              Container(
                color: Colors.blueAccent,
                child: const Text(
                  '111',
                  style: TextStyle(fontSize: 40),
                ),
              ),

              ///🟢偏移🟢Positioned
              Positioned(
                top: 10,
                left: 15,
                child: Container(
                  color: Colors.deepOrange,
                  child: const Text(
                    '222',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],

            ///🟢條外部大小🟢fit : StackFit.expand,
          )
        ]);
  }

  void goToBPage(BuildContext context) async {
    ///🟢要加async跟await 才會去等B頁的資料🟢
    Product product = Product('一平', 999999999);
    var resultValue = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => MemberBPage(product: product)));
    setState(() {
      result = resultValue;
    });
  }

  void showSnackBar(BuildContext context, String str) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('test'),
        duration: const Duration(seconds: 3),
        action:
            // ignore: avoid_print
            SnackBarAction(label: '關閉', onPressed: () => print(str))));
  }

  Future<ConfirmType?> showAlertDialog(BuildContext context, String str) {
    String inputData = '';
    return showDialog<ConfirmType?>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(str),
            content: Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                        autofocus: true,
                        decoration: const InputDecoration(labelText: '輸入對話窗'),
                        onChanged: (str) => inputData = str))
              ],
            ),
            actions: [
              ElevatedButton(
                  child: const Text('關閉'),
                  onPressed: () {
                    // ignore: avoid_print
                    print(inputData);
                    Navigator.of(context).pop(ConfirmType.cancel);
                  }),
              ElevatedButton(
                child: const Text('確認'),
                onPressed: () {
                  // ignore: avoid_print
                  print(inputData);
                  Navigator.of(context).pop(ConfirmType.accept);
                },
              )
            ],
          );
        });
  }

  Future<SelectType?> showSimpleDialog(BuildContext context, String str) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(str),
            children: [
              SimpleDialogOption(
                  child: const Text('Java'),
                  onPressed: () => Navigator.of(context).pop(SelectType.java)),
              SimpleDialogOption(
                  child: const Text('Swift'),
                  onPressed: () => Navigator.of(context).pop(SelectType.swift)),
              SimpleDialogOption(
                  child: const Text('Flutter'),
                  onPressed: () =>
                      Navigator.of(context).pop(SelectType.flutter))
            ],
          );
        });
  }
}

class TestBtn extends StatelessWidget {
  final String mText;
  final String str;
  //🟢閉包
  final void Function(String str) clickTestBtn;

  // final VoidCallback clickTestsBtn;

  const TestBtn(
      {Key? key,
      required this.mText,
      required this.clickTestBtn,
      required this.str})
      : super(key: key);

  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Text(mText),
        color: Colors.pink,
        splashColor: Colors.teal,
        onPressed: () => clickTestBtn(str));
  }
}
