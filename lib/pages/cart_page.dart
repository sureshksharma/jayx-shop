import 'package:codepur_catalog_app_30days/core/store.dart';
import 'package:codepur_catalog_app_30days/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 'Cart'.text.make(),
      ),
      backgroundColor: context.canvasColor,
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //We can use VxBuilder only also here
          VxConsumer(
            notifications: const {},
            mutations: const {RemoveMutation},
            builder: (context, store, _) {
              return '\$ ${_cart.totalPrice}'
                  .text
                  .xl5
                  .color(context.theme.primaryColor)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: 'Buying not supported yet.'.text.make(),
                ),
              );
            },
            child: 'Buy'.text.white.make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.remove_shopping_cart_outlined,
                  size: 200.0,
                ).py32(),
                'Cart is Empty.'.text.xl3.makeCentered(),
              ],
            ),
          )
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.done),
                trailing: IconButton(
                  onPressed: () {
                    RemoveMutation(_cart.items[index]);
                    // setState(() {});
                  },
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                title: _cart.items[index].name.text.make(),
              );
            },
          );
  }
}
