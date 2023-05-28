import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ombrev/controllers/auth_controller.dart';
import 'package:ombrev/views/screens/add_video_screen.dart';
import 'package:ombrev/views/screens/loginScreen.dart';
import 'package:ombrev/views/screens/videoScreen.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value){
    Get.put(AuthService());
  });

  runApp( MyApp()); 
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id : (context) => LoginScreen(),
        VideoScreen.id : (context) => VideoScreen(),
        AddVideoScreen.id : (context) => AddVideoScreen(),

      },
    );
  }
}
