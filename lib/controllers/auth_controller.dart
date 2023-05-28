import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ombrev/constants.dart';
import 'package:ombrev/models/user.dart' as model;


class AuthService extends GetxController{

  static AuthService instance = Get.find();



  late Rx<User?> _user;

  User get users => _user.value!;





  late String email;
  late String name;
  late String photoUrl;
  late String uid;



  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
  }








  Future<bool> signInWithGoogle() async{

    bool result = false;



    try{
      final GoogleSignInAccount? gUser =  await GoogleSignIn().signIn();

      // obtain auth details from request
      final GoogleSignInAuthentication? gAuth = await gUser?.authentication;


      // create a new Credential for user

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth?.accessToken,
        idToken: gAuth?.idToken,
      );


      final UserCredential userCredential = await auth.signInWithCredential(credential);



      User? user = userCredential.user;




      //assert(user?.email !=null);
      //assert(user?.displayName !=null);
      //assert(user?.photoURL !=null);




      name = user!.displayName!;
      email = user!.email!;
      photoUrl = user!.photoURL!;
      uid = userCredential.user!.uid;

      //assert(user?.uid!=null);

      model.User users = model.User(
        name: name,
        email: email,
        uid: uid,
        profilePhoto: photoUrl,
      );


      if(user!=null){
        if(userCredential.additionalUserInfo!.isNewUser) {
          // add data to firestore

          await firestore
              .collection('users')
              .doc(userCredential.user!.uid)
              .set(users.toJson());

        }

        result = true;
      }
      return result;
    }

    catch(e){
      print(e);

    }


    return result;



  }
}