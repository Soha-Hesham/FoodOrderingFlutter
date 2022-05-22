
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Welcome.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          Padding(
              padding: const EdgeInsets.all(9.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/profile.png'),
              )
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xff2b2b2b),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(fit: BoxFit.cover, image: AssetImage('images/background.png'))
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/drawer.png'),
                  ),
                  accountName: Text("Ahmed Ashraf"),
                  accountEmail: Text("ahmedashraf98@gmail.com"),
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.white,),
                  title: Text("Profile", style: TextStyle(fontSize: 20, color: Colors.white),),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(Icons.shop, color: Colors.white,),
                  title: Text("Order", style: TextStyle(fontSize: 20, color: Colors.white),),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart, color: Colors.white,),
                  title: Text("Shopping Cart", style: TextStyle(fontSize: 20, color: Colors.white),),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                ListTile(leading: Text("Other Info", style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20)),),
                ListTile(
                  leading: Icon(Icons.lock, color: Colors.white,),
                  title: Text("Edit Profile", style: TextStyle(fontSize: 20, color: Colors.white),),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.white,),
                  title: Text("Log Out", style: TextStyle(fontSize: 20, color: Colors.white),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const welcome(),));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.search, color: Colors.white,),
                    filled: true,
                    fillColor: Color(0xff3a3e3e),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),),
          Column(
            children: [
            SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('images/all.png')),
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("All", style: TextStyle(fontSize: 18, color: Colors.white,),),
                  ],),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('images/burger.png')),
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Burger", style: TextStyle(fontSize: 18, color: Colors.white,),),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('images/pizza.png')),
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Pizza", style: TextStyle(fontSize: 18, color: Colors.white,),),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('images/sandwich.png')),
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Sandwich", style: TextStyle(fontSize: 18, color: Colors.white,),),
                  ],
                ),],),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 500,
            child:  GridView.count(
              shrinkWrap: false,
              primary: false,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                Container(
                  height: 270,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Color(0xff3a3e3e3e),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/pizza1.png'),
                      ),
                      ListTile(leading: Text("Peproni", style: TextStyle(fontSize: 15, color: Colors.white),),
                        trailing: Text("EGP130", style: TextStyle(fontSize: 15, color: Colors.white),),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.white, size: 20,),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  height: 270,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Color(0xff3a3e3e3e),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/pizza2.png'),
                      ),
                      ListTile(leading: Text("Cheese", style: TextStyle(fontSize: 15, color: Colors.white),),
                        trailing: Text("EGP80", style: TextStyle(fontSize: 15, color: Colors.white),),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  height: 270,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Color(0xff3a3e3e3e),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/sandwich1.png'),
                      ),
                      ListTile(leading: Text("Beef", style: TextStyle(fontSize: 15, color: Colors.white),),
                        trailing: Text("EGP90", style: TextStyle(fontSize: 15, color: Colors.white),),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.white, size: 20,),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  height: 270,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Color(0xff3a3e3e3e),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/sandwich2.png'),
                      ),
                      ListTile(leading: Text("Pacon", style: TextStyle(fontSize: 15, color: Colors.white),),
                        trailing: Text("EGP100", style: TextStyle(fontSize: 15, color: Colors.white),),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.white, size: 20,),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  height: 270,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Color(0xff3a3e3e3e),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/burger1.png'),
                      ),
                      ListTile(leading: Text("Big Mac", style: TextStyle(fontSize: 15, color: Colors.white),),
                        trailing: Text("EGP85", style: TextStyle(fontSize: 15, color: Colors.white),),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.white, size: 20,),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  height: 270,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Color(0xff3a3e3e3e),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/burger2.png'),
                      ),
                      ListTile(leading: Text("Mac Chicken", style: TextStyle(fontSize: 15, color: Colors.white),),
                        trailing: Text("EGP70", style: TextStyle(fontSize: 15, color: Colors.white),),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.white, size: 20,),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  height: 270,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Color(0xff3a3e3e3e),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/pizza3.png'),
                      ),
                      ListTile(leading: Text("Hawaiian", style: TextStyle(fontSize: 15, color: Colors.white),),
                        trailing: Text("EGP150", style: TextStyle(fontSize: 15, color: Colors.white),),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.white, size: 20,),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  height: 270,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Color(0xff3a3e3e3e),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/pizza4.png'),
                      ),
                      ListTile(leading: Text("Chicken", style: TextStyle(fontSize: 15, color: Colors.white),),
                        trailing: Text("EGP160", style: TextStyle(fontSize: 15, color: Colors.white),),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.white, size: 20,),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  height: 270,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Color(0xff3a3e3e3e),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/burger3.png'),
                      ),
                      ListTile(leading: Text("Beef Burger", style: TextStyle(fontSize: 15, color: Colors.white),),
                        trailing: Text("EGP90", style: TextStyle(fontSize: 15, color: Colors.white),),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.white, size: 20,),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  height: 270,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Color(0xff3a3e3e3e),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/burger4.png'),
                      ),
                      ListTile(leading: Text("Gucci", style: TextStyle(fontSize: 15, color: Colors.white),),
                        trailing: Text("EGP110", style: TextStyle(fontSize: 15, color: Colors.white),),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.white, size: 20,),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  height: 270,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Color(0xff3a3e3e3e),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/sandwich3.png'),
                      ),
                      ListTile(leading: Text("Chicken", style: TextStyle(fontSize: 15, color: Colors.white),),
                        trailing: Text("EGP120", style: TextStyle(fontSize: 15, color: Colors.white),),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.white, size: 20,),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  height: 270,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Color(0xff3a3e3e3e),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/sandwich4.png'),
                      ),
                      ListTile(leading: Text("BreakFast", style: TextStyle(fontSize: 15, color: Colors.white),),
                        trailing: Text("EGP95", style: TextStyle(fontSize: 15, color: Colors.white),),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.white, size: 20,),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                              Icon(Icons.star, color: Colors.white, size: 20),
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
    ]),],
    ),
    );
  }
}
