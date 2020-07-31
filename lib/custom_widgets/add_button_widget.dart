import 'package:flutter/material.dart';
import 'package:foodorderapp/common/colors.dart';

/* 
Title: AddButtonWidget,
Purpose:AddButtonWidget,
Required Parameter: N/A,
Created Date:10 July 2020,
Created By:https://flutteragency.com/
*/

class AddButtonWidget extends StatelessWidget {
  AddButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Color(0xFF76D1B2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Icon(
        Icons.add,
        color: kWhiteColor,
        size: 20,
      ),
    );
  }
}
