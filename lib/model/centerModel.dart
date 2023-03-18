class CenterModel {
  String? uid;
  String? centerName;
  String? email;
  String? location;
  String? catchingWord;
  String? summary;
  String? students;
  String? password;
  String? trainerName;
  String? qualification;
  String? feeAmount;
  String? feeDetails;
  String? contact;

  CenterModel({
    this.uid,
    this.centerName,
    this.email,
    this.location,
    this.catchingWord,
    this.summary,
    this.students,
    this.password,
    this.trainerName,
    this.qualification,
    this.feeAmount,
    this.feeDetails,
    this.contact,
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
      trainerName: map['trainerName'],
      qualification: map['qualification'],
      feeDetails: map['feeDetails'],
      feeAmount: map['feeAmount'],
      contact: map['contact'],
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
      'trainerName': trainerName,
      'qualification': qualification,
      'feeAmount': feeAmount,
      'feeDetails': feeDetails,
      'contact': contact,
    };
  }
}