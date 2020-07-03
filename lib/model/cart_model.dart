import 'dart:convert';

Cart clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Cart.fromMap(jsonData);
}

String clientToJson(Cart data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Cart {
  int id;
  var name;
  var image;
  var description;
  var price;

  Cart({this.id, this.name, this.image, this.description, this.price});

  factory Cart.fromMap(Map<String, dynamic> json) => new Cart(
        id: json["id"],
        name: json["product_name"],
        image: json["product_image"],
        description: json["product_description"],
        price: json["product_price"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "product_name": name,
        "product_image": image,
        "product_description": description,
        "product_price": price
      };
}
