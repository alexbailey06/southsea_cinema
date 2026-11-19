class Film {
  final String id;
  final String name;
  final String description;
  final String ageRating;
  final String runTime;
  final String screeningTime;
  final double price;
  final String imagePath;

  const Film({
    required this.id,
    required this.name,
    required this.description,
    required this.ageRating,
    required this.runTime,
    required this.screeningTime,
    required this.price,
    required this.imagePath,
  });

  String get formattedPrice => "£${price.toStringAsFixed(2)}";

  factory Film.fromJson(Map<String, dynamic> json) {
    final String id = json["id"] as String;
    final String name = json["name"] as String;
    final String description = json["description"] as String;
    final String ageRating = json["ageRating"] as String;
    final String runTime = json["runTime"] as String;
    final String screeningTime = json["screeningTime"] as String;
    final num priceNumber = json["price"] as num;
    final double price = priceNumber.toDouble();
    final String imagePath = json["imagePath"] as String;

    return Film(
      id: id,
      name: name,
      description: description,
      ageRating: ageRating,
      runTime: runTime,
      screeningTime: screeningTime,
      price: price,
      imagePath: imagePath,
    );
  }
}
