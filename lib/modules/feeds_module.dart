import 'package:flutter/material.dart';
import 'package:loca_social/cubit/cubit.dart';
import 'package:loca_social/cubit/states.dart';
import 'package:loca_social/model/post_model.dart';
import 'package:loca_social/model/story_model.dart';
import 'package:loca_social/modules/users_modules.dart';
import 'package:loca_social/style/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';
import 'package:story/story.dart';

class FeedsScreen extends StatelessWidget {
  var commentcontroller = TextEditingController();

  int? index;
  String? id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLoginCubit, SocialLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SocialLoginCubit.get(context).post.length > 0 &&
                SocialLoginCubit.get(context).usermodel != null
            ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 115,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    SocialLoginCubit.get(context)
                                        .createStoryImage();
                                  },
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 41,
                                        backgroundColor: Colors.grey[200],
                                        child: CircleAvatar(
                                          radius: 39,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            radius: 35.0,
                                            backgroundColor: Color(0xffEFEFEF),
                                            backgroundImage: NetworkImage(
                                              'https://image.freepik.com/free-photo/close-up-confident-male-employee-white-collar-shirt-smiling-camera-standing-self-assured-against-studio-background_1258-26761.jpg',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 50,
                                        // bottom: 30,
                                        // right: 60,
                                        top: 53,
                                        child: CircleAvatar(
                                          radius: 13,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.green,
                                            radius: 10.0,
                                            child: Icon(
                                              Icons.add,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'My Story',
                                  style: TextStyle(
                                    height: 1.1,
                                    fontFamily: 'jannah',
                                  ),
                                ),
                              ],
                            ),
                            ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),

                              itemBuilder: (context, index) =>
                                  storybutton(sampleUsers[index], context),

                              separatorBuilder: (context, index) => SizedBox(
                                height: 8.0,
                              ),
                              itemCount: sampleUsers.length,
                            ),
                          ],
                        ),
                      ),
                    ),

                    /////////////////////// here
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildPostItem(
                          SocialLoginCubit.get(context).post[index],
                          context,
                          index),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 8.0,
                      ),
                      itemCount: SocialLoginCubit.get(context).post.length,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildPostItem(PostModel model, context, index) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        margin: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                      '${model.image}',
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${model.name}',
                              style: TextStyle(
                                height: 1.4,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 16.0,
                            ),
                          ],
                        ),
                        Text(
                          '${model.dateTime}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      size: 16.0,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                '${model.text}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              if (model.postImage != '')
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 15.0),
                  child: Expanded(
                    child: Container(
                      height: 360.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          4.0,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            '${model.postImage}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                IconBroken.Heart,
                                size: 16.0,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '${SocialLoginCubit.get(context).likes[index]}',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                IconBroken.Chat,
                                size: 16.0,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '0 comment',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18.0,
                            backgroundImage: NetworkImage(
                              '${SocialLoginCubit.get(context).usermodel.image}',
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),

                          Expanded(
                            child: TextFormField(
                              controller: commentcontroller,
                              decoration: InputDecoration(
                                hintText: 'write a comment ...',
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                Container(
                                  height: 51,
                                  color: Colors.blue,
                                  child: MaterialButton(
                                    minWidth: 1.8,
                                    onPressed: () {
                                      // SocialLoginCubit.get(context).SendMessage(
                                      //     recevierId: model!.uid!,
                                      //     dateTime: time.toString(),
                                      //     text: chatControler.text);
                                    },
                                    child: Icon(
                                      IconBroken.Send,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              },
                              onTap: () {
                                SocialLoginCubit.get(context).postComment(
                                    comment: commentcontroller.text);
                              },
                            ),
                          ),

                          // Text(
                          //   'write a comment ...',
                          //   style: Theme.of(context).textTheme.caption,
                          // ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Heart,
                          size: 16.0,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Like',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    onTap: () {
                      SocialLoginCubit.get(context).postLike(
                          SocialLoginCubit.get(context).postId[index]);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
