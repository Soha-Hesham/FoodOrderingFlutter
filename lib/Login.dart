import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Home.dart';
import 'package:food_ordering_app/Welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'SignUp.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController(); // Email
  final TextEditingController passwordController = new TextEditingController(); // Password

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  Widget build(BuildContext context) {
    final emailField = TextFormField(
      // autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!; // GETTING the value of edit text
      },
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        icon: Icon(Icons.email_outlined, color: Colors.white,),
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.deepOrangeAccent),
        //validator(value)
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        icon: Icon(Icons.lock_outline, color: Colors.white,),
        labelText: "Password",
        labelStyle: TextStyle(color: Colors.deepOrangeAccent),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),);

    // login button field
    final loginButton = Container(
        width: 300,
        height: 60,
        child: RaisedButton(
            color: Colors.deepOrangeAccent,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.brown, width: 2),
                borderRadius: BorderRadius.circular(30)
            ),
            onPressed: () {
               signInValidation(emailController.text, passwordController.text);
            },
            child: Text("Sign In", style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),
            )
        )
    );

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const welcome(),));
              }),
        ),
        body: Center(
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 900,
                          height: 100,
                          child: Center(
                            child: Image.asset('images/login.png'),
                          ),
                        ),
                        Text("Sign In", style: TextStyle(color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),),
                        SizedBox(height: 45),
                        emailField,
                        SizedBox(height: 25),
                        passwordField,
                        SizedBox(height: 35),
                        loginButton,
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Dont have an Account?",
                              style: TextStyle(color: Colors.white),),
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Sign Up',
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontSize: 15),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                                context, MaterialPageRoute(
                                              builder: (context) => const SignUp(),
                                            ));
                                          }
                                    )
                                  ]
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
              ),
          )),
    );
  }

    void signInValidation(String email, String password) async {
      if (_formKey.currentState!.validate()) {
        try {
          await _auth
              .signInWithEmailAndPassword(email: email, password: password)
              .then((uid) =>
          {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home())),
          });
        } on FirebaseAuthException catch (error) {
          switch (error.code) {
            case "invalid-email":
              errorMessage = "Your email address appears to be malformed.";
              break;
            case "wrong-password":
              errorMessage = "Your password is wrong.";
              break;
            case "user-not-found":
              errorMessage = "User with this email doesn't exist.";
              break;
            case "user-disabled":
              errorMessage = "User with this email has been disabled.";
              break;
            case "too-many-requests":
              errorMessage = "Too many requests";
              break;
            case "operation-not-allowed":
              errorMessage =
              "Signing in with Email and Password is not enabled.";
              break;
            default:
              errorMessage = "An undefined Error happened.";
          }
          // Fluttertoast.showToast(msg: errorMessage!);
          print(error.code);
        }
      }

  }
}
