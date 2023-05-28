import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ombrev/controllers/auth_controller.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

// CONTROLLER
var authService = AuthService.instance;

