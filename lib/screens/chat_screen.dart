import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:new_chat_firebase/widgets/chat/messages.dart';
import 'package:new_chat_firebase/widgets/chat/new_messsage.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Start Chating'),
          actions: [
            DropdownButton(
              underline: Container(),
              items: [
                DropdownMenuItem(
                  child: Row(children: const [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Logout'),
                  ]),
                  value: 'logout',
                )
              ],
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  _auth.signOut();
                }
              },
            )
          ],
        ),

        body: Column(
          children: const [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
        //StreamBuilder(
        //   stream: FirebaseFirestore.instance
        //       .collection('chats/8B58GQazbbKaieOuqqOT/messages')
        //       .snapshots(),
        //   builder: (ctx, streamSnapshot) {
        //     if (streamSnapshot.connectionState == ConnectionState.waiting) {
        //       // return progress indicator widget
        //       return const Center(child: CircularProgressIndicator());
        //     }
        //     final documents = streamSnapshot.data?.docs;
        //     return ListView.builder(
        //       itemCount: documents?.length,
        //       itemBuilder: (ctx, index) => Container(
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text(documents[index]['text']),
        //         ),
        //       ),
        //     );
        //   },
        // ),
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.add),
        //   onPressed: () {
        //     FirebaseFirestore.instance
        //         .collection('chats/8B58GQazbbKaieOuqqOT/messages')
        //         .add({'text': 'added finally'});
        //   },
        // ),
      );
    });
  }
}
