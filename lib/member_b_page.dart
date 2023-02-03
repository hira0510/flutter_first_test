import 'package:flutter/material.dart';

class Product {
  String name;
  int money;
  Product(this.name, this.money);
}

class MemberBPage extends StatelessWidget {
  final Product product;

  ///🟢如果有人使用BPage要傳什麼進來，希望是可選參數所以小括號裡面有一個大括號，在裡面的意思是可選也可指定給誰🟢
  ///🟢每個widget都有一把key，如果要更新的話會根據這把key去更新哪一個元件🟢
  ///🟢This的意思是直接傳進這個值裡面🟢
  // ignore: prefer_const_constructors_in_immutables
  MemberBPage({Key? key, required this.product}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我是B頁'),
      ),
      body: _MemberBPage(product: product),
    );
  }
}

class _MemberBPage extends StatelessWidget {

  final Product product;
  const _MemberBPage({Key? key, required this.product}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product2 = Product('YuKi', 88888888888);
    return Center(
      child: Column(children: [
        ElevatedButton(onPressed: () => Navigator.pop(context, '\n商品：${product2.name}\n價錢：${product2.money}'),
        child: const Text('回會員頁')),
        Text('商品：${product.name}\n價錢：${product.money}', maxLines: 2,)
      ],),
    );
  }
}
