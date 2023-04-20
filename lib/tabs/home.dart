import 'package:flutter/material.dart';
import 'package:twitter_clone/widgets/postCard.dart';
import 'package:twitter_clone/widgets/bottom_NavBar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Clone App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView.builder(
          itemCount: tweets.length,
          itemBuilder: (BuildContext context, int index) {
            return TwitterPostCard(
              image:
                  'https://pbs.twimg.com/profile_images/1302047091469045761/0afDi8Ls_normal.jpg',
              name: tweets[index].username,
              handle: tweets[index].handle,
              time: DateTime.now(),
              text: tweets[index].tweetText,
              comments: 10,
              retweets: 123,
              likes: 80,
              index: index,
              onEditPressed: (txt) {
                tweets[index].tweetText = txt;
              },
            );
          },
        ),
      ),
    );
  }
}
