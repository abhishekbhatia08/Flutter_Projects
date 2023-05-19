import 'package:chefkart/bloc/cubit/dish_cubit.dart';
import 'package:chefkart/bloc/cubit/dish_state.dart';
import 'package:chefkart/bloc/models/dish_model.dart';
import 'package:chefkart/screens/dish_ingredients.dart';
import 'package:chefkart/utils/color_constants.dart';
import 'package:chefkart/utils/image.dart';
import 'package:chefkart/widgets/app_bar_title.dart';
import 'package:chefkart/widgets/cuisine_button.dart';
import 'package:chefkart/widgets/date_time_bar.dart';
import 'package:chefkart/widgets/dish_card.dart';
import 'package:chefkart/widgets/heading.dart';
import 'package:chefkart/widgets/loader.dart';
import 'package:chefkart/widgets/menu_button.dart';
import 'package:chefkart/widgets/popular_dish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

List<int> addedItems = [];
final DateTime today = DateTime.now();

class SelectDishesScreen extends StatefulWidget {
  const SelectDishesScreen({super.key});

  @override
  State<SelectDishesScreen> createState() => _SelectDishesScreenState();
}

class _SelectDishesScreenState extends State<SelectDishesScreen> {
  bool isDateSelected = false;
  bool isTimeSelected = false;
  DateTime? selectedDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  String? timeRange;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addedItems = [];
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: today,
        firstDate: today,
        lastDate: DateTime(today.year + 1),
      ).then((value) {
        setState(() {
          isDateSelected = true;
          selectedDate = value!;
        });
        return null;
      }).whenComplete(() => pickStartTime());

  Future<TimeOfDay?> pickStartTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      ).then((value) {
        setState(() {
          selectedStartTime = value!;
        });
        return null;
      }).then((value) => pickEndTime());

  Future<TimeOfDay?> pickEndTime() => showTimePicker(
        context: context,
        initialTime: selectedStartTime as TimeOfDay,
      ).then((value) {
        setState(() {
          isTimeSelected = true;
          selectedEndTime = value!;
          timeRange =
              "${selectedStartTime!.hour.toString()}:${selectedStartTime!.minute.toString()}-${selectedEndTime!.hour.toString()}:${selectedEndTime!.minute.toString()}";
        });
        return null;
      });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        backgroundColor: ColorConstants.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorConstants.black,
          ),
        ),
        title: const AppBarTitle(title: "Select Dishes"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateTimeBar(
            date: isDateSelected
                ? DateFormat('dd-MMMM-yyyy').format(selectedDate!)
                : "Select Date",
            time: isTimeSelected ? timeRange.toString() : "Select Time",
            datePress: () {
              pickDate();
            },
            timePress: () {
              pickStartTime();
            },
          ),
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: const [
                CuisineButton(cuisineName: "Italian", onPressed: null),
                CuisineButton(cuisineName: "Indian", onPressed: null),
                CuisineButton(cuisineName: "Indian", onPressed: null),
                CuisineButton(cuisineName: "Indian", onPressed: null),
                CuisineButton(cuisineName: "Indian", onPressed: null),
                CuisineButton(cuisineName: "Indian", onPressed: null),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 23),
            child: Heading(text: "Popular Dishes"),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: BlocConsumer<DishCubit, DishState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is DishInitial) {
                    return Container();
                  }
                  if (state is DishLoaded) {
                    List<PopularDishes>? popularDishesData =
                        state.dishDetails.popularDishes;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: popularDishesData!.length,
                      itemBuilder: (context, index) {
                        return PopularDish(
                          dishName: popularDishesData[index].name.toString(),
                          dishImage: popularDishesData[index].image.toString(),
                          onTap: () {},
                        );
                      },
                    );
                  }
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Something went wrong"),
                    ],
                  );
                }),
          ),
          const Divider(thickness: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Row(
              children: [
                const Heading(text: "Recommended"),
                const Icon(Icons.arrow_drop_down),
                const Spacer(),
                MenuButton(onPressed: () {})
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: screenSize.height * 0.4,
            child: BlocConsumer<DishCubit, DishState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is DishInitial) {
                    return const Loader();
                  }
                  if (state is DishLoaded) {
                    List<Dishes>? dishesData = state.dishDetails.dishes;
                    return ListView.builder(
                        padding: const EdgeInsets.only(bottom: 50),
                        physics: const ClampingScrollPhysics(),
                        itemCount: dishesData!.length,
                        itemBuilder: (context, index) {
                          return DishCard(
                            dishName: dishesData[index].name.toString(),
                            dishImage: dishesData[index].image.toString(),
                            rating: dishesData[index].rating.toString(),
                            isNonVeg: false,
                            equipmentsName:
                                dishesData[index].equipments!.toList(),
                            dishDescription:
                                "Chicken fried in deep tomato sauce with delicious spices",
                            viewListPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DishIngredients()));
                            },
                            addButton: () {
                              setState(() {
                                addedItems.add(dishesData[index].id!.toInt());
                                print(addedItems.length);
                              });
                            },
                          );
                        });
                  }
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Something went wrong"),
                    ],
                  );
                }),
          )
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: addedItems.isEmpty
          ? null
          : GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DishIngredients()));
              },
              child: Container(
                width: screenSize.width * 0.7,
                margin: EdgeInsets.only(bottom: screenSize.height * 0.03),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: const BoxDecoration(
                    color: ColorConstants.black,
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Image.asset(
                        ConstImage.food,
                        scale: 1.5,
                      ),
                    ),
                    Text("${addedItems.length.toString()} food item selected",
                        style: const TextStyle(color: ColorConstants.white)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward, color: ColorConstants.white)
                  ],
                ),
              ),
            ),
    );
  }
}
