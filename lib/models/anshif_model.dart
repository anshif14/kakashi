class Anshif{
  String? name;
  int? age;

  Anshif({
    required this.name,
    required this.age,
});

  factory Anshif.fromJson(Map<String,dynamic> json) => Anshif(
        name: json["name"],
        age: json["age"],
  );

  Map<String,dynamic> toJson() => {
    "name": name,
    "age": age,
  };

  Anshif copyWith({
    String? name,
    int? age,
}) => Anshif(
      name: name ?? this.name,
      age: age ?? this.age,
  );
}