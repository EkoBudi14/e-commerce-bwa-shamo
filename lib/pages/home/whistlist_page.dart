import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/whistlist_provider.dart';
import 'package:shamo/widget/whistlist_card.dart';

import '../../theme.dart';

class WhistlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          "Favorite Shoes",
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon_love.png",
                width: 74,
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                "You don\'t have dream shoes ?",
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Let\'s find your favorite shoes",
                style: secondaryTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 24,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Explore Store",
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: wishlistProvider.wishlist
                .map((product) => WhistlistCard(product))
                .toList(),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Column(
        children: [
          header(),
          // emptyWishlist(),
          wishlistProvider.wishlist.length == 0 ? emptyWishlist() : content(),
        ],
      ),
    );
  }
}
