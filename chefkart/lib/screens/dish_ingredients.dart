import 'package:chefkart/bloc/cubit/dish_ingredients_cubit.dart';
import 'package:chefkart/bloc/cubit/dish_ingredients_state.dart';
import 'package:chefkart/bloc/models/dish_ingredients_model.dart';
import 'package:chefkart/utils/color_constants.dart';
import 'package:chefkart/utils/image.dart';
import 'package:chefkart/widgets/date_time_bar.dart';
import 'package:chefkart/widgets/heading.dart';
import 'package:chefkart/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:chefkart/widgets/rating_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishIngredients extends StatelessWidget {
  const DishIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorConstants.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<DishIngredientsCubit, DishIngredientsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is DishIngredientsInitial) {
                return const Loader();
              }
              if (state is DishIngredientsLoaded) {
                DishIngredientsModel dishData = state.ingredientsDetails;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    topBar(context, dishData),
                    ingredientsColumn(context, dishData),
                  ],
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Something went wrong"),
                ],
              );
            }),
      ),
    );
  }
}

@override
Widget topBar(BuildContext context, DishIngredientsModel model) {
  final screenSize = MediaQuery.of(context).size;
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Container(
        height: screenSize.height * 0.35,
        width: screenSize.width,
        margin: const EdgeInsets.only(top: 10),
        alignment: Alignment.centerRight,
        child: CircleAvatar(
          radius: screenSize.height * 0.15,
          backgroundColor: ColorConstants.enabledColor,
        ),
      ),
      Positioned(
        top: screenSize.height * 0.07,
        left: 23,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            nameRatingrow(context, model.name.toString(), "4.2"),
            Container(
              width: screenSize.width * 0.55,
              padding: const EdgeInsets.only(top: 10, bottom: 25),
              child: const Text(
                "Mughlai Masala is a style of cookery developed in the Indian Subcontinent by the imperial kitchens of the Mughal Empire.",
                maxLines: 3,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: ColorConstants.descriptionColor),
              ),
            ),
            iconText(context, ConstImage.clock, model.timeToPrepare.toString(),
                null),
          ],
        ),
      ),
      Positioned(
          bottom: -30,
          right: -150,
          height: 250,
          width: 350,
          child: Image.asset(ConstImage.ingredients1)),
      Positioned(
          bottom: -100,
          right: -90,
          height: 400,
          width: 200,
          child: Image.asset(ConstImage.ingredients2)),
    ],
  );
}

@override
Widget ingredientsColumn(BuildContext context, DishIngredientsModel model) {
  List<Vegetables> vegetablesData = model.ingredients!.vegetables!.toList();
  List<Spices> spicesData = model.ingredients!.spices!.toList();
  List<Appliances> appliancesData = model.ingredients!.appliances!.toList();
  return Padding(
    padding: const EdgeInsets.fromLTRB(23, 0, 23, 23),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Heading(text: "Ingredients"),
        ),
        const Text(
          "For 2 people",
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: ColorConstants.descriptionColor),
        ),
        const Divider(),
        ingredientsSubheading(
            context, "Vegetables", vegetablesData.length.toString()),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: vegetablesData.length,
            itemBuilder: (context, index) {
              return ingredientRow(
                  context,
                  vegetablesData[index].name.toString(),
                  vegetablesData[index].quantity.toString());
            }),
        ingredientsSubheading(context, "Spices", spicesData.length.toString()),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: spicesData.length,
            itemBuilder: (context, index) {
              return ingredientRow(context, spicesData[index].name.toString(),
                  spicesData[index].quantity.toString());
            }),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Heading(text: "Appliances"),
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              itemCount: appliancesData.length,
              itemBuilder: (context, index) {
                return applianceBox(
                    context, appliancesData[index].name.toString());
              }),
        ),
      ],
    ),
  );
}

@override
Widget nameRatingrow(BuildContext context, String dishName, String rating) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        dishName,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: ColorConstants.black,
        ),
      ),
      RatingBox(rating: rating)
    ],
  );
}

@override
Widget ingredientsSubheading(
  BuildContext context,
  String subHeading,
  String number,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "$subHeading ($number)",
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: ColorConstants.black,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.arrow_drop_down,
            color: ColorConstants.black,
          ),
        )
      ],
    ),
  );
}

@override
Widget ingredientRow(
  BuildContext context,
  String ingredient,
  String quantity,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ingredient,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: ColorConstants.black,
          ),
        ),
        Text(
          quantity,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: ColorConstants.black,
          ),
        ),
      ],
    ),
  );
}

@override
Widget applianceBox(BuildContext context, String applianceName) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 21),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    decoration: const BoxDecoration(
        color: ColorConstants.boxColor,
        borderRadius: BorderRadius.all(Radius.circular(7))),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ConstImage.appliances),
          Text(
            applianceName,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: ColorConstants.black,
            ),
          ),
        ]),
  );
}
