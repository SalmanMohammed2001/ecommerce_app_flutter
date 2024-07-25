class UserModel {
  String name;
  String email;
  String uid;
  String image;

  UserModel(
      {required this.name,
      required this.email,
      required this.uid,
      this.image =
          'https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png'});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'], email: json['email'], uid: json['uid']);
  }

  Map<String,dynamic>toJson(){
    return {
      'name':name,
      'email':email,
      'uid':uid,
      'image':image,
  };
  }
}
