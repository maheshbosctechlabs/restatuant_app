import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodorderapp/common/colors.dart';
import 'package:foodorderapp/custom_widgets/category_widget.dart';
import 'package:foodorderapp/custom_widgets/item_widget.dart';
import 'package:foodorderapp/custom_widgets/recommanded_item_widget.dart';
import 'package:foodorderapp/item_detail_Screen.dart';
import 'package:google_fonts/google_fonts.dart';

/* 
Title: ItemScreen,
Purpose:ItemScreen,
Required Widget:CategoryWidget,IngredientsWidget,AddToCartWidget
Created Date:10 July 2020,
Created By:https://flutteragency.com/
*/

class ItemScreen extends StatefulWidget {
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final itemArray = [
    "assets/images/sale.png",
    "assets/images/wine.png",
    "assets/images/pizza.png",
    "assets/images/cannedfood.png",
    "assets/images/burger.png",
    "assets/images/fastfood.png",
    "assets/images/icecream.png",
  ];
  final recommendedImgArray = [
    "assets/images/chokoshake.jpg",
    "assets/images/shake.jpg",
    "assets/images/watermelonmojito.jpg",
  ];
  final recommendedNameArray = [
    "Watermelon Mojitto",
    "Pink Negroni",
    "Sex on the Beach",
  ];
  final recommendedAmountArray = [
    "8,55",
    "10,95",
    "10,75",
  ];
  final recommendedDescriptionArray = [
    "White rum,sparkling water...",
    "Very Delicious",
    "Very Yummy",
  ];
  var selectCategory = 1;
  @override
  Widget build(BuildContext context) {
    double width, height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kBackGroundColor,
    ));

    return Scaffold(
      backgroundColor: kBackGroundColor,
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
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "What would you\n",
                          style: GoogleFonts.faustina(
                            color: kBlackColor,
                            fontSize: 26,
                          ),
                        ),
                        TextSpan(
                          text: "like ",
                          style: GoogleFonts.faustina(
                            color: kBlackColor,
                            fontSize: 26,
                          ),
                        ),
                        TextSpan(
                          text: 'to order?',
                          style: GoogleFonts.faustina(
                            color: kBlackColor,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: false,
                      itemCount: itemArray.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 5,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectCategory = index;
                              });
                            },
                            child: CategoryWidget(
                              catImg: itemArray[index],
                              backColor: selectCategory == index
                                  ? kCategorypinkColor
                                  : kCategoryBackColor,
                              imgColor: selectCategory == index
                                  ? kWhiteColor
                                  : kBlackColor,
                              height: 50,
                              width: 50,
                              iconHeight: 20,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {},
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "Sour",
                                style: GoogleFonts.faustina(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    "Fresh",
                                    style: GoogleFonts.faustina(
                                      fontSize: 15,
                                      color: kBlackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5 / 2),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "Sweet",
                                style: GoogleFonts.faustina(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ItemDetailScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: height * 0.5,
                            child: ListView.builder(
                              addRepaintBoundaries: false,
                              padding: const EdgeInsets.only(top: 50),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: recommendedImgArray.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: ItemWidget(
                                    itemImg: recommendedImgArray[index],
                                    itemName: recommendedNameArray[index],
                                    itemDescription:
                                        recommendedDescriptionArray[index],
                                    itemAmount: recommendedAmountArray[index],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Recommended",
                    style: GoogleFonts.faustina(
                      color: kBlackColor,
                      fontSize: 22,
                    ),
                  ),
                  Container(
                    height: height * 0.15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: false,
                      itemCount: recommendedNameArray.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Container(
                            width: width * 0.7,
                            height: height * 0.7,
                            child: RecommandedItemWidget(
                              itemName: recommendedNameArray[index],
                              itemImg: recommendedImgArray[index],
                              itemAmount: recommendedAmountArray[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
