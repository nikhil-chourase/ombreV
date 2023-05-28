import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ombrev/constants.dart';
import 'package:timeago/timeago.dart' as tago;
import 'package:ombrev/controllers/comment_controller.dart';

class CommentScreen extends StatefulWidget {
  final String ids;



  static String id = 'CommentScreen';


  CommentScreen({required this.ids});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}
class _CommentScreenState extends State<CommentScreen> {


  final TextEditingController _commentController = TextEditingController();


  CommentController commentController = Get.put(CommentController());



  void _clearTextField() {
    setState(() {
      _commentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    commentController.updatePostId(CommentScreen.id);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Obx(
                        () {


                      return ListView.builder(
                          itemCount: commentController.comments.length,
                          itemBuilder: (context,index){
                            final comment = commentController.comments[index];


                            return Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ListTile(

                                leading: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  backgroundImage: NetworkImage(comment.profilePhoto),
                                ),
                                title: Row(


                                  children: [
                                    const SizedBox(width: 10,),
                                    Text(comment.comment,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),

                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(tago.format(comment.datePublished.toDate()), style: TextStyle(fontSize: 12,color: Colors.white,),),
                                    const SizedBox(width: 10,),
                                    Text('${comment.upvotes.length} up', style: TextStyle(fontSize: 14,color: Colors.white,),),
                                    const SizedBox(width: 10,),
                                    Text('${comment.downvotes.length} down', style: TextStyle(fontSize: 14,color: Colors.white,),),

                                  ],
                                ),
                                trailing:Container(
                                  width: 40,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          commentController.upVote(comment.id);
                                        },

                                        child: comment.upvotes.contains(authService.users.uid)? Icon(
                                          MdiIcons.arrowUpBold,
                                          size: 18,color: Colors.red,
                                        ): Icon(MdiIcons.arrowUpBoldOutline,size: 18,color: Colors.red,),
                                      ),
                                      const SizedBox(width: 1,),
                                      InkWell(
                                        onTap: (){
                                          commentController.downVote(comment.id);

                                        },
                                        child: comment.downvotes.contains(authService.users.uid)? Icon(
                                          MdiIcons.arrowDownBold,
                                          size: 18,color: Colors.white,
                                        ): Icon(MdiIcons.arrowDownBoldOutline,size: 18,color: Colors.white,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );

                          }
                      );
                    }
                ),
              ),
              const Divider(),
              ListTile(
                title: TextFormField(
                  controller: _commentController,
                  style: const TextStyle(fontSize:16,color: Colors.white),
                  decoration: const InputDecoration(
                      labelText: 'comment',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          )
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          )
                      )
                  ),
                ),
                trailing: TextButton(
                  onPressed: (){
                    commentController.postComment(_commentController.text);

                    _clearTextField();

                  },
                  child: const Text('send',style: TextStyle(color: Colors.white,fontSize: 16),),

                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
