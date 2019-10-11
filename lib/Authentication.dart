import 'dart:core' as prefix0;
import 'dart:core';

//import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthImplementation{
  prefix0.Future<String> signIn(String email,String password);
  prefix0.Future<String> signUp(String email,String password);
  prefix0.Future<String> getCurrentUser();
  prefix0.Future<void> signOut();

}
class Auth implements AuthImplementation{
  final FirebaseAuth firebaseAuth =FirebaseAuth.instance;
  prefix0.Future<String> signIn(String email,String password) async
  {
    FirebaseUser user=(await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
    return user.uid;
  }
  prefix0.Future<String> signUp(String email,String password) async
  {
    FirebaseUser user=(await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
    return user.uid;
  }
  prefix0.Future<String> getCurrentUser() async
  {
    FirebaseUser user=await firebaseAuth.currentUser();
    return user.uid;
  }
  prefix0.Future<void> signOut() async
  {
    firebaseAuth.signOut();
  }

}