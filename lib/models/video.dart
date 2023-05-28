

import 'package:cloud_firestore/cloud_firestore.dart';



class Video{
  late String username;
  late String uid;
  late String id;
  late List likes;
  late int commentCount;
  late String videoUrl;
  late String profilePhoto;

  Video({required this.username,required this.uid,required this.id,required this.likes,required this.commentCount,
    required this.videoUrl,required this.profilePhoto});


  Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "profilePhoto": profilePhoto,
    "id": id,
    "likes": likes,
    "commentCount": commentCount,
    "videoUrl": videoUrl,
  };


  static Video fromSnap(DocumentSnapshot snap){

    var snapshot = snap.data() as Map<String, dynamic>;


    return Video(
      username: snapshot['username'],
      uid: snapshot['uid'],
      id: snapshot['id'],
      likes: snapshot['likes'],
      commentCount: snapshot['commentCount'],
      videoUrl: snapshot['videoUrl'],
      profilePhoto: snapshot['profilePhoto'],
    );



  }

}