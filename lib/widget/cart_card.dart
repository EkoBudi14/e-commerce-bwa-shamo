import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/carts_model.dart';
import 'package:shamo/providers/carts_provider.dart';
import 'package:shamo/theme.dart';

class CartCard extends StatelessWidget {
  final CartsModel carts;
  CartCard({this.carts});
  @override
  Widget build(BuildContext context) {
    CartsProvider cartProvider = Provider.of<CartsProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgorundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      carts.product.galleries[0].url,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carts.product.name,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      "\$${carts.product.price}",
                      style: priceTextStyle,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(carts.id);
                    },
                    child: Image.asset(
                      "assets/btn_plus.png",
                      width: 16,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    carts.quantity.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(carts.id);
                    },
                    child: Image.asset(
                      "assets/btn_min.png",
                      width: 16,
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCarts(carts.id);
            },
            child: Row(
              children: [
                Image.asset(
                  "assets/icon_trash.png",
                  width: 10,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Remove",
                  style: alertTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
