import 'package:flutter/material.dart';

class CartBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      height: 250,
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        color: Color(0xFF4C54A5),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$250",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
