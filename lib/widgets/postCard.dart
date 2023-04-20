// ignore_for_file: library_private_types_in_public_api, must_be_immutable, depend_on_referenced_packages, file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:lucide_icons/lucide_icons.dart';

class TwitterPostCard extends StatefulWidget {
  final String image;
  final String name;
  final String handle;
  final DateTime time;
  final int index;
  String text;
  int comments;
  int retweets;
  int likes;
  final Function(String)? onEditPressed;

  TwitterPostCard({
    super.key,
    required this.image,
    required this.name,
    required this.handle,
    required this.time,
    required this.text,
    required this.comments,
    required this.retweets,
    required this.likes,
    required this.index,
    this.onEditPressed,
  });

  @override
  _TwitterPostCardState createState() => _TwitterPostCardState();
}

class _TwitterPostCardState extends State<TwitterPostCard> {
  bool _liked = false;
  bool _retweeted = false;
  final formatter = DateFormat('MMM d, y h:mm a');
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.image),
            ),
            title: Text.rich(TextSpan(
                style: const TextStyle(color: Color.fromARGB(255, 97, 95, 95)),
                children: [
                  TextSpan(
                      text: widget.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        LucideIcons.verified,
                        size: 14,
                        color: Colors.blueAccent,
                      )),
                  const WidgetSpan(
                      child: SizedBox(
                    width: 5,
                  )),
                  TextSpan(
                      text: widget.handle,
                      style: const TextStyle(color: Colors.grey, fontSize: 12))
                ])),
            subtitle: Text(
              formatter.format(widget.time),
              style: const TextStyle(fontSize: 10),
            ),
            trailing: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(LucideIcons.edit3),
                          Text('Edit post')
                        ]),
                  ),
                ];
              },
              onSelected: (String value) {
                if (value == 'edit') {
                  if (widget.onEditPressed != null) {
                    TextEditingController textEditingController =
                        TextEditingController();
                    textEditingController.text = widget.text;
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Edit Tweet"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                autofocus: true,
                                controller: textEditingController,
                                decoration: const InputDecoration(
                                  hintText: "write your new tweet here",
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    widget.text = textEditingController.text;
                                  });

                                  widget.onEditPressed!(
                                      textEditingController.text);
                                  Navigator.pop(context);
                                },
                                child: const Text("Edit"),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 15),
              Text(widget.text, textAlign: TextAlign.start),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _retweeted = !_retweeted;
                          if (_retweeted) {
                            widget.retweets++;
                          } else {
                            widget.retweets--;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.repeat,
                        color: _retweeted ? Colors.green : Colors.grey,
                      ),
                    ),
                    Text(widget.retweets.toString()),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _liked = !_liked;
                          if (_liked) {
                            widget.likes++;
                          } else {
                            widget.likes--;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: _liked ? Colors.red : Colors.grey,
                      ),
                    ),
                    Text(widget.likes.toString()),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.comment),
                    ),
                    Text(widget.comments.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
