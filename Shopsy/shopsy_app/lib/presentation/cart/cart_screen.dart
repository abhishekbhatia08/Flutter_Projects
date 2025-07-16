import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shopsy_app/presentation/cart/bloc/cart_cubit.dart';
import 'package:shopsy_app/theme/app_colors.dart';
import 'package:shopsy_app/theme/app_text_styles.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(locale: 'en_US', symbol: '\$');

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.scaffold,
        scrolledUnderElevation: 0,
        title: Text('My Cart', style: AppTextStyles.appBarHeading()),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.remove_shopping_cart_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 20),
                  Text('Your cart is empty', style: TextStyle(fontSize: 20, color: Colors.grey)),
                ],
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            item.product.imageUrl,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                                color: AppColors.white,
                                width: 60,
                                height: 60,child: const Icon(Icons.image_not_supported, size: 40)),
                          ),
                        ),
                        title: Text(item.product.name),
                        subtitle: Text('${item.quantity} x ${currencyFormatter.format(item.product.price)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                context.read<CartCubit>().decreaseQuantity(item);
                              },
                            ),
                            Text(item.quantity.toString(), style: const TextStyle(fontSize: 16)),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                context.read<CartCubit>().increaseQuantity(item);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              _CartTotal(),
            ],
          );
        },
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(locale: 'en_US', symbol: '\$');

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal', style: Theme.of(context).textTheme.titleMedium),
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      return Text(
                          currencyFormatter.format(state.totalPrice),
                          style: Theme.of(context).textTheme.titleLarge
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Checkout functionality not implemented.')),
                  );
                },
                child: const Text('Proceed to Checkout'),
              ),
            )
          ],
        ),
      ),
    );
  }
}