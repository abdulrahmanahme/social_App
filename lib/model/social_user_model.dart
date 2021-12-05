class SocialUserModel {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? bio;
  String? caver;

  String? uid;
  bool? isEmialVerified;
  SocialUserModel(
      {this.email,
      this.name,
      this.phone,
      this.uid,
      this.image,
      this.bio,
      this.caver,
      this.isEmialVerified});

  SocialUserModel.fromjson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    image = json['image'];
    image = json['image'];
    bio = json['bio'];
    caver = json['caver'];
    uid = json['uid'];

    isEmialVerified = json['isEmialVerified'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'bio': bio,
      'uid': uid,
      'caver': caver,
      'isEmialVerified': isEmialVerified,
    };
  }
}
