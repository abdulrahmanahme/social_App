import 'package:flutter/material.dart';
import 'package:loca_social/components/components.dart';

import 'package:loca_social/cubit/cubit.dart';
import 'package:loca_social/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loca_social/model/message_model.dart';
import 'package:loca_social/model/social_user_model.dart';
import 'package:loca_social/modules/chat_screen.dart';

class ChatsScreen extends StatelessWidget {
  MessageModel? messageModel;
  SocialUserModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLoginCubit, SocialLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialLoginCubit.get(context);
        return
            //  SocialLoginCubit.get(context).allUser.length > 0
            //     ? ListView.separated(
            //         physics: BouncingScrollPhysics(),
            //         itemBuilder: (context, index) => chatWidget(
            // SocialLoginCubit.get(context).allUser[index], context),
            //         separatorBuilder: (context, index) => Divider(),
            //         itemCount: SocialLoginCubit.get(context).allUser.length)
            //     : Center(
            //         child: CircularProgressIndicator(),
            //       );

            Column(
          children: [
            Container(
              // width: double.infinity,
              height: 115,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    chatbutton(cubit.allUser[index], context),
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.0,
                ),
                itemCount: cubit.allUser.length,
              ),
            ),
            // SizedBox(
            //   height: 15,
            // ),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => IconChat(
                  model: SocialLoginCubit.get(context).allUser[index],
                  // messageModel: SocialLoginCubit.get(context).messageModel!,
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.0,
                ),
                itemCount: SocialLoginCubit.get(context).allUser.length,
              ),
            ),
          ],
        );
      },
    );
  }
}

class IconChat extends StatelessWidget {
  SocialUserModel? model;
  IconChat({this.model, this.messageModel});
  MessageModel? messageModel;
  @override
  Widget build(BuildContext context) {
    var cubit = SocialLoginCubit.get(context);
    int? index;

    return InkWell(
      onTap: () {
        navigateTo(
            context,
            ChatDetailsScreen(
              model: model,
            ));
      },
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 35.0,
                backgroundImage: NetworkImage(
                  '${model!.image}',
                ),
              ),
              Positioned(
                left: 53,
                // bottom: 30,
                // right: 60,
                top: 50,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 6.0,
                  ),
                ),
              ),
            ],
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
                      'sa',
                      style: TextStyle(
                        // height: 1.4,
                        fontSize: 18,

                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Spacer(),
                    Text(
                      'a',
                      style: TextStyle(
                        // height: 1.4,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 13.0,
                ),
                Text(
                  'ssss',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget chatbutton(SocialUserModel? model, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 35.0,
              backgroundImage: NetworkImage(
                '${model!.image}',
              ),
            ),
            Positioned(
              left: 53,
              // bottom: 30,
              // right: 60,
              top: 50,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 6.0,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          child: Text(
            '${model.name}',
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

// Widget chatWidget(SocialUserModel model, context) {
//   return InkWell(
//     onTap: () {
//       navigateTo(
//           context,
//           ChatDetailsScreen(
//             model: model,
//           ));
//     },
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Stack(
//             children: [
//               Positioned(
//                 left: 50,
//                 // bottom: 30,
//                 // right: 60,
//                 top: 53,
//                 child: CircleAvatar(
//                   radius: 13,
//                   backgroundColor: Colors.white,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.green,
//                     radius: 10.0,
//                     child: Icon(
//                       Icons.add,
//                       size: 15,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               CircleAvatar(
//                 radius: 28,
//                 backgroundImage: NetworkImage(
//                   '${model.image}',
//                 ),
//                 // fit: BoxFit.cover,
//               ),
//             ],
//           ),
//           SizedBox(
//             width: 10.0,
//           ),
//           Expanded(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                   top: 20,
//                 ),
//                 child: Row(
//                   children: [
//                     Text(
//                       '${model.name}',
//                       style: TextStyle(
//                           fontSize: 15,
//                           height: 1.4,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     // Icon(
//                     //   Icons.check_circle,
//                     //   color: Colors.blue,
//                     //   size: 16.0,
//                     // ),
//                   ],
//                 ),
//               ),
//               // Row(
//               //   children: [
//               //     // Text(
//               //     //   '${model.dateTime}',
//               //     //   style: Theme.of(context).textTheme.caption!.copyWith(
//               //     //         height: 1.2,
//               //     //       ),
//               //     // ),
//               //     SizedBox(
//               //       width: 40.0,
//               //     ),
//               //     IconButton(
//               //       onPressed: () {},
//               //       icon: Icon(
//               //         Icons.more_horiz,
//               //         size: 20,
//               //       ),
//               //     ),
//               //   ],
//               // ),
//             ],
//           )),
//         ],
//       ),
//     ),
//   );
// }
