import 'package:flutter/material.dart';
import 'package:flutterecomapp/model/app_data.dart';
import 'package:flutterecomapp/ui/product_card.dart';

class Verticlelistview extends StatelessWidget{

  double width, height;
  Verticlelistview({@required this.width, @required this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.only(bottom: 10,),
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 0),
            width: width,
            height: height,
            child: Scrollbar(
              child: ListView(
                padding: EdgeInsets.only(left: 20),
                scrollDirection: Axis.vertical,
                children: AppData.productList
                    .map(
                      (product) => ListProductCard(
                    product: product,
                  ),
                )
                    .toList(),
              ),
            )
        ));
  }

}