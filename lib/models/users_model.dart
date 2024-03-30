class UsersModel{
  String? userName;
  String? password;
  String? email;
  UsersModel({
    this.email,
    this.password,
    this.userName
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': this.userName,
      'password': this.password,
      'email': this.email,
    };
  }

  factory UsersModel.fromMap(Map<String,dynamic>map){
    return UsersModel(
        email: map['email'] ?? "",
        password: map['password']?? "",
        userName: map['userName']?? ""
    );
  }

  UsersModel copyWith({
    String? email,
    String? password,
    String? userName
  }){
    return UsersModel(
        email:  email ?? this.email,
        password:  password ?? this.password,
        userName: userName ?? this.userName
    );
  }

}