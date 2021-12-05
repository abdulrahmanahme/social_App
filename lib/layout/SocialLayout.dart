import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:loca_social/components/components.dart';

import 'package:loca_social/cubit/cubit.dart';
import 'package:loca_social/cubit/states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loca_social/modules/chats_module.dart';
import 'package:loca_social/modules/edit_profile.dart';
import 'package:loca_social/modules/feeds_module.dart';
import 'package:loca_social/modules/newpost_module.dart';
import 'package:loca_social/modules/settings_module.dart';
import 'package:loca_social/style/icon_broken.dart';
import 'package:loca_social/style/sharedpr.dart';

class SocialLayout extends StatefulWidget {
  @override
  _SocialLayoutState createState() => _SocialLayoutState();
}

class _SocialLayoutState extends State<SocialLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLoginCubit, SocialLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialLoginCubit.get(context);

        return SafeArea(
          child: Scaffold(
            extendBody: true,
            appBar: AppBar(
              title: Text(
                cubit.title[cubit.currentPage],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'jannah',
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      // CashHelper.clearData(key: 'uId');
                      // String uId = CashHelper.getData(key: 'uId');

                      // cubit.gettextMessage(recevierI);
                    },
                    icon: Icon(
                      IconBroken.Notification,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(IconBroken.Search, color: Colors.black)),
              ],
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: cubit.screen[cubit.currentPage],
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Container(
                height: 58,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cubit.bottomBar(
                      numberPage: 0,
                      currentscreen: FeedsScreen(),
                      icon: IconBroken.Home,
                      iconName: 'Home',
                    ),
                    cubit.bottomBargetuser(
                      numberPage: 1,
                      currentscreen: ChatsScreen(),
                      icon: IconBroken.Chat,
                      iconName: 'Chat',
                    ),
                    SizedBox(width: 50),
                    cubit.bottomBar(
                      numberPage: 2,
                      currentscreen: ChatsScreen(),
                      icon: IconBroken.Arrow___Up_Square,
                      iconName: 'Home',
                    ),
                    cubit.bottomBar(
                      numberPage: 3,
                      currentscreen: SettingsScreen(),
                      icon: IconBroken.Setting,
                      iconName: 'Setting',
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Color(0xff4C68DA),
              onPressed: () {
                cubit.flotingActionState(context);
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
        );
      },
    );
  }
}
