import 'package:flutter/material.dart';
import 'package:loca_social/components/components.dart';
import 'package:loca_social/cubit/cubit.dart';
import 'package:loca_social/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatelessWidget {
  static const resetPassword = 'resetPassword';
  var controllerdata = TextEditingController();
  var controllerpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = SocialLoginCubit.get(context);

    return BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      iconSize: 30,
                      color: Colors.grey,
                      icon: Icon(Icons.arrow_back_ios_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    width: 50,
                  ),
                  //
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '   Create a new Password',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'your new password must be different from  previous used password.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              defaultFormField(
                label: 'Password',
                prefix: Icons.lock,
                suffixIcon: IconButton(
                    onPressed: () {
                      cubit.changePasswordVisibility();
                    },
                    icon: Icon(
                      cubit.suffix,
                    )),
                isPassword: cubit.isPassword,
                controller: controllerpassword,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                type: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 15,
              ),
              DefualtButton(
                nameButton: 'Reset Password',
                onPressed: () {},
              ),
            ])),
          );
        });
  }
}
