import 'package:flutter/material.dart';
import 'package:loca_social/components/components.dart';
import 'package:loca_social/cubit/cubit.dart';
import 'package:loca_social/cubit/states.dart';
import 'package:loca_social/modules/new/change_password.dart';
import 'package:loca_social/style/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatelessWidget {
  static const oTPScreen = 'otpscreen';
  final formkey = GlobalKey<FormState>();
  var controllerpassword = TextEditingController();
  var controlleremail = TextEditingController();
  String? phoneNumber;

  Future<void> _register(BuildContext context) async {
    if (!formkey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
      formkey.currentState!.save();
      BlocProvider.of<SocialLoginCubit>(context)
          .submitPhoneNumber(phoneNumber!);
    }
  }

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
                          'Verify your Number ',
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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: RichText(
                        text: TextSpan(
                          text: 'Enter your 6 digit code numbers sent to ',
                          style: TextStyle(
                              color: Colors.black, fontSize: 18, height: 1.4),
                          children: <TextSpan>[
                            TextSpan(
                              text: '$phoneNumber',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildPinCodeFields(context),
                  Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: _buildPhoneFormField(),
                      // ),

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
                          ' Confirm',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          navigateTo(context, ChangePassword());
                          // if (!formkey.currentState!.validate()) {
                          //   Navigator.pop(context);
                          //   return;
                          // } else {
                          //   Navigator.pop(context);
                          //   formkey.currentState!.save();
                          //   BlocProvider.of<SocialLoginCubit>(context)
                          //       .submitPhoneNumber(phoneNumber!);
                          // }
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
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Resend',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'jannah'),
                        ),
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

Widget _buildPinCodeFields(BuildContext context) {
  String? otpCode;
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        // scrollPadding: EdgeInsets.all(50),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          fieldWidth: 50,
          borderWidth: 2,
          activeColor: Color(0XFF4C68DA),
          inactiveColor: Colors.grey,
          inactiveFillColor: Colors.white,
          activeFillColor: Colors.blue.withOpacity(0.1),
          selectedColor: Color(0XFF4C68DA),
          selectedFillColor: Colors.white,
        ),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (submitedCode) {
          otpCode = submitedCode;
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
      ),
    ),
  );
}
