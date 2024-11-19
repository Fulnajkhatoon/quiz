class Profile {
  // Added userId
  String username;
  String email;
  String password;
  String mobileno;
  String university;

  Profile({
    required this.username,
    required this.email,
    required this.password,
    required this.mobileno,
    required this.university,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        mobileno: json["mobileno"],
        university: json["university"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "mobileno": mobileno,
        "university": university,
      };
}
