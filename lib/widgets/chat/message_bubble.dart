// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key key,
    this.message,
    this.userName,
    this.userImage,
    this.isMe,
  }) : super(key: key);

  final String message;
  final bool isMe;
  final String userName;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (isMe)
          CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(userImage),
          ),
        Container(
          decoration: BoxDecoration(
           
            color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft:
                  !isMe ? const Radius.circular(0) : const Radius.circular(12),
              bottomRight:
                  !isMe ? const Radius.circular(12) : const Radius.circular(0),
            ),
          ),
          width: 210,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                userName.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  
                  color: isMe
                      ? Colors.black
                      : Theme.of(context).accentTextTheme.titleMedium.color,
                ),
              ),
              Text(
                message,
                style: TextStyle(
                  
                  color: isMe
                      ? Colors.black
                      : Theme.of(context).accentTextTheme.titleMedium.color,
                ),
              ),
            ],
          ),
        ),
        if (!isMe)
          CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
      ],
    );
  }
}
