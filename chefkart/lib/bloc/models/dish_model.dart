class DishModel {
  List<Dishes>? dishes;
  List<PopularDishes>? popularDishes;

  DishModel({this.dishes, this.popularDishes});

  DishModel.fromJson(Map<String, dynamic> json) {
    if (json['dishes'] != null) {
      dishes = <Dishes>[];
      json['dishes'].forEach((v) {
        dishes!.add(Dishes.fromJson(v));
      });
    }
    if (json['popularDishes'] != null) {
      popularDishes = <PopularDishes>[];
      json['popularDishes'].forEach((v) {
        popularDishes!.add(PopularDishes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (dishes != null) {
      data['dishes'] = dishes!.map((v) => v.toJson()).toList();
    }
    if (popularDishes != null) {
      data['popularDishes'] = popularDishes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dishes {
  String? name;
  double? rating;
  String? description;
  List<String>? equipments;
  String? image;
  int? id;

  Dishes(
      {this.name,
      this.rating,
      this.description,
      this.equipments,
      this.image,
      this.id});

  Dishes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rating = json['rating'];
    description = json['description'];
    equipments = json['equipments'].cast<String>();
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['rating'] = rating;
    data['description'] = description;
    data['equipments'] = equipments;
    data['image'] = image;
    data['id'] = id;
    return data;
  }
}

class PopularDishes {
  String? name;
  String? image;
  int? id;

  PopularDishes({this.name, this.image, this.id});

  PopularDishes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['image'] = image;
    data['id'] = id;
    return data;
  }
}
