



import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String name;
  String profilePhoto;
  String email;
  String uid;


  User({required this.name, required this.profilePhoto, required this.email, required this.uid});





  Map<String, dynamic> toJson()=>{
    'name': name,
    'profilePhoto': profilePhoto,
    'email': email,
    'uid': uid,
  };


  static User fromSnap(DocumentSnapshot snap){
    var snapShot = snap.data() as Map<String, dynamic>;

    return User(email: snapShot['email'],profilePhoto: snapShot['profilePhoto'],uid: snapShot['uid'],name: snapShot['name']);
  }
}