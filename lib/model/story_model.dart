import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loca_social/components/components.dart';
import 'package:loca_social/modules/new/story_page.dart';
import 'package:loca_social/modules/users_modules.dart';

class UserModel {
  UserModel({this.stories, this.id, this.userName, this.imageUrl});

  final List<StoryModel>? stories;
  final String? id;

  final String? userName;
  final String? imageUrl;
}

class StoryModel {
  StoryModel(this.imageUrl);

  final String imageUrl;
}

List<UserModel> sampleUsers = [
  UserModel(
    stories: [
      StoryModel(
          'https://firebasestorage.googleapis.com/v0/b/loca-social.appspot.com/o/users%2Fimage_picker5796295659865218934.jpg?alt=media&token=dcb3846b-519d-4e09-b6f6-048853e48bb9'),
      StoryModel(
          'https://firebasestorage.googleapis.com/v0/b/loca-social.appspot.com/o/users%2Fimage_picker5796295659865218934.jpg?alt=media&token=dcb3846b-519d-4e09-b6f6-048853e48bb9'),
      StoryModel(
          "https://images.unsplash.com/photo-1609444074870-2860a9a613e3?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609504373567-acda19c93dc4?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1MHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ],
    userName: "Abdo",
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/loca-social.appspot.com/o/users%2Fimage_picker5796295659865218934.jpg?alt=media&token=dcb3846b-519d-4e09-b6f6-048853e48bb9',
    id: 's1',
  ),
  UserModel(
    stories: [
      StoryModel(
          "https://images.unsplash.com/photo-1609439547168-c973842210e1?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ],
    userName: "Aya",
    imageUrl:
        'https://as2.ftcdn.net/v2/jpg/01/87/14/51/500_F_187145146_SB34n4kdiNqlVSvaTy4YUJcUWjNO540N.jpg',
    id: 's2',
  ),
  UserModel(
    stories: [
      StoryModel(
          "https://images.unsplash.com/photo-1609421139394-8def18a165df?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDl8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          'https://firebasestorage.googleapis.com/v0/b/loca-social.appspot.com/o/users%2Fimage_picker5796295659865218934.jpg?alt=media&token=dcb3846b-519d-4e09-b6f6-048853e48bb9'),
      StoryModel(
          "https://images.unsplash.com/photo-1560925978-3169a42619b2?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMjF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ],
    userName: "Ali",
    imageUrl:
        "https://images.unsplash.com/photo-1609127102567-8a9a21dc27d8?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzOTh8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    id: 's3',
  ),
  UserModel(
    stories: [
      StoryModel(
          "https://images.unsplash.com/photo-1609421139394-8def18a165df?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDl8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609377375732-7abb74e435d9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxODJ8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1560925978-3169a42619b2?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMjF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ],
    userName: "Noarh",
    imageUrl:
        'https://img.freepik.com/free-photo/attractive-lady-red-sweater-walks-along-avenue-with-sakura-drinks-coffee-beautiful-woman-beret-smiling-enjoying-tea-outside_197531-17871.jpg?size=338&ext=jpg',
    id: 's4',
  ),
  UserModel(
    stories: [
      StoryModel(
          "https://images.unsplash.com/photo-1609421139394-8def18a165df?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDl8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609377375732-7abb74e435d9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxODJ8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1560925978-3169a42619b2?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMjF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ],
    userName: "Mohmmed",
    imageUrl:
        'https://img.freepik.com/free-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg?size=338&ext=jpg',
    id: 's4',
  ),
  UserModel(
    stories: [
      StoryModel(
          "https://images.unsplash.com/photo-1609421139394-8def18a165df?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDl8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609377375732-7abb74e435d9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxODJ8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1560925978-3169a42619b2?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMjF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ],
    userName: "Ahmed",
    imageUrl:
        'https://image.freepik.com/free-photo/close-up-confident-male-employee-white-collar-shirt-smiling-camera-standing-self-assured-against-studio-background_1258-26761.jpg',
    id: 's4',
  ),
];

Widget storybutton(UserModel? userModel, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        InkWell(
          onTap: () {
            navigateTo(
              context,
              StoryPage(
                id: userModel!.id,
                userName: userModel.userName,
                imageUrl: userModel.imageUrl,
              ),
            );
          },
          child: CircleAvatar(
            radius: 41,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: 39,
              backgroundColor: Colors.white,
              child: Hero(
                tag: userModel!.imageUrl!,
                child: CircleAvatar(
                  radius: 35.0,
                  backgroundColor: Color(0xffEFEFEF),
                  backgroundImage: NetworkImage(
                    '${userModel.imageUrl}',
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          child: Text(
            '${userModel.userName}',
            style: TextStyle(
              height: 1.1,
              fontFamily: 'jannah',
            ),
          ),
        ),
      ],
    ),
  );
}
