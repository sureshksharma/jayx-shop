import 'dart:convert';
import 'package:codepur_catalog_app_30days/core/store.dart';
import 'package:codepur_catalog_app_30days/models/cart.dart';
import 'package:codepur_catalog_app_30days/models/catalog.dart';
import 'package:codepur_catalog_app_30days/utils/routes.dart';
import 'package:codepur_catalog_app_30days/widgets/home_widgets/catalog_header.dart';
import 'package:codepur_catalog_app_30days/widgets/home_widgets/catalog_list.dart';
import 'package:codepur_catalog_app_30days/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = 'https://api.jsonbin.io/b/621d1c6e06182767436986de';
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    // final catalogJson =
    //     await rootBundle.loadString('assets/files/catalog.json');
    final response = await http.get(Uri.parse(url), headers: {
      'secret-key':
          '\$2b\$10\$mi5vB/ltVeb4mXNXrGcuS.sAWngUVx7T7mN9v/hyXG9ZUKbFcFy2e'
    });
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData['products'];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, store, status) {
          return FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartRoute);
            },
            backgroundColor: MyTheme.darkBluishColor,
            child: const Icon(CupertinoIcons.cart),
          ).badge(
              color: Vx.red500,
              size: 22.0,
              count: _cart.items.length,
              textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ));
        },
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                const CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }
}
