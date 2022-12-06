import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_chat_firebase/widgets/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          // return progress indicator widget
          return const Center(child: CircularProgressIndicator());
        }
        final documents = chatSnapshot.data?.docs;
        // return FutureBuilder(
        //   future:FirebaseAuth.instance.currentUser,
        //   builder:(ctx,futureSnapshot) =>ListView.builder(
        //     reverse: true,
        //     itemCount: documents?.length,
        //     itemBuilder: (ctx, index) => MessageBubble(
        //       message: documents[index]['text'],
        //       isMe: documents[index]['userId'],
        //     ),
        //   ),
        // );

        return (ListView.builder(
          reverse: true,
          itemCount: documents?.length,
          itemBuilder: (ctx, index) {
            var userId = FirebaseAuth.instance.currentUser.uid;

            return MessageBubble(
              message: documents[index]['text'],
              userName: documents[index]['username'],
              userImage: documents[index]['userImage'],
              isMe: documents[index]['userId'] == userId,
            );
          },
        ));
      },

      
    );
  }
}
