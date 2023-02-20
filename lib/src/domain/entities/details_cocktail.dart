class DetailsCocktail {
  String id;
  String name;
  String category;
  String glass;
  String instructions;
  List ingredients;
  String img;

  DetailsCocktail(this.id, this.name, this.category, this.glass,
      this.instructions, this.ingredients, this.img);

  Map toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'glass': glass,
        'instructions': instructions,
        'ingredients': ingredients,
        'img': img
      };

  factory DetailsCocktail.fromJson(dynamic json) {
    return DetailsCocktail(
        json["id"] as String,
        json["name"] as String,
        json["category"] as String,
        json["glass"] as String,
        json["instructions"] as String,
        json["ingredients"],
        json["img"] as String);
  }
}
