import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Welcome.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> {

  late BuildContext _context;

  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 750,
                  child: Image.network('https://w7.pngwing.com/pngs/123/579/png-transparent-food-chinese-cuisine-book-restaurant-cooking-pizza-food-recipe-poster.png'),
                ),
              ],
            )
        )
    );
  }

  _navigatetohome() async{
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(_context, MaterialPageRoute(builder:(context) => const welcome()));
  }
}
