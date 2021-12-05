abstract class SocialLoginStates {}

class LoginInitialState extends SocialLoginStates {}

class LoginLoadingState extends SocialLoginStates {}

class LoginSuccessState extends SocialLoginStates {}

class LoginErrorState extends SocialLoginStates {
  final String error;

  LoginErrorState(this.error);
}

class ChangePasswordVisibilityState extends SocialLoginStates {}

class SocialRegisterLoadState extends SocialLoginStates {}

class SocialRegistersuccessState extends SocialLoginStates {}

class SocialRegisterErrorState extends SocialLoginStates {
  final String error;

  SocialRegisterErrorState(this.error);
}

class SocialLoginLoadState extends SocialLoginStates {}

class SocialLoginsuccessState extends SocialLoginStates {
  final String uId;

  SocialLoginsuccessState(this.uId);
}

class SocialLoginErrorState extends SocialLoginStates {
  final String error;

  SocialLoginErrorState(this.error);
}

class SocialCreateUserLoadState extends SocialLoginStates {}

class SocialCreateUsersuccessState extends SocialLoginStates {
  // final String uId;

  // SocialCreateUsersuccessState(this.uId);
}

class SocialCreateUserErrorState extends SocialLoginStates {
  final String error;

  SocialCreateUserErrorState(this.error);
}
// Get User Loading;

class SocialGetUserLoadingState extends SocialLoginStates {}

class SocialGetUserSuccessState extends SocialLoginStates {}

class SocialGetUserUserErrorState extends SocialLoginStates {
  final String error;

  SocialGetUserUserErrorState(this.error);
}
// Get All Users;

class SocialGetAllUserLoadingState extends SocialLoginStates {}

class SocialGetAllUserSuccessState extends SocialLoginStates {}

class SocialGetAllUserUserErrorState extends SocialLoginStates {
  final String error;

  SocialGetAllUserUserErrorState(this.error);
}

class ChangeBottomNavState extends SocialLoginStates {}

class NewPoastState extends SocialLoginStates {}

class ProfileImagePickedSuccessState extends SocialLoginStates {}

class ProfileImagePickedErrorState extends SocialLoginStates {}

class CoverImagePickedSuccessState extends SocialLoginStates {}

class CoverImagePickedSErrorState extends SocialLoginStates {}

class UPLoadProfileImageSuccessState extends SocialLoginStates {}

class UPLoadProfileImageErrorState extends SocialLoginStates {}

class UPLoadCoverImageSuccessState extends SocialLoginStates {}

class UPLoadCoverImageErrorState extends SocialLoginStates {}

class UserUpdateErrorState extends SocialLoginStates {}

class UserUpdateLoadingState extends SocialLoginStates {}

//Create Post
class CreatePostLoadingState extends SocialLoginStates {}

class CreatePostLoadingSuccessState extends SocialLoginStates {}

class CreatePostLoadingErrorrState extends SocialLoginStates {}

//Create Image

class PostImagePickedSuccessState extends SocialLoginStates {}

class PostImagePickedErrorState extends SocialLoginStates {}
//remove postImage

class RemovePostImagePickedState extends SocialLoginStates {}

//Get POST
class GetPostLoadingState extends SocialLoginStates {}

class GetPostSuccessState extends SocialLoginStates {}

class GetPostErrorState extends SocialLoginStates {
  final String error;

  GetPostErrorState(this.error);
}
//Get Likes

class LikePostSuccessState extends SocialLoginStates {}

class LikePostErrorState extends SocialLoginStates {
  final String error;

  LikePostErrorState(this.error);
}

//Get comment

class CommentPostSuccessState extends SocialLoginStates {}

class CommentPostErrorState extends SocialLoginStates {
  final String error;

  CommentPostErrorState(this.error);
}

//Chat
class SendMassgeSuccessState extends SocialLoginStates {}

class SendMassgeErrorState extends SocialLoginStates {}

class GetSendMassgeSuccessState extends SocialLoginStates {}

/// verifivation phone
class VerificationLoadingState extends SocialLoginStates {}

class VerificationSuccessState extends SocialLoginStates {}

class VerificationErroState extends SocialLoginStates {
  final String error;

  VerificationErroState(this.error);
}

// state
class BottomState extends SocialLoginStates {}

// get text messge

class getTextMessageState extends SocialLoginStates {}
