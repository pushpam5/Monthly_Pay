import 'package:flutter/material.dart';

class AppBarIcons extends StatelessWidget {
  final Color nonSelected = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headline5,
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 30,
                  color: nonSelected,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
