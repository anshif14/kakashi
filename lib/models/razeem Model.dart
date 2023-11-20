class Razeem{
  String? name;
  int ? age;

  Razeem({
    required this.name,
    required this.age
});

 factory Razeem.fromJson(Map<String,dynamic>json)=>
      Razeem(name: json['name'], age: json['age']);

 Map<String,dynamic> toJson()=>

     {"name": name, "age": age};

 Razeem copyWith({
    String?name,
   int?age
})=>Razeem(name: name??this.name, age: age??this.age);

}