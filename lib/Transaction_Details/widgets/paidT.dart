import 'package:flutter/material.dart';

class PaidTr extends StatefulWidget {
  @override
  _PaidTrState createState() => _PaidTrState();
}

class _PaidTrState extends State<PaidTr> {
  @override
  Widget build(BuildContext context) {

    TextStyle subHeadings = Theme.of(context).textTheme.subtitle1;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black45, blurRadius: 15, offset: Offset(0, 10)),
        ],
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).accentColor,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'Paid',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Date',
                style: subHeadings,
              ),
              Text(
                'Invoice',
                style: subHeadings,
              ),
              Text(
                'Amount',
                style: subHeadings,
              ),
            ],
          )
        ],
      ),
    );
  }
}
