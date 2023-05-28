


import 'package:cloud_firestore/cloud_firestore.dart';

class Comment{

  late String username;
  late String comment;
  late final datePublished;
  late List upvotes;
  late List downvotes;
  late String profilePhoto;
  late String uid;
  late String id;


  Comment({
    required this.username,
    required this.comment,
    required this.datePublished,
    required this.upvotes,
    required this.downvotes,
    required this.profilePhoto,
    required this.uid,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'comment': comment,
    'datePublished': datePublished,
    'upvotes': upvotes,
    'downvotes': downvotes,
    'profilePhoto': profilePhoto,
    'uid': uid,
    'id': id,
  };


  static Comment fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Comment(
      username: snapshot['username'],
      comment: snapshot['comment'],
      datePublished: snapshot['datePublished'],
      upvotes: snapshot['upvotes'],
      downvotes: snapshot['downvotes'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      id: snapshot['id'],
    );
  }

}