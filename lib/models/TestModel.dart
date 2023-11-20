class Test {
  String? name;
  int? age;

  Test({required this.name, required this.age});

  factory Test.fromJson(Map<String, dynamic> json) =>
      Test(name: json['name'], age: json['age']);

  Map<String, dynamic> toJson() => {'name': name, 'age': age};

  Test copyWith({String? name, int? age}) =>
      Test(name: name ?? this.name, age: age ?? this.age);
}
