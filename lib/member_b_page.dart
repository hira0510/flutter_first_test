import 'package:flutter/material.dart';

class Product {
  String name;
  int money;
  Product(this.name, this.money);
}

class MemberBPage extends StatelessWidget {
  final Product product;

  ///ð¢å¦ææäººä½¿ç¨BPageè¦å³ä»éº¼é²ä¾ï¼å¸ææ¯å¯é¸åæ¸æä»¥å°æ¬èè£¡é¢æä¸åå¤§æ¬èï¼å¨è£¡é¢çæææ¯å¯é¸ä¹å¯æå®çµ¦èª°ð¢
  ///ð¢æ¯åwidgeté½æä¸ækeyï¼å¦æè¦æ´æ°çè©±ææ ¹æéækeyå»æ´æ°åªä¸ååä»¶ð¢
  ///ð¢Thisçæææ¯ç´æ¥å³é²éåå¼è£¡é¢ð¢
  // ignore: prefer_const_constructors_in_immutables
  MemberBPage({Key? key, required this.product}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ææ¯Bé '),
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
        ElevatedButton(onPressed: () => Navigator.pop(context, '\nååï¼${product2.name}\nå¹é¢ï¼${product2.money}'),
        child: const Text('åæå¡é ')),
        Text('ååï¼${product.name}\nå¹é¢ï¼${product.money}', maxLines: 2,)
      ],),
    );
  }
}
