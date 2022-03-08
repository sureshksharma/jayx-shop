import 'package:codepur_catalog_app_30days/core/store.dart';
import 'package:codepur_catalog_app_30days/models/cart.dart';
import 'package:codepur_catalog_app_30days/models/catalog.dart';
import 'package:codepur_catalog_app_30days/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ? true : false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
          // setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          MyTheme.darkBluishColor,
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
