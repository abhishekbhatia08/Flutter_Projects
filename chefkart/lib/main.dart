import 'package:chefkart/bloc/cubit/dish_cubit.dart';
import 'package:chefkart/bloc/cubit/dish_ingredients_cubit.dart';
import 'package:chefkart/screens/select_dishes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DishCubit()),
        BlocProvider(create: (context) => DishIngredientsCubit()),
      ],
      child: MaterialApp(
        title: 'Chefkart',
        theme: ThemeData(),
        home: const SelectDishesScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
