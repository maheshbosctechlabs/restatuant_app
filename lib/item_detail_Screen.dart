import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodorderapp/common/colors.dart';
import 'package:foodorderapp/custom_widgets/add_to_cart_widget.dart';
import 'package:foodorderapp/custom_widgets/category_widget.dart';
import 'package:foodorderapp/custom_widgets/ingredients_widget.dart';
import 'package:foodorderapp/my_order_Screen.dart';
import 'package:google_fonts/google_fonts.dart';

/* 
Title: ItemDetailScreen,
Purpose:ItemDetailScreen,
Required Widget:CategoryWidget,IngredientsWidget,AddToCartWidget
Created Date:10 July 2020,
Created By:https://flutteragency.com/
*/

class ItemDetailScreen extends StatelessWidget {
  final ingredientArray = [
    "assets/images/beer.png",
    "assets/images/beerbottle.png",
    "assets/images/cherry.png",
    "assets/images/bananas.png",
    "assets/images/pineapple.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kBackGroundColor,
    ));

    return Scaffold(
      backgroundColor: kBackGroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 15,
        ),
        child: AddToCartWidget(
          amount: "10,75",
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MyOrderScreen(),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                .1,
                1,
              ],
              colors: [
                kBackGroundColor,
                kBackGroundColor,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: height * .45,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              "assets/images/watermelonmojito.jpg",
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(18.0),
                            bottomRight: Radius.circular(18.0),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 35,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop(false);
                            },
                            child: CategoryWidget(
                              catImg: "assets/images/back.png",
                              backColor: kWhiteColor,
                              height: 40,
                              width: 40,
                              iconHeight: 15,
                            ),
                          ),
                          CategoryWidget(
                            catImg: "assets/images/share.png",
                            backColor: kWhiteColor,
                            height: 40,
                            width: 40,
                            iconHeight: 15,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Sex on the Beach",
                        style: GoogleFonts.faustina(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Ingredients:",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: height * .12,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: false,
                          itemCount: ingredientArray.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 3,
                              ),
                              child: Container(
                                height: height * .10,
                                width: width * .20,
                                child: IngredientsWidget(
                                  ingredientImg: ingredientArray[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Description:",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "The cocktail is very refreshing and very easy to drink thanks to pineapple juice,which is also part of it.",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
