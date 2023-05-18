import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meragi/bloc/cubit/product_cubit.dart';
import 'package:meragi/bloc/cubit/product_state.dart';
import 'package:meragi/bloc/models/product_model.dart';
import 'package:meragi/utils/color_constants.dart';
import 'package:meragi/widgets/loader.dart';
import 'package:meragi/widgets/rating_box.dart';

class ProductPage extends StatelessWidget {
  final int productId;
  const ProductPage({super.key, required this.productId});

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
        child: BlocConsumer<ProductCubit, ProductState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ProductInitial) {
                return const Loader();
              }
              if (state is ProductError) {
                return Text(state.error);
              }
              if (state is ProductLoaded) {
                List<ProductModel> productsData = state.productDetails
                    .where((element) => element.id == productId)
                    .toList();
                ProductModel productDetails = productsData[0];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              productDetails.category.toString().toUpperCase(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: ColorConstants.black,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          productDetails.title.toString(),
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: ColorConstants.black,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 25),
                          child: Text(
                            productDetails.description.toString(),
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: ColorConstants.descriptionColor),
                          ),
                        ),
                        Text(
                          "\$${productDetails.price.toString()}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: ColorConstants.black,
                          ),
                        ),
                        RatingBox(
                          rating: productDetails.rating!.rate.toString(),
                          number: productDetails.rating!.count.toString(),
                        ),
                        Image.network(productDetails.image.toString())
                      ],
                    ),
                  ),
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
    );
  }
}
