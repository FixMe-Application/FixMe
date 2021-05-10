class Post {
  final String uid;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String userType;

  Post(
      {this.uid,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.userType});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        uid: json['uid'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        userType: json['userType']);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map['uid'] = uid;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['userType'] = userType;
    return map;
  }
}
