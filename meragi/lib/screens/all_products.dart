import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meragi/bloc/cubit/product_cubit.dart';
import 'package:meragi/bloc/cubit/product_state.dart';
import 'package:meragi/bloc/models/product_model.dart';
import 'package:meragi/screens/product_description.dart.dart';
import 'package:meragi/utils/color_constants.dart';
import 'package:meragi/widgets/app_bar_title.dart';
import 'package:meragi/widgets/loader.dart';
import 'package:meragi/widgets/product_card.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        title: const AppBarTitle(title: "All Products"),
        centerTitle: true,
      ),
      body: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ProductInitial) {
              return const Loader();
            }
            if (state is ProductError) {
              return Text(state.error);
            }
            if (state is ProductLoaded) {
              List<ProductModel> productsData = state.productDetails.toList();
              return ListView.builder(
                shrinkWrap: true,
                itemCount: productsData.length,
                itemBuilder: (context, index) {
                  ProductModel product = productsData[index];
                  return ProductCard(
                    productTitle: product.title.toString(),
                    productImage: product.image.toString(),
                    price: product.price.toString(),
                    rating: product.rating!.rate.toString(),
                    ratingCount: product.rating!.count.toString(),
                    category: product.category.toString(),
                    viewMore: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductPage(productId: product.id!.toInt())));
                    },
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
    );
  }
}
