import 'package:flutter/material.dart';
import 'package:loca_social/components/components.dart';
import 'package:loca_social/cubit/cubit.dart';
import 'package:loca_social/cubit/states.dart';
import 'package:loca_social/style/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controllerBio = TextEditingController();
    var controllertname = TextEditingController();
    var controllertphone = TextEditingController();

    //   @override
    // void dispose() {
    //   _disposeVideoController();
    //   maxWidthController.dispose();
    //   maxHeightController.dispose();
    //   qualityController.dispose();
    //   super.dispose();
    // }

    return BlocConsumer<SocialLoginCubit, SocialLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialLoginCubit.get(context).usermodel;
        late var profileImage = SocialLoginCubit.get(context).profileImage;
        late var caverImage = SocialLoginCubit.get(context).caverImage;

        controllerBio.text = userModel.bio!;
        controllertname.text = userModel.name!;
        controllertphone.text = userModel.phone!;

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
                  SocialLoginCubit.get(context).updateUser(
                      name: controllertname.text,
                      phone: controllertphone.text,
                      bio: controllerBio.text);
                },
                child: Text(
                  'UPDATE',
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
              'Edit Profile',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'jannah',
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              if (state is UserUpdateLoadingState) LinearProgressIndicator(),
              if (state is UserUpdateLoadingState)
                SizedBox(
                  height: 10,
                ),
              Container(
                height: 200,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            height: 160,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: caverImage == null
                                      ? NetworkImage('${userModel.caver}')
                                      : FileImage(caverImage) as ImageProvider),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              SocialLoginCubit.get(context).getCaverImage();
                            },
                            icon: CircleAvatar(
                              radius: 30,
                              child: Icon(
                                IconBroken.Camera,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          // backgroundColor: Theme.of(context).backgroundColor,
                          backgroundColor: Colors.white,
                          radius: 63,
                          child: CircleAvatar(
                              radius: 60,
                              backgroundImage: profileImage == null
                                  ? NetworkImage('${userModel.image}')
                                  : FileImage(profileImage) as ImageProvider),
                        ),
                        IconButton(
                          onPressed: () {
                            SocialLoginCubit.get(context).getProfileImage();
                          },
                          icon: CircleAvatar(
                            radius: 30,
                            child: Icon(
                              IconBroken.Camera,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // if (SocialLoginCubit.get(context).profileImage != null ||
              //     SocialLoginCubit.get(context).coverImageUrl != null)
              Row(
                children: [
                  if (SocialLoginCubit.get(context).profileImage != null)
                    Expanded(
                      child: Column(
                        children: [
                          MaterialButton(
                            color: Colors.blue,
                            onPressed: () {
                              SocialLoginCubit.get(context).uploadprofileImage(
                                  name: controllertname.text,
                                  phone: controllertphone.text,
                                  bio: controllerBio.text);
                            },
                            child: Text(
                              'Upload Cover',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // defaultButton(
                          //     function: () {
                          //       SocialLoginCubit.get(context)
                          //           .uploadprofileImage(
                          //               name: controllertname.text,
                          //               phone: controllertphone.text,
                          //               bio: controllerBio.text);
                          //       print('ssssssssssssssssssssssssssssssss');
                          //     },
                          //     text: 'Upload profile ',
                          //     colors: Colors.blue),
                          if (state is UserUpdateLoadingState)
                            SizedBox(
                              height: 5,
                            ),
                          if (state is UserUpdateLoadingState)
                            LinearProgressIndicator(),
                        ],
                      ),
                    ),
                  SizedBox(
                    width: 10,
                  ),
                  if (SocialLoginCubit.get(context).caverImage != null)
                    Expanded(
                      child: Column(
                        children: [
                          MaterialButton(
                            color: Colors.blue,
                            onPressed: () {
                              SocialLoginCubit.get(context).uploadCoverImage(
                                  name: controllertname.text,
                                  phone: controllertphone.text,
                                  bio: controllerBio.text);
                            },
                            child: Text(
                              'Upload Cover',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          // defaultButton(
                          //     function: () {
                          //       SocialLoginCubit.get(context).uploadCoverImage(
                          //           name: controllertname.text,
                          //           phone: controllertphone.text,
                          //           bio: controllerBio.text);
                          //     },
                          //     text: 'Upload Cover',
                          //     colors: Colors.blue),
                          if (state is UserUpdateLoadingState)
                            SizedBox(
                              height: 1,
                            ),
                          if (state is UserUpdateLoadingState)
                            LinearProgressIndicator(),
                        ],
                      ),
                    ),
                ],
              ),
              defaultFormField(
                label: 'name',
                prefix: IconBroken.User,
                controller: controllertname,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'Enter first User name ';
                  }

                  return null;
                },
                type: TextInputType.emailAddress,
              ),
              defaultFormField(
                label: 'Phone',
                prefix: IconBroken.Call,
                controller: controllertphone,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'Enter your Phone';
                  }

                  return null;
                },
                type: TextInputType.number,
              ),
              defaultFormField(
                label: 'Bio',
                prefix: IconBroken.Info_Circle,
                controller: controllerBio,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'Enter Bio';
                  }

                  return null;
                },
                type: TextInputType.emailAddress,
              ),
            ]),
          ),
        );
      },
    );
  }
}

// class DraggleSheet extends StatelessWidget {
  
//   bool pressAttention = false;

//   @override
//   Widget build(BuildContext context) {
//     return  showMaterialModalBottomSheet(
//     backgroundColor: Colors.transparent,
//     context: context,
//     builder: (context) => SingleChildScrollView(
//       child: Container(
//         height: 550,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(15),
//               child: Row(
//                 children: [
//                   //
//                   Text(
//                     'Filter',
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 210,
//                   ),
//                   IconButton(
//                       iconSize: 30,
//                       color: Colors.grey,
//                       icon: Icon(Icons.close),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       }),
//                 ],
//               ),
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Text(
//                   'Category',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
              
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
               
//             SizedBox(
//               height: 30,
//             ),
           
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Color(0xffFF4500),
//                 padding:
//                     EdgeInsets.only(top: 20, bottom: 20, left: 110, right: 110),
//                 shadowColor:
//                     pressAttention ? Color(0xffFF4500) : Color(0xffE6E5E7),
//                 elevation: 6,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(60),
//                 ),
//               ),
//               child: Text(
//                 'Apply Filters',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               onPressed: () {},
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: Text(
//                   'Clear Filter',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//           ]
//       ),
//     ),
//     ),
//   );
    
//   }
// }

