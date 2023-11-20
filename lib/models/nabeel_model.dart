class Nabeel{
  String? name;
  int? age;

  Nabeel({
    required this.name,
    required this.age,
  });

  factory Nabeel.fromJson(Map<String,dynamic> json) => Nabeel(
      name: json["name"],
      age: json["age"],
  );

  Map<String,dynamic> toJson() =>
      {
        "name": name,
        "age": age,
      };

  Nabeel copyWith({
    String? name,
    int? age,
}) =>
      Nabeel(
          name: name ?? this.name,
          age: age ?? this.age,
      );
}