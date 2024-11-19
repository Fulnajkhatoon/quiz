class Quotes {
    String username;
    String email;
    String password;
    String mobileno;
    String university;

    Quotes({
        required this.username,
        required this.email,
        required this.password,
        required this.mobileno,
        required this.university, 
    });

    factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
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
