import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Home.dart';
import 'UserData.dart';
import 'Welcome.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController usernameController = new TextEditingController(); // UserName
  final TextEditingController emailController = new TextEditingController(); // Email
  final TextEditingController passwordController = new TextEditingController(); // Password
  final TextEditingController confirmPasswordController = new TextEditingController(); // Confirm Password

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //user name field
    final userNameField = TextFormField(
      autofocus: false,
      controller: usernameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          return ("User Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 4 Character)");
        }
        return null;
      },
      onSaved: (value) {
        usernameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        icon: Icon(Icons.person_outline, color: Colors.white,),
        labelText: "UserName",
        labelStyle: TextStyle(color: Colors.deepOrangeAccent),
        //validator(value)
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );

    // email field
    final emailField = TextFormField(
      autofocus: false,
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
        usernameController.text = value!;
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
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        icon: Icon(Icons.lock_outline, color: Colors.white,),
        labelText: "Password",
        labelStyle: TextStyle(color: Colors.deepOrangeAccent),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );

    //confirm password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordController.text !=
            passwordController.text) {
          return "Password don't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        icon: Icon(Icons.lock_outline, color: Colors.white,),
        labelText: "Confirm Password",
        labelStyle: TextStyle(color: Colors.deepOrangeAccent),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      );

    // sign up button
    final registerButton = Container(
        width: 300,
        height: 60,
        child: RaisedButton(
            color: Colors.deepOrangeAccent,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.brown, width: 2),
                borderRadius: BorderRadius.circular(30)
            ),
            onPressed: () {
               signUpValidation(emailController.text, passwordController.text);
            },
            child: Text("Sign Up", style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),
            )
        )
    );

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
         backgroundColor: Colors.black,
         leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white,), onPressed: () {
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
                           child: Image.asset('images/SignUp.png'),
                         ),
                       ),
                       Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                       SizedBox(height: 45),
                       userNameField,
                       SizedBox(height: 20),
                       emailField,
                       SizedBox(height: 20),
                       passwordField,
                       SizedBox(height: 20),
                       confirmPasswordField,
                       SizedBox(height: 20),
                       registerButton,
                       SizedBox(height: 15),
                     ])),),
         ),),);
  }

  void signUpValidation(String email, String password) async {

    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {saveToFirestore()})
            .catchError((e) {
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
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        print(error.code);
      }
    }
  }

  saveToFirestore() async {

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserData userData = UserData();

    // writing all the values
    userData.email = user!.email;
    userData.uid = user.uid;
    userData.userName = usernameController.text;
    userData.password = passwordController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userData.toMap());

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => Home()),
            (route) => false);
  }
}

