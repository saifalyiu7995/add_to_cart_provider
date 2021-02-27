class Products {
  Products({
    this.name,
    this.image,
  });

  String name;
  String image;

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
