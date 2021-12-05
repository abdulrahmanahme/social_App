class PostModel {
  String? name;
  String? image;
  String? dateTime;
  String? postImage;
  String? text;
  String? uid;

  PostModel({
    this.dateTime,
    this.text,
    this.postImage,
    this.name,
    this.uid,
    this.image,
  });

  PostModel.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    dateTime = json['dateTime'];
    image = json['image'];
    postImage = json['postImage'];
    text = json['text'];
    uid = json['uid'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dateTime': dateTime,
      'postImage': postImage,
      'image': image,
      'text': text,
      'uid': uid,
    };
  }
}
