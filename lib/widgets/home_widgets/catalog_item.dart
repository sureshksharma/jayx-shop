import 'package:codepur_catalog_app_30days/models/catalog.dart';
import 'package:codepur_catalog_app_30days/widgets/home_widgets/add_to_cart.dart';
import 'package:codepur_catalog_app_30days/widgets/home_widgets/catalog_image.dart';
import 'package:codepur_catalog_app_30days/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var innerItems = [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(image: catalog.image),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
            catalog.desc.text.make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                '\$ ${catalog.price}'.text.xl.bold.make(),
                AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 8.0),
          ],
        ),
      ),
    ];
    return VxBox(
      child: context.isMobile
          ? Row(
              children: innerItems,
            )
          : Column(
              children: innerItems,
            ),
    ).white.rounded.square(150).make().py16();
  }
}
