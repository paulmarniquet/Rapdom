import 'package:RapGenerator/game.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color.fromARGB(255, 248, 240, 203),
            body: Center(
                child: Stack(children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, PlayPage());
                },
                child: Image.network(
                    "https://rapscript.net/wp-content/uploads/2019/09/rapscript-logo.png",
                    width: 350,
                    height: 350),
              )
            ]))));
  }
}
