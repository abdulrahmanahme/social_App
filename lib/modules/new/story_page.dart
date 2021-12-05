import 'package:flutter/material.dart';
import 'package:loca_social/model/story_model.dart';

class StoryPage1 extends StatelessWidget {
  String? id;
  String? image;
  StoryPage1({this.image, this.id});
  // var story = stories[index!];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: image!,
            // transitionOnUserGestures: true,
            child: Container(
              height: 500,
              width: 500,
              // color: Colors.amber,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image!)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
