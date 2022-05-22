import 'package:flutter/material.dart';
import 'package:food_ordering_app/Login.dart';
import 'package:food_ordering_app/SignUp.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(
            child: Center(
              child: Image.asset('images/logo.png'),
            ),
          ),
          ),
          Expanded(child: Container (
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Welcome..", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent,),
                ),
                Column(
                  children: [
                    Text("Order Food From Our Resturant..", style: TextStyle(fontSize: 20, color: Colors.white),)
                  ],
                ),
                Container(
                  width: 300,
                  height: 60,
                  child: RaisedButton(
                    color: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const login(),));
                      },
                    child: Text("Sign In", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, ),
                  )
                  )
                ),
                Container(
                    width: 300,
                    height: 60,
                    child: RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.deepOrangeAccent, width: 2),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const SignUp(),));
                        },
                        child: Text("Sign Up", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent,),
                        )
                    )
                ),
              ],
            ),
          )
            ,)
        ],
      ),
    );
  }
}
