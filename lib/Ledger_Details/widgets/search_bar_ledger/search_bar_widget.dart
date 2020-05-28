import 'package:flutter/material.dart';

import 'search_bar.dart';

class SearchBarLeger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => SearchUserBar(),
          ),
        ),
        child: Row(
          children: <Widget>[
            FittedBox(
              child: Icon(
                Icons.search,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(child: Text('')),
            Expanded(
              child: FittedBox(
                child: Text(
                  'Search Here !',
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(child: Text('')),
          ],
        ),
      ),
    );
  }
}
