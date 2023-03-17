class CenterModel {
  String? uid;
  String? centerName;
  String? email;
  String? location;
  String? catchingWord;
  String? summary;
  String? students;
  String? password;

  CenterModel({
    this.uid,
    this.centerName,
    this.email,
    this.location,
    this.catchingWord,
    this.summary,
    this.students,
    this.password,
  });

  // receiving data from server
  factory CenterModel.fromMap(map) {
    return CenterModel(
      uid: map['uid'],
      centerName: map['centerName'],
      email: map['email'],
      location: map['location'],
      catchingWord: map['catchingWord'],
      summary: map['summary'],
      students: map['students'],
      password: map['password'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'centerName': centerName,
      'email': email,
      'location': location,
      'catchingWord': catchingWord,
      'summary': summary,
      'students': students,
      'password': password,
    };
  }
}