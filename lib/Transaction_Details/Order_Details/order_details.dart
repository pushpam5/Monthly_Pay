import 'package:flutter/material.dart';

import 'package:monthly_pay_admin/Transaction_Details/models/TransactionModel.dart';

class OrderDetails extends StatefulWidget {
  final TransactionModel transactionModel;

  OrderDetails({this.transactionModel});
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails>
    with SingleTickerProviderStateMixin {
  Animation animationForOrderDetials;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animationForOrderDetials = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animationController.forward();
  }

  AppBar _appBar = AppBar(
    elevation: 0.0,
    title: Text('Order Details'),
  );

  @override
  Widget build(BuildContext context) {
    TransactionModel _transaction = widget.transactionModel;
    final _heightOfScreen = MediaQuery.of(context).size.height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final _widthOfScreen = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Scaffold(
          appBar: _appBar,
          body: Container(
            color: Colors.white,
            height: _heightOfScreen,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Theme.of(context).primaryColor,
                  height: _heightOfScreen / 4,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  width: _widthOfScreen,
                  child: Text(
                    _transaction.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white, fontSize: 35),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  height: _heightOfScreen * 0.8,
                  width: _widthOfScreen * 0.96,
                  top: _heightOfScreen * 0.15,
                  left: _widthOfScreen * 0.02,
                  child: Transform(
                    transform: Matrix4.translationValues(
                      _widthOfScreen * animationForOrderDetials.value,
                      0,
                      0,
                    ),
                    child: Card(
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(child: Text('')),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
