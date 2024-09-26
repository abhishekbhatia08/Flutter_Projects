import 'package:flutter/material.dart';
import 'package:kavachz/Constants/color_constants.dart';
import 'package:kavachz/Constants/image_constants.dart';
import 'package:kavachz/Screens/Search/no_result_found.dart';
import 'package:kavachz/Screens/Search/recent_search_items.dart';
import 'package:kavachz/Models/items.dart';
import 'package:kavachz/Widgets/dashboard_category.dart';
import 'package:kavachz/Widgets/item_card.dart';
import 'package:kavachz/Widgets/search_item.dart';
import 'package:search_page/search_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<bool> selectedCategory = [true, false, false, false, false];
  static const items = [
    Items(ImageConstants.apple, "Apple", "20", "Fruits and Vegetables", "C1"),
    Items(ImageConstants.mango, "Mango", "20", "Fruits and Vegetables", "C1"),
    Items(ImageConstants.pineapple, "Pineapple", "20", "Fruits and Vegetables",
        "C1"),
    Items(ImageConstants.banana, "Banana", "20", "Fruits and Vegetables", "C1"),
    Items(ImageConstants.herbs, "Herbs", "20", "Leafy, Herbs\n& Seasonings",
        "C3"),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: ColorConstants.headingColor,
        ),
        title: const Text(
          "Fruits and Vegetables",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 30,
            color: ColorConstants.headingColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => showSearch(
                    context: context,
                    delegate: SearchPage(
                      barTheme: ThemeData(
                        canvasColor: ColorConstants.whiteColor,
                        appBarTheme: const AppBarTheme(
                            elevation: 0,
                            color: ColorConstants.whiteColor,
                            iconTheme: IconThemeData(
                                color: ColorConstants.headingColor)),
                        primaryColor: ColorConstants.whiteColor,
                      ),
                      searchStyle:
                          const TextStyle(color: ColorConstants.headingColor),
                      onQueryUpdate: print,
                      items: items,
                      searchLabel: 'Search Items',
                      suggestion: const RecentSearchItems(),
                      failure: const NoSearchFound(),
                      filter: (items) => [
                        items.itemName,
                        items.itemCategory,
                      ],
                      sort: (a, b) => a.compareTo(b),
                      builder: (items) => SearchItem(
                        itemName: items.itemName,
                        itemCategory: items.itemCategory,
                        itemImage: items.itemImage,
                      ),
                    ),
                  ),
              icon: const Icon(
                Icons.search,
                weight: 10,
                size: 30,
                color: ColorConstants.headingColor,
              ))
        ],
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                width: screenSize.width * 0.25,
                child: ListView(children: [
                  DashboardCategoryCard(
                    itemCategory: "Fresh Fruits",
                    itemImage: ImageConstants.fruits,
                    itemSelected: selectedCategory[0],
                    onCategorySelect: () {
                      setState(() {
                        selectedCategory = List.generate(5, (index) => false);
                        selectedCategory[0] = !selectedCategory[0];
                      });
                    },
                  ),
                  DashboardCategoryCard(
                    itemCategory: "Fresh\nVegetables",
                    itemImage: ImageConstants.vegetables,
                    itemSelected: selectedCategory[1],
                    onCategorySelect: () {
                      setState(() {
                        selectedCategory = List.generate(5, (index) => false);
                        selectedCategory[1] = !selectedCategory[1];
                      });
                    },
                  ),
                  DashboardCategoryCard(
                    itemCategory: "Leafy, Herbs\n& Seasonings",
                    itemImage: ImageConstants.herbs,
                    itemSelected: selectedCategory[2],
                    onCategorySelect: () {
                      setState(() {
                        selectedCategory = List.generate(5, (index) => false);
                        selectedCategory[2] = !selectedCategory[2];
                      });
                    },
                  ),
                  DashboardCategoryCard(
                    itemCategory: "Leaves &\nFlowers",
                    itemImage: ImageConstants.flowers,
                    itemSelected: selectedCategory[3],
                    onCategorySelect: () {
                      setState(() {
                        selectedCategory = List.generate(5, (index) => false);
                        selectedCategory[3] = !selectedCategory[3];
                      });
                    },
                  ),
                  DashboardCategoryCard(
                    itemCategory: "Exotic Fruits\n& Vegetables",
                    itemImage: ImageConstants.pineapple,
                    itemSelected: selectedCategory[4],
                    onCategorySelect: () {
                      setState(() {
                        selectedCategory = List.generate(5, (index) => false);
                        selectedCategory[4] = !selectedCategory[4];
                      });
                    },
                  ),
                ])),
            const Spacer(),
            itemsList(context),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border.all(color: ColorConstants.borderColor)),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          children: [
            bottomButton(
              context,
              "add new",
              ColorConstants.lightGreen,
              ColorConstants.primary,
              () {},
            ),
            const SizedBox(width: 15),
            bottomButton(
              context,
              "go to cart",
              ColorConstants.primary,
              ColorConstants.whiteColor,
              () {},
            ),
          ],
        ),
      ),
    );
  }
}

@override
Widget bottomButton(
  BuildContext context,
  String buttonText,
  dynamic bgColor,
  dynamic textColor,
  dynamic onPressed,
) {
  final screenSize = MediaQuery.of(context).size;
  return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          elevation: 1,
          padding: const EdgeInsets.symmetric(vertical: 18.5, horizontal: 37),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          minimumSize: Size(screenSize.width * 0.4, screenSize.height * 0.08)),
      child: Text(
        buttonText.toUpperCase(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ));
}

@override
Widget itemsList(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  return SizedBox(
      width: screenSize.width * 0.7,
      child: ListView(children: [
        ItemCard(
          itemName: "Apple",
          itemCost: "20",
          itemImage: ImageConstants.apple,
          addButton: () {},
        ),
        ItemCard(
          itemName: "Mango",
          itemCost: "20",
          itemImage: ImageConstants.mango,
          addButton: () {},
        ),
        ItemCard(
          itemName: "Watermelon",
          itemCost: "20",
          itemImage: ImageConstants.watermelon,
          addButton: () {},
        ),
        ItemCard(
          itemName: "Banana",
          itemCost: "20",
          itemImage: ImageConstants.banana,
          addButton: () {},
        ),
        ItemCard(
          itemName: "Black Grapes",
          itemCost: "20",
          itemImage: ImageConstants.blackGrapes,
          addButton: () {},
        ),
      ]));
}
