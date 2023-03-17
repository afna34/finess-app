class UserModel {
  String? uid;
  String? userName;
  String? email;
  String? password;

  UserModel({
    this.uid,
    this.userName,
    this.email,
    this.password,
  });

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      userName: map['userName'],
      email: map['email'],
      password: map['password'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userName': userName,
      'email': email,
      'password': password,
    };
  }
}