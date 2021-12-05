import 'package:flutter/material.dart';
import 'package:loca_social/components/components.dart';
import 'package:loca_social/cubit/cubit.dart';
import 'package:loca_social/cubit/states.dart';
import 'package:loca_social/style/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddNewPost extends StatelessWidget {
  var textcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  IconBroken.Arrow___Left_2,
                  color: Colors.black,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    DateTime now = DateTime.now();
                    var dateFromTimeStamp =
                        DateFormat('dd-MM-yyyy hh:mm a').format(now);

                    if (SocialLoginCubit.get(context).postPhone == null) {
                      SocialLoginCubit.get(context).createPost(
                          dateTime: dateFromTimeStamp.toString(),
                          text: textcontroler.text);
                    } else {
                      SocialLoginCubit.get(context).uploadPostImage(
                          dateTime: dateFromTimeStamp.toString(),
                          text: textcontroler.text);
                    }
                  },
                  child: Text(
                    'Post',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'jannah',
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
              titleSpacing: 8.0,
              title: Text(
                'Create Post',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'jannah',
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                if (state is CreatePostLoadingState) LinearProgressIndicator(),
                if (state is CreatePostLoadingState)
                  SizedBox(
                    height: 10,
                  ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://image.freepik.com/free-photo/portrait-beautiful-young-woman-standing-grey-wall_231208-10760.jpg',
                      ),
                      // fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Abdelrahman Ahmed',
                            style: TextStyle(
                                fontSize: 15,
                                height: 1.4,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textcontroler,
                    decoration: InputDecoration(
                      hintText: 'What is in your mind...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if (SocialLoginCubit.get(context).postPhone != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                  SocialLoginCubit.get(context).postPhone!)),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          SocialLoginCubit.get(context).removePostImage();
                        },
                        icon: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        SocialLoginCubit.get(context).getPostImage();
                      },
                      child: Row(
                        children: [
                          Icon(
                            IconBroken.Image,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Add Photo',
                            // style: TextStyle(
                            //     fontFamily: 'jannah',
                            //     fontSize: 15,
                            //     height: 1.4,
                            //     fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: TextButton(
                  //     onPressed: () {},
                  //     child: Text(
                  //       '#tags',
                  //       // style: TextStyle(
                  //       //     fontFamily: 'jannah',
                  //       //     fontSize: 15,
                  //       //     height: 1.4,
                  //       //     fontWeight: FontWeight.w500),
                  //     ),
                  //   ),
                  // ),
                ]),
              ]),
            ),
          );
        });
  }
}

String formattedDate(timeStamp) {
  var dateFromTimeStamp =
      DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
  return DateFormat('dd-MM-yyyy hh:mm a').format(dateFromTimeStamp);
}
