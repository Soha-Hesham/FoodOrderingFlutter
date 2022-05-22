import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  String? uid;
  String? email;
  String? userName;
  String? password;

  UserData({this.uid, this.email, this.userName, this.password});

  // receiving data from server
  factory UserData.fromMap(map) {
    return UserData(
      uid: map['uid'],
      email: map['email'],
      userName: map['userName'],
      password: map['password'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
      'password': password,
    };
  }
}