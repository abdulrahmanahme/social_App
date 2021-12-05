import 'package:flutter/material.dart';
import 'package:loca_social/components/components.dart';
import 'package:loca_social/cubit/cubit.dart';
import 'package:loca_social/cubit/states.dart';
import 'package:loca_social/layout/SocialLayout.dart';
import 'package:loca_social/modules/login_screen_modules.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _passwordVisible = false;
  var controllerEmail = TextEditingController();
  var controllerfirstname = TextEditingController();
  var controllerlastname = TextEditingController();
  var controllerpassword = TextEditingController();
  var controllerphone = TextEditingController();
  var controllerss = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLoginCubit, SocialLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialLoginCubit.get(context);

        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'New account',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontFamily: 'Lobster-Regular',
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Join to us now and make new friends',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Lobster-Regular',
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    defaultFormField(
                      label: 'User name',
                      prefix: Icons.person,
                      controller: controllerfirstname,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Enter first User name ';
                        }

                        return null;
                      },
                      type: TextInputType.emailAddress,
                    ),
                    defaultFormField(
                      label: 'E-mail',
                      prefix: Icons.email,
                      controller: controllerEmail,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Enter E-mail';
                        }

                        return null;
                      },
                      type: TextInputType.emailAddress,
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
                    defaultFormField(
                      label: 'Phone',
                      prefix: Icons.phone,
                      controller: controllerphone,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'email must not be empty';
                        }

                        return null;
                      },
                      type: TextInputType.number,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: state is! SocialRegisterLoadState
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                // padding: padding,
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 20, left: 90, right: 90),

                                // shadowColor: Color(0xffFF4500),
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.userRegister(
                                      username: controllerfirstname.text,
                                      email: controllerEmail.text,
                                      password: controllerpassword.text,
                                      phone: controllerphone.text);
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SocialLayout()));
                              },
                            )
                          : CircularProgressIndicator(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already have an account?"),
                          SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Login(),
                                ),
                              );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
