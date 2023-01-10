import 'package:flutter/material.dart';

class CartBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 70,
      child: Row(
        children: [
          Row(
            children: [
              Text(
                "Total",
              )
            ],
          )
        ],
      ),
    ));
  }
}
