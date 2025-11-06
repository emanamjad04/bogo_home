import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: home(),
    )
  );
}
class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('home'),
    );
  }
}
