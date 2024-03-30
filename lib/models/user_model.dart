class User{
  String name;
  int age;

  User({
    required this.name,
    required this.age,
  });

  User copyWith({
    String? name,
    int? age,
  }) => User(
      name: name ?? this.name,
      age: age ?? this.age,
    );

  Map<String, dynamic> toJson() => {
      'name': name,
      'age': age,
    };


  factory User.fromJson(Map<String, dynamic> json) => User(
      name: json['name'],
      age: json['age'],
    );
}