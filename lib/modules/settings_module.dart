import 'package:flutter/material.dart';
import 'package:loca_social/components/components.dart';
import 'package:loca_social/cubit/cubit.dart';
import 'package:loca_social/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loca_social/modules/edit_profile.dart';
import 'package:loca_social/style/icon_broken.dart';

import 'package:bottom_sheet/bottom_sheet.dart';

class SettingsScreen extends StatelessWidget {
  bool pressAttention = false;
  var controlleremail = TextEditingController();
  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return SafeArea(
      child: Material(
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(60),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    //
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 210,
                    ),
                    IconButton(
                        iconSize: 30,
                        color: Colors.grey,
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: defaultFormField(
                  label: 'E-mail',
                  prefix: IconBroken.Message,
                  controller: controlleremail,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  type: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffFF4500),
                  padding: EdgeInsets.only(
                      top: 20, bottom: 20, left: 100, right: 100),
                  shadowColor:
                      pressAttention ? Color(0xffFF4500) : Color(0xffE6E5E7),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                child: Text(
                  'Apply Filters',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  // var userModel = SocialLoginCubit.get(context).usermodel;

                  // // controlleremail.text = userModel.name!;

                  // SocialLoginCubit.get(context)
                  //     .upNameUser(name: controlleremail.text);
                },
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Clear Filter',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLoginCubit, SocialLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        late var userModel = SocialLoginCubit.get(context).usermodel;
        return SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 200,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage('${userModel.caver}'),
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                  CircleAvatar(
                    // backgroundColor: Theme.of(context).backgroundColor,
                    backgroundColor: Colors.white,
                    radius: 63,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        '${userModel.image}',
                      ),
                      // fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              '${userModel.name}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${userModel.bio}',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(
              height: 5,
            ),
            Profile_button(
              name: 'Change Name',
              icon: IconBroken.Add_User,
              press: () {
                navigateTo(context, EditProfile());
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => Cartpage(),
                //   ),
                // );
              },
            ),

            Profile_button(
              name: ' Change Phone Number',
              icon: Icons.phone,
              press: () {
                showFlexibleBottomSheet(
                  minHeight: 0,
                  initHeight: 0.5,
                  maxHeight: 1,
                  context: context,
                  builder: _buildBottomSheet,
                  // anchors: [0, 0.5, 1],
                );

                // navigateTo(context, DraggleSheet());

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => EditProfile(),
                //   ),
                // );
              },
            ),
            Profile_button(
              name: 'Change Bio',
              icon: IconBroken.Add_User,
              press: () {},
            ),
            Profile_button(
              name: 'Logout',
              icon: Icons.logout,
              press: () {},
            ),
            SizedBox(
              height: 5,
            ),
            // defaultButton(
            //     function: () {}, text: 'Edit Profile', colors: Colors.blue)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {}, child: Text('Add Photos'))),
                  SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        navigateTo(context, EditProfile());
                      },
                      child: Icon(
                        IconBroken.Edit,
                        size: 16.0,
                      )),
                ],
              ),
            ),
          ]),
        );
      },
    );
  }
}
