import 'package:flutter/material.dart';

void main() =>runApp(Myapp());

Myapp() {
  return MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('I am poor'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
          child: Image(
              image: NetworkImage(
                  'https://www.shutterstock.com/image-vector/pile-charcoal-graphite-coallump-coal-pickaxe-1235339950?language=en&id=1235339950&irgwc=1&utm_medium=Affiliate&utm_campaign=Eezy%2C%20LLC&utm_source=38919&utm_term=www.vecteezy.com'))),
    ),
  );
}
