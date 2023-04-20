// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:twitter_clone/widgets/bottom_NavBar.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Tweet'),
        actions: [
          IconButton(
            icon: Icon(LucideIcons.send),
            onPressed: () {
              tweets.add(Tweet(
                username: 'Barocena',
                handle: '@Barocena_',
                tweetText: _textController.text,
                timestamp: DateTime.now(),
              ));
              setState(() {
                selectedIndex = 0;
              });
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _textController,
          maxLength: 280,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'Neler oluyor?',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
