class ProductItem {
  final int id;
  final String name;
  final int price;
  final double rating;
  final String description;

  ProductItem({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.description,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        rating: json['rating'],
        description: json['description']);
  }
}
