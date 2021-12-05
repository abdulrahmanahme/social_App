import 'package:flutter/material.dart';
import 'package:loca_social/model/message_model.dart';
import 'package:loca_social/model/social_user_model.dart';
import 'package:loca_social/cubit/cubit.dart';
import 'package:loca_social/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loca_social/style/icon_broken.dart';

class ChatDetailsScreen extends StatelessWidget {
  SocialUserModel? model;
  var time = DateTime.now();

  var chatControler = TextEditingController();
  ChatDetailsScreen({this.model});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      SocialLoginCubit.get(context).getMessage(recevierId: model!.uid!);
      return BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 0.0,
              // backgroundColor: Colors.white,
              elevation: 0.0,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage('${model!.image}'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${model!.name}',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            body: SocialLoginCubit.get(context).message.length > 0
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              var message =
                                  SocialLoginCubit.get(context).message[index];
                              if (SocialLoginCubit.get(context).usermodel.uid ==
                                  message.senderId)
                                return buildmymessage(
                                  model: message,
                                );

                              return buildmessage(
                                model: message,
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              height: 15,
                            ),
                            itemCount:
                                SocialLoginCubit.get(context).message.length,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(15.0)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: TextFormField(
                                    controller: chatControler,
                                    decoration: InputDecoration(
                                      hintText: 'type a masseage',
                                      border: InputBorder.none,
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                              Container(
                                height: 51,
                                color: Colors.blue,
                                child: MaterialButton(
                                  minWidth: 1.8,
                                  onPressed: () {
                                    SocialLoginCubit.get(context).SendMessage(
                                        recevierId: model!.uid!,
                                        dateTime: time.toString(),
                                        text: chatControler.text);
                                  },
                                  child: Icon(
                                    IconBroken.Send,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      );
    });
  }
}

class buildmessage extends StatelessWidget {
  MessageModel? model;

  buildmessage({this.model});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.2),
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(10.0),
            topStart: Radius.circular(10.0),
            topEnd: Radius.circular(10.0),
          ),
        ),
        child: Text(
          '${model!.text}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

class buildmymessage extends StatelessWidget {
  MessageModel? model;

  buildmymessage({this.model});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(10.0),
            topStart: Radius.circular(10.0),
            topEnd: Radius.circular(10.0),
          ),
        ),
        child: Text(
          '${model!.text}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
