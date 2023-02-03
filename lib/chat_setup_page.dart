import 'package:flutter/material.dart';

class ChatSetupPage extends StatelessWidget {
  const ChatSetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(100),
        1: FixedColumnWidth(50),
        2: FixedColumnWidth(100)
      },
      border: TableBorder.all(
          color: Colors.blue, width: 2, style: BorderStyle.solid),
      children: const <TableRow>[
        TableRow(
          children: [Text('設定一'), Text('音量'), Text('100')],
        ),
        TableRow(
          children: [Text('設定二'), Text('亮度'), Text('100')],
        ),
        TableRow(
          children: [Text('設定三'), Text('畫質'), Text('100')],
        )
      ],
    ));
  }
}
