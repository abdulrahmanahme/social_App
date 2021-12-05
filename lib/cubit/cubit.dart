import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loca_social/components/components.dart';
import 'package:loca_social/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loca_social/model/message_model.dart';
import 'package:loca_social/model/post_model.dart';
import 'package:loca_social/model/social_user_model.dart';
import 'package:loca_social/modules/chats_module.dart';
import 'package:loca_social/modules/feeds_module.dart';
import 'package:loca_social/modules/newpost_module.dart';
import 'package:loca_social/modules/settings_module.dart';
import 'package:loca_social/modules/users_modules.dart';
import 'package:loca_social/style/end_point.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(LoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);
  // bool _passwordVisible = false;
  bool isPassword = true;

  List<Widget> screen = [
    FeedsScreen(),
    ChatsScreen(),
    SettingsScreen(),
    SettingsScreen(),
  ];
  int currentPage = 0;
  MessageModel? messageModel;

  Widget bottomBar(
      {int? numberPage,
      Widget? currentscreen,
      IconData? icon,
      String? iconName}) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        currentPage = numberPage!;
        currentscreen = currentscreen;
        emit(BottomState());
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: currentPage == numberPage ? Color(0xff4C68DA) : Colors.grey,
          ),
          Text(
            iconName!,
            style: TextStyle(
              color:
                  currentPage == numberPage ? Color(0xff4C68DA) : Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget bottomBargetuser(
      {int? numberPage,
      Widget? currentscreen,
      IconData? icon,
      String? iconName}) {
    return MaterialButton(
      minWidth: 20,
      onPressed: () {
        getAllUsers();
        currentPage = numberPage!;
        currentscreen = currentscreen;
        emit(BottomState());
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: currentPage == numberPage ? Color(0xff4C68DA) : Colors.grey,
          ),
          Text(
            iconName!,
            style: TextStyle(
              color:
                  currentPage == numberPage ? Color(0xff4C68DA) : Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Future<void> flotingActionState(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddNewPost();
        },
      ),
    );
  }

  List<String> title = ['Home', 'Chats', 'Post', 'Settings'];
  int currentIndex = 0;
  void changeBottomNav(int index) {
    if (index == 1) getAllUsers();

    if (index == 2)
      emit(NewPoastState());
    else {
      currentIndex = index;
      emit(ChangeBottomNavState());
    }
  }

  late SocialUserModel usermodel;
  late PostModel postmodel;

  void userRegister({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(SocialRegisterLoadState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      createUser(
          name: username,
          email: email,
          password: password,
          uId: value.user!.uid);
    }).catchError((error) {
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void createUser({
    required String name,
    required String email,
    required String password,
    required String uId,
  }) {
    SocialUserModel model = SocialUserModel(
        name: name,
        email: email,
        phone: password,
        image:
            'https://as2.ftcdn.net/v2/jpg/00/67/20/79/1000_F_67207980_5jNk6I3KFlJjOXY73c3FlfvssaxY5N51.jpg',
        bio: 'Write your bio...',
        caver:
            'https://as2.ftcdn.net/v2/jpg/00/67/20/79/1000_F_67207980_5jNk6I3KFlJjOXY73c3FlfvssaxY5N51.jpg',
        uid: uId,
        isEmialVerified: false);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUsersuccessState());
    }).catchError((e) {
      emit(SocialCreateUserErrorState(e.toString()));
    });
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLoginLoadState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);

      emit(SocialLoginsuccessState(value.user!.uid));
    }).catchError((error) {
      emit(SocialLoginErrorState(error.toString()));
    });
  }

  void getUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      usermodel = SocialUserModel.fromjson(value.data()!);
      // print(value.data());
      emit(SocialGetUserSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(SocialGetUserUserErrorState(e.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordVisibilityState());
  }

  File? profileImage;
  File? caverImage;

  Future<void> getProfileImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ProfileImagePickedSuccessState());
    } else {
      print('NO Image print');
      emit(ProfileImagePickedErrorState());
    }
  }

  Future<void> getCaverImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      caverImage = File(pickedFile.path);
      emit(CoverImagePickedSuccessState());
    } else {
      print('NO Image print');
      emit(CoverImagePickedSErrorState());
    }
  }

  File? createStory;

  Future<void> createStoryImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      createStory = File(pickedFile.path);
      emit(ProfileImagePickedSuccessState());
    } else {
      print('NO Image print');
      emit(ProfileImagePickedErrorState());
    }
  }

  void uploadprofileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(UserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(UPLoadProfileImageSuccessState());
        updateUser(name: name, phone: phone, bio: bio, image: value);
      }).catchError((error) {
        emit(UPLoadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(UPLoadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(UserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(caverImage!.path).pathSegments.last}')
        .putFile(caverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(UPLoadCoverImageSuccessState());
        updateUser(name: name, phone: phone, bio: bio, cover: value);
      }).catchError((error) {
        emit(UPLoadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(UPLoadCoverImageErrorState());
    });
  }

  void upNameUser({
    required String name,
    String? cover,
    String? image,
  }) {
    emit(UserUpdateLoadingState());

    SocialUserModel model = SocialUserModel(
        name: name,
        image: image ?? usermodel.image,
        email: usermodel.email,
        caver: cover ?? usermodel.caver,
        uid: usermodel.uid,
        isEmialVerified: false);

    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel.uid)
        .update(model.toMap())
        .then((value) {
      print("${usermodel.uid}");

      getUserData();
    }).catchError((e) {
      print('here eeeeeeeeeee${e.toString()}');
      emit(UserUpdateErrorState());
    });
  }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? image,
  }) {
    emit(UserUpdateLoadingState());

    SocialUserModel model = SocialUserModel(
        name: name,
        phone: phone,
        image: image ?? usermodel.image,
        bio: bio,
        email: usermodel.email,
        caver: cover ?? usermodel.caver,
        uid: usermodel.uid,
        isEmialVerified: false);

    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel.uid)
        .update(model.toMap())
        .then((value) {
      print("${usermodel.uid}");

      getUserData();
    }).catchError((e) {
      print('here eeeeeeeeeee${e.toString()}');
      emit(UserUpdateErrorState());
    });
  }

  void uploadPostImage({
    required String dateTime,
    String? postImage,
    required String text,
  }) {
    emit(CreatePostLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postPhone!.path).pathSegments.last}')
        .putFile(postPhone!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // updateUser(name: name, phone: phone, bio: bio, cover: value);
        createPost(
          dateTime: dateTime,
          postImage: value,
          text: text,
        );
      }).catchError((error) {
        emit(CreatePostLoadingSuccessState());
      });
    }).catchError((error) {
      emit(CreatePostLoadingErrorrState());
    });
  }

  File? postPhone;

  void removePostImage() {
    postPhone = null;
    emit(RemovePostImagePickedState());
  }

  Future<void> getPostImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      postPhone = File(pickedFile.path);
      emit(PostImagePickedSuccessState());
    } else {
      print('NO Image print');
      emit(PostImagePickedErrorState());
    }
  }

  void createPost({
    required String dateTime,
    String? postImage,
    required String text,
  }) {
    // emit(UserUpdateLoadingState());
    emit(CreatePostLoadingState());

    PostModel model = PostModel(
      name: usermodel.name,
      image: usermodel.image,
      uid: usermodel.uid,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? '',
    );

    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
      // print("goddddddddddddddddddddd${usermodel.uid}");
      emit(CreatePostLoadingSuccessState());
    }).catchError((e) {
      print('here eeeeeeeeeee${e.toString()}');
      emit(CreatePostLoadingErrorrState());
    });
  }

  List<PostModel> post = [];
  List<String> postId = [];
  List<int> likes = [];
  // List<String> comments = [];
  List<SocialUserModel> allUser = [];

  void getPosts() {
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        element.reference.collection('Likes').get().then((value) {
          likes.add(value.docs.length);
          postId.add(element.id);
          post.add(PostModel.fromjson(element.data()));
        }).catchError((e) {});
      });
      emit(GetPostSuccessState());
    }).catchError((e) {
      emit(GetPostErrorState(e.toString()));
    });
  }

  void postLike(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('Likes')
        .doc(usermodel.uid)
        .set({
      'Like': true,
    }).then((value) {
      emit(LikePostSuccessState());
    }).catchError((e) {
      emit(LikePostErrorState(e.toString()));
    });
  }

  void postComment({String? commentId, String? comment}) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(commentId)
        .collection('comment')
        .doc(usermodel.uid)
        .set({
      'comment': comment,
    }).then((value) {
      emit(CommentPostSuccessState());
    }).catchError((e) {
      emit(CommentPostErrorState(e.toString()));
    });
  }

  void getAllUsers() {
    allUser = [];
    FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((element) {
        if (element.data()['uid'] != usermodel.uid)
          allUser.add(SocialUserModel.fromjson(element.data()));
      });

      emit(SocialGetAllUserSuccessState());
    }).catchError((e) {
      emit(SocialGetAllUserUserErrorState(e.toString()));
    });
  }

  void SendMessage({
    required String recevierId,
    required String? dateTime,
    required String text,
  }) {
    MessageModel model = MessageModel(
      text: text,
      receiverId: recevierId,
      senderId: usermodel.uid,
      dateTime: dateTime,
    );

    //Set myChat
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel.uid)
        .collection('Chats')
        .doc(recevierId)
        .collection('message')
        .add(model.toMap())
        .then((value) {
      emit(SendMassgeSuccessState());
    }).catchError((e) {
      emit(SendMassgeErrorState());
    });
    //Set recevirChat

    FirebaseFirestore.instance
        .collection('users')
        .doc(recevierId)
        .collection('Chats')
        .doc(usermodel.uid)
        .collection('message')
        .add(model.toMap())
        .then((value) {
      emit(SendMassgeSuccessState());
    }).catchError((e) {
      emit(SendMassgeErrorState());
    });
  }

  List<MessageModel> message = [];

  // MessageModel messageModel;

  void getMessage({
    required String recevierId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel.uid)
        .collection('Chats')
        .doc(recevierId)
        .collection('message')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      message = [];
      event.docs.forEach((element) {
        message.add(MessageModel.fromjson(element.data()));
        messageModel = MessageModel.fromjson(element.data());

        // messageModel.text;
        print('chattttttttttttttttttttttttt${messageModel!.dateTime}');
        // getdataMess.add(MessageModel.fromjson(element.data()));
      });
      emit(GetSendMassgeSuccessState());
    });
  }

  // List<MessageModel> textmessage = [];
  // void gettextMessage({
  //   required String recevierId,
  // }) {
  //   var messages = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(usermodel.uid)
  //       .collection('Chats')
  //       .doc(recevierId)
  //       .collection('message')
  //       .orderBy('dateTime')
  //       .get();

  //   // for (message in textmessage) {
  //   //   print('mmmmmmmmmmmmmmmmmmmmmmmmmmmm${textmessage.toString()}');
  //   // }
  // }

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(VerificationLoadingState());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(VerificationErroState(error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    verificationId = verificationId;
    emit(VerificationSuccessState());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(VerificationSuccessState());
    } catch (error) {
      emit(VerificationErroState(error.toString()));
    }
  }
}
