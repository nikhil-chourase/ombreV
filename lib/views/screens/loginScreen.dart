

import 'package:flutter/material.dart';
import 'package:ombrev/constants.dart';
import 'package:ombrev/views/screens/videoScreen.dart';
import 'package:ombrev/views/widgets/myButton.dart';
import 'package:ombrev/views/widgets/myTextfield.dart';
import 'package:ombrev/views/widgets/squareTile.dart';

class LoginScreen extends StatelessWidget {

  static String id = 'loginScreen';



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff9fb6bb),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(

              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5),

                // logo
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      decoration: const BoxDecoration(
                      ),
                      height: 50.0,
                      child: Image.asset('images/ombre.png'),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                const MyTextField(
                  // controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                const MyTextField(
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // sign in button
                MyButton(
                  onTap: (){},
                ),

                const SizedBox(height: 35),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.white60),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 38),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    // google button
                    MaterialButton(
                        onPressed: () async{
                          bool result = await authService.signInWithGoogle();

                          if(result){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> VideoScreen()));

                          }

                        },
                        child: SquareTile(imagePath: 'images/google.png')),

                    SizedBox(width: 15),

                    // apple button

                    MaterialButton(
                      onPressed: () {

                      },
                      child: SquareTile(imagePath: 'images/apple.png'),

                    ),


                  ],
                ),

                const SizedBox(height: 15),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
