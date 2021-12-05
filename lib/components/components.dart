import 'package:flutter/material.dart';
// import 'package:loca_social/cubit/cubit.dart';
// import 'package:loca_social/layout/SocialLayout.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

Widget defaultButton({
  required Function? function,
  required String? text,
  required Color? colors,
}) =>
    Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        height: 40.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(
            3.0,
          ),
        ),
        child: MaterialButton(
          onPressed: () {
            function!;
          },
          child: Text(
            text!.toUpperCase(),
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void nvigateAndFinish({context, widget}) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

class DefaultFormField extends StatelessWidget {
  @required
  TextEditingController? controller;
  @required
  TextInputType? type;
  Function? onSubmit;
  Function? onChange;
  bool? isPassword = false;
  @required
  Function? validate;
  @required
  String? label;
  @required
  IconData? prefix;
  IconData? suffix;
  Function? suffixpress;
  Widget? suffixIcon;
  DefaultFormField(
      {this.controller,
      this.isPassword,
      this.label,
      this.onChange,
      this.onSubmit,
      this.prefix,
      this.suffix,
      this.suffixIcon,
      this.suffixpress,
      this.type,
      this.validate});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword!,
        onFieldSubmitted: (value) {
          onSubmit!;
        },
        onChanged: (value) {
          onChange!;
        },
        validator: (value) {
          validate!;
        },
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            prefix,
          ),

          suffixIcon: suffixIcon,
          // suffixIcon: IconButton(
          //     icon: Icon(
          //       suffix,
          //     ),
          //     onPressed: () {
          //       suffixpress!;
          //     }),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class Profile_button extends StatelessWidget {
  IconData? icon;
  String? name;
  VoidCallback? press;
  double? width;
  Profile_button({this.icon, this.name, this.press, this.width});

  // final bool pressAttention;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.grey,
          padding: EdgeInsets.only(
            top: 10,
            bottom: 8,
          ),

          // shadowColor: pressAttention ? Color(0xffFF4500) : Color(0xffE6E5E7),

          elevation: 3,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(60),
          // ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              size: 25,
              color: Colors.black38,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name!,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'jannah',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: width,
            ),
            // IconButton(
            //     iconSize: 30,
            //     color: Colors.grey,
            //     icon: Icon(Icons.arrow_forward_ios_outlined),
            //     onPressed: () {}),
          ],
        ),
        onPressed: press!,
      ),
    );
  }
}

Widget defaultFormField({
  required TextEditingController? controller,
  required TextInputType? type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,
  required Function? validate,
  required String? label,
  required IconData? prefix,
  TextStyle? style,
  IconData? suffix,
  Function? suffixpress,
  Widget? suffixIcon,
}) =>
    Padding(
      padding: const EdgeInsets.all(1.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: (value) {
          onSubmit!;
        },
        onChanged: (value) {
          onChange!;
        },
        validator: (value) {
          validate!;
        },
        style: style,
        decoration: InputDecoration(
          labelText: label,

          prefixIcon: Icon(
            prefix,
            color: Colors.black,
          ),

          suffixIcon: suffixIcon,

          // suffixIcon: IconButton(
          //     icon: Icon(
          //       suffix,
          //     ),
          //     onPressed: () {
          //       suffixpress!;
          //     }),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

// void showToast({
//   @required String? text,
//   @required ToastStates? state,
// }) =>
//     Fluttertoast.showToast(
//       msg: text!,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 5,
//       backgroundColor: chooseToastColor(state!),
//       textColor: Colors.white,
//       fontSize: 16.0,
//     );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

//
class DefualtButton extends StatelessWidget {
  final String? nameButton;

  // EdgeInsetsGeometry? padding;
  @required
  final VoidCallback? onPressed;

  DefualtButton({this.nameButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        // padding: padding,
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 90, right: 90),

        // shadowColor: Color(0xffFF4500),
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        nameButton!,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        onPressed!;
      },
    );
  }
}

Widget continueButton({String? nameButton, Function? onPressed, context}) =>
    Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        height: 60,
        width: 350,
        child: FlatButton(
          onPressed: () {
            onPressed!;
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: Color(0XFF292F38),
          child: Text(
            nameButton!,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: 'Lobster-Regular',
              letterSpacing: 3,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      //
    );

class Continue_Button extends StatelessWidget {
  String? nameButton;
  Widget? page;

  Continue_Button({this.nameButton, this.page});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        height: 60,
        width: 350,
        child: FlatButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => page!,
              ),
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: Color(0XFF292F38),
          child: Text(
            nameButton!,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: 'Lobster-Regular',
              letterSpacing: 3,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      //
    );
  }
}

String getTimeDifferenceFromNow(DateTime dateTime) {
  Duration difference = DateTime.now().difference(dateTime);
  if (difference.inSeconds < 5) {
    return "Just now";
  } else if (difference.inMinutes < 1) {
    return "${difference.inSeconds}s ago";
  } else if (difference.inHours < 1) {
    return "${difference.inMinutes}m ago";
  } else if (difference.inHours < 24) {
    return "${difference.inHours}h ago";
  } else {
    return "${difference.inDays}d ago";
  }
}
