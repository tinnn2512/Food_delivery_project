import 'package:flutter/material.dart';

class MyDecriptionBox extends StatefulWidget {
  const MyDecriptionBox({super.key});

  @override
  State<MyDecriptionBox> createState() => _MyDecriptionBoxState();
}

class _MyDecriptionBoxState extends State<MyDecriptionBox> {
  @override
  Widget build(BuildContext context) {
    // textstyle
    var myPrimaryTextStyle = TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary
    );
    var mySecondaryTextStyle = TextStyle(
        color: Theme.of(context).colorScheme.primary
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8), // Corrected here
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // deliver fee
          Column(
            children: [
              Text(
                '25.000đ',
                style: myPrimaryTextStyle,
              ),
              Text(
                'Deliver fee',
                style: mySecondaryTextStyle,
              ),
            ],
          ),

          // deliver time
          Column(
            children: [
              Text(
                '15-30 min',
                style: myPrimaryTextStyle,
              ),
              Text(
                'Deliver time',
                style: mySecondaryTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
