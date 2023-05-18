import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meragi/bloc/cubit/product_cubit.dart';
import 'package:meragi/screens/all_products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductCubit()),
      ],
      child: MaterialApp(
        title: 'Meragi',
        theme: ThemeData(),
        home: const AllProductsScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
