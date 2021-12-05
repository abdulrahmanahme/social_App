import 'package:flutter/material.dart';
import 'package:loca_social/components/components.dart';
import 'package:loca_social/cubit/cubit.dart';
import 'package:loca_social/layout/SocialLayout.dart';

import 'package:loca_social/modules/login_screen_modules.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:loca_social/style/bloc_observer.dart';
import 'package:loca_social/style/end_point.dart';
import 'package:loca_social/style/sharedpr.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('BackGround ');

  await Firebase.initializeApp();
  // showToast(text: 'on BackGruond', state: ToastStates.SUCCESS);
}

Future<void> main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CashHelper.init();
  var token = await FirebaseMessaging.instance.getToken();

  print('Token is Here ${token}');

  FirebaseMessaging.onMessage.listen((event) {
    print('On App  Here ${event.data.toString()}');
    // showToast(text: 'on Message', state: ToastStates.SUCCESS);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('On App in background Here ${event.data.toString()}');
    // showToast(text: 'On App in background ', state: ToastStates.SUCCESS);
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  Widget? widget;
  uId = CashHelper.getData(key: 'uId');
  if (uId != null) {
    widget = SocialLayout();
  } else {
    widget = Login();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Widget? startWidget;
  MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SocialLoginCubit()
            ..getUserData()
            ..getPosts()
            ..getAllUsers(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Social',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backwardsCompatibility: false,
            // systemOverlayStyle: SystemUiOverlayStyle(
            //   statusBarColor: Colors.white,
            //   statusBarIconBrightness: Brightness.dark,
            // ),
            backgroundColor: Colors.white,

            elevation: 0.0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        home: startWidget,
        // SignUpScreen
        // home: WelcomeScreen(),
      ),
    );
  }
}
