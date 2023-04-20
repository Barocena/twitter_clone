// ignore_for_file: prefer_const_constructors

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:twitter_clone/widgets/editpost.dart';

void _showInputDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return InputDialog(
        title: 'New Tweet',
        hintText: 'Enter your tweet',
        onOkPressed: (text) {
          // Do something with the text.
        },
      );
    },
  );
}

Widget buildTwitterPostCard(
  BuildContext context, {
  required String image,
  required String name,
  required String handle,
  required DateTime timestamp,
  required String text,
  required int comments,
  required int retweets,
  required int likes,
  required int i,
}) {
  final formatter = DateFormat('d, mm, y h:mm a');

  return Card(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    elevation: 5,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(image),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(
                        style:
                            TextStyle(color: Color.fromARGB(255, 97, 95, 95)),
                        children: [
                          TextSpan(
                              text: name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                LucideIcons.verified,
                                size: 14,
                                color: Colors.blueAccent,
                              )),
                          TextSpan(
                              text: handle,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12)),
                          TextSpan(
                              text: '\n${formatter.format(timestamp)}',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 11))
                        ])),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(LucideIcons.edit3),
                onPressed: () {
                  _showInputDialog(context);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.comment_outlined, color: Colors.blueGrey),
                  const SizedBox(width: 5),
                  Text(comments.toString()),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.repeat_outlined),
                  const SizedBox(width: 5),
                  Text(retweets.toString()),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.favorite_border),
                  const SizedBox(width: 5),
                  Text(likes.toString()),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
