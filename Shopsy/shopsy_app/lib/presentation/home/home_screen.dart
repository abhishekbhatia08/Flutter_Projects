import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsy_app/components/product_card.dart';
import 'package:shopsy_app/presentation/cart/utils/cart_count_stream.dart';
import 'package:shopsy_app/presentation/home/bloc/product_list_cubit.dart';
import 'package:shopsy_app/routes/app_router.dart';
import 'package:shopsy_app/theme/app_colors.dart';
import 'package:shopsy_app/theme/app_text_styles.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductListCubit(),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        appBar: AppBar(
          title: Text('Shopsy', style: AppTextStyles.appBarHeading()),
          elevation: 0,
          backgroundColor: AppColors.scaffold,
          scrolledUnderElevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: StreamBuilder<int>(
                stream: CartStreamService().itemsCountStream,
                initialData: 0,
                builder: (context, snapshot) {
                  int count = snapshot.data ?? 0;
                  return Badge(
                    backgroundColor: Colors.red,
                    offset: Offset(-4, -4),
                    isLabelVisible: count > 0,
                    label: Text(
                      count.toString(),
                      style: const TextStyle(color: AppColors.white),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart_outlined),
                      onPressed: () => context.pushRoute(CartRoute()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<ProductListCubit, ProductListState>(
            builder: (context, state) {
              // Use state.when for clean and safe state handling
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (products) => GridView.builder(
                  padding: const EdgeInsets.all(12.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      product: product,
                      onTap: () => context.pushRoute(
                        ProductDetailRoute(product: product),
                      ),
                    );
                  },
                ),
                error: (message) => Center(child: Text(message)),
              );
            },
          ),
        ),
      ),
    );
  }
}
