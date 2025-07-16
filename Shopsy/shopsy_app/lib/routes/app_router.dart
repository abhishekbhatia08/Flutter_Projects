import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopsy_app/data/model/product_model.dart';
import 'package:shopsy_app/presentation/cart/cart_screen.dart';
import 'package:shopsy_app/presentation/home/home_screen.dart';
import 'package:shopsy_app/presentation/home/product_detail_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: CartRoute.page),
    AutoRoute(page: ProductDetailRoute.page),
  ];
}