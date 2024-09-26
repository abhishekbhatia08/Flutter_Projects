import 'package:kavachz/Constants/image_constants.dart';
import 'package:kavachz/Models/categories.dart';

List<Category> categories = [
  Category(
    id: "C1",
    title: "Fresh Fruits",
    image: ImageConstants.fruits,
    isSelected: false,
  ),
  Category(
    id: "C2",
    title: "Fresh\nVegetables",
    image: ImageConstants.vegetables,
    isSelected: false,
  ),
  Category(
    id: "C3",
    title: "Leafy, Herbs\n& Seasonings",
    image: ImageConstants.herbs,
    isSelected: false,
  ),
  Category(
    id: "C4",
    title: "Leaves &\nFlowers",
    image: ImageConstants.flowers,
    isSelected: false,
  ),
  Category(
    id: "C5",
    title: "Exotic Fruits\n& Vegetables",
    image: ImageConstants.pineapple,
    isSelected: false,
  ),
];
