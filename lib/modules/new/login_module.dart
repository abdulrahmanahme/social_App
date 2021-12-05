import 'package:flutter/material.dart';
import 'package:loca_social/components/components.dart';
import 'package:loca_social/cubit/cubit.dart';
import 'package:loca_social/cubit/states.dart';
import 'package:loca_social/layout/SocialLayout.dart';
import 'package:loca_social/modules/feeds_module.dart';
import 'package:loca_social/modules/new/signUp_module.dart';
import 'package:loca_social/modules/new/validate_phone_number.dart';
import 'package:loca_social/style/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  var controllerpassword = TextEditingController();
  var controlleremail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLoginCubit, SocialLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialLoginCubit.get(context);

        return Scaffold(
          backgroundColor: Color(0xffFFFFFF),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(IconBroken.Arrow___Left_2,
                  size: 30, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 70,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sign in Now',
                          style: TextStyle(
                              color: Color(0xff1A2552),
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'jannah'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                    ),
                    child: Text(
                      'Please enter your information below in order to  login to your account. ',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w300,
                          fontFamily: 'jannah'),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 23, top: 40),
                            child: Text(
                              'E-mail Address',
                              style: TextStyle(
                                  // color: Color(0xff1A2552),
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'jannah'),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 8,
                      // ),
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
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Password',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'jannah'),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            TextButton(
                              onPressed: () {
                                navigateTo(context, ValidateScreen());
                              },
                              child: Text(
                                'Forget Password?',
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'jannah'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: defaultFormField(
                          label: 'Password',
                          prefix: IconBroken.Lock,
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
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XFF4C68DA),
                          padding: EdgeInsets.only(
                              top: 20, bottom: 20, left: 140, right: 140),
                          // shadowColor: Color(0xffFF4500),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            cubit.userLogin(
                              email: controlleremail.text,
                              password: controllerpassword.text,
                            );
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SocialLayout()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
