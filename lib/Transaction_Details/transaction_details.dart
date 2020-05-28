import 'package:flutter/material.dart';

import 'package:monthly_pay_admin/Common_Widgets/bottomNavigationBar.dart';
import 'package:monthly_pay_admin/Common_Widgets/curve_painter.dart';
import 'package:monthly_pay_admin/Common_Widgets/date_select.dart';
import 'package:monthly_pay_admin/Customer_Dashboard/CustomerDashboard.dart';
import 'package:monthly_pay_admin/Transaction_Details/Order_Details/order_details.dart';
import 'package:monthly_pay_admin/Transaction_Details/models/TransactionModel.dart';
import 'package:monthly_pay_admin/Transaction_Details/widgets/bounce.dart';
import 'package:monthly_pay_admin/Transaction_Details/widgets/paidT.dart';
import 'package:monthly_pay_admin/Transaction_Details/widgets/pending.dart';

class TransactionDetails extends StatefulWidget {
  final TransactionModel transactionModel;

  TransactionDetails({this.transactionModel});

  @override
  _TransactionDetailsState createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails>
    with SingleTickerProviderStateMixin {
  void _fadeTransitionWithPush(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(
          milliseconds: 600,
        ),
        pageBuilder: (context, animation, secondaryAnimation) {
          return widget;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  //Animation Fast in Slow out
  Animation animationForPaid;
  Animation animationForPending;
  Animation animationForBounce;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animationForPaid = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animationForPending = Tween(begin: 2.5, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animationForBounce = Tween(begin: 3.5, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animationController.forward();
  }

  int _currentTab = 1;
  

  Future<bool> _backPressed(){
    return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CustomerDashboard()));
  }


  @override
  Widget build(BuildContext context) {
    TransactionModel _transaction = widget.transactionModel;

    AppBar _appBar = AppBar(
      elevation: 0.0,
      title: Text('Transaction Details'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            _fadeTransitionWithPush(
                context,
                OrderDetails(
                  transactionModel: _transaction,
                ));
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              'Order Details',
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: Colors.blue[900],
                    fontSize: 15,
                  ),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20)),
          ),
        )
      ],
    );

    final _heightOfScreen = MediaQuery.of(context).size.height * 0.93 -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final _widthOfScreen = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return WillPopScope(
            onWillPop: _backPressed,
                      child: Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                bottomNavigationBar: NavigationBar(
                  currentTab: _currentTab,
                ),
                appBar: _appBar,
                body: CustomPaint(
                  painter: CurvePainter(),
                  child: Container(
                    height: _heightOfScreen,
                    child: Column(
                      children: <Widget>[
            Container(
              width: _widthOfScreen,
              height: _heightOfScreen * 0.07,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      width: _widthOfScreen * 0.83,
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0.0,8.0,0,0),
                          child: Text(
                            _transaction.name,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                  color: Colors.white,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 3,
                    child: IconButton(
                      icon: FittedBox(
                        child: Icon(Icons.share, size: 30),
                      ),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: _heightOfScreen * 0.2,
              child: DateSelect(),
            ),
            Container(
              height: _heightOfScreen * 0.73,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Transform(
                      transform: Matrix4.translationValues(
                        _widthOfScreen * animationForPaid.value,
                        0,
                        0,
                      ),
                      child: Container(
                        height: (_heightOfScreen * 0.75) / 2.2,
                        child: PaidTr(),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                        _widthOfScreen * animationForPending.value,
                        0,
                        0,
                      ),
                      child: Container(
                        height: (_heightOfScreen * 0.75) / 2.2,
                        child: PendingTr(),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                        _widthOfScreen * animationForBounce.value,
                        0,
                        0,
                      ),
                      child: Container(
                        height: (_heightOfScreen * 0.75) / 2.2,
                        child: BounceTr(),
                      ),
                    ),
                  ],
                ),
              ),
            )
                      ],
                    ),
                  ),
                ),
              ),
          );
        });
  }
}
