import 'package:flutter/material.dart';
import 'package:loca_social/components/components.dart';
import 'package:loca_social/cubit/cubit.dart';
import 'package:loca_social/cubit/states.dart';
import 'package:loca_social/modules/new/otp_screen.dart';

import 'package:loca_social/style/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidateScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  var controllerpassword = TextEditingController();
  var controlleremail = TextEditingController();
  String? phoneNumber;

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
                      left: 30,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Enter Phone Number',
                          style: TextStyle(
                              color: Color(0xff1A2552),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'jannah'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'Please enter your Phone Number to verify your account. ',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w300,
                          fontFamily: 'jannah'),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildPhoneFormField(),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XFF4C68DA),
                          padding: EdgeInsets.only(
                              top: 20, bottom: 20, left: 90, right: 90),
                          // shadowColor: Color(0xffFF4500),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          ' Next',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          navigateTo(context, OTPScreen());
                          // if (!formkey.currentState!.validate()) {
                          //   return;
                          // } else {
                          //   Navigator.pop(context);
                          //   formkey.currentState!.save();
                          //   BlocProvider.of<SocialLoginCubit>(context)
                          //       .submitPhoneNumber(phoneNumber!);
                          // }
                          // showProgressIndicator(context);

                          // _register(context);

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SignUpScreen()));
                          // if (formkey.currentState!.validate()) {
                          //   cubit.userLogin(
                          //     email: controlleremail.text,
                          //     password: controllerpassword.text,
                          //   );
                          // }
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

String? phoneNumber;

Widget _buildPhoneFormField() {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: Text(
            generateCountryFlag() + ' +20',
            style: TextStyle(fontSize: 18, letterSpacing: 2.0),
          ),
        ),
      ),
      SizedBox(
        width: 16,
      ),
      Expanded(
        flex: 2,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: TextFormField(
            autofocus: true,
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 2.0,
            ),
            decoration: InputDecoration(border: InputBorder.none),
            cursorColor: Colors.black,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter yout phone number!';
              } else if (value.length < 11) {
                return 'Too short for a phone number!';
              }
              return null;
            },
            onSaved: (value) {
              phoneNumber = value!;
            },
          ),
        ),
      ),
    ],
  );
}

String generateCountryFlag() {
  String countryCode = 'eg';

  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

  return flag;
}

//  Future<void> _register(BuildContext context) async {
//   String? phoneNumber;

//     if (formkey.currentState!.validate()) {
//       Navigator.pop(context);
//       return;
//     } else {
//       Navigator.pop(context);
//        formkey.currentState!.save();
//       BlocProvider.of<SocialLoginCubit>(context).submitPhoneNumber(phoneNumber!);
//     }
//   }

void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    ),
  );

  showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alertDialog;
    },
  );
}
