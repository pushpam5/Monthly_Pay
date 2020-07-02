import 'package:flutter/material.dart';

import 'package:monthly_pay_admin/Transaction_Details/models/TransactionModel.dart';

class OrderDetails extends StatefulWidget {
  final TransactionModel transactionModel;
  final List<TransactionModel> transactions;

  OrderDetails({this.transactionModel, this.transactions});
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails>
    with SingleTickerProviderStateMixin {
  Animation animationForOrderDetials;
  AnimationController animationController;

  List<DropdownMenuItem> get dropDownTransactions {
    return List.generate(
      widget.transactions.length,
      (index) => DropdownMenuItem(
        child: Text(
          widget.transactions[index].name,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        value: widget.transactions[index],
      ),
    );
  }

  var currentTransaction;

  @override
  void initState() {
    super.initState();
    currentTransaction = widget.transactionModel;
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

  String getFrequency(Frequency frequency) {
    if (frequency == Frequency.adHoc) {
      return 'Ad-Hoc';
    } else if (frequency == Frequency.monthly) {
      return 'Monthly';
    } else {
      return null;
    }
  }

  String getTransactionType(TransactionType transactionType) {
    if (transactionType == TransactionType.fixed) {
      return 'Fixed';
    } else if (transactionType == TransactionType.flexible) {
      return 'Flexible';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    TransactionModel _transaction = widget.transactionModel;
    final _heightOfScreen = MediaQuery.of(context).size.height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final _widthOfScreen = MediaQuery.of(context).size.width;

    var _theme = Theme.of(context);

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
                Positioned(
                  left: _widthOfScreen * (0.17 / 2),
                                  child: Container(
                    width: _widthOfScreen * 0.83,
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0, 0),
                        child: Container(
                          alignment: Alignment.center,
                          // width: _widthOfScreen * 0.5,
                          margin: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isDense: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                              items: dropDownTransactions,
                              value: currentTransaction,
                              onChanged: (val) {
                                setState(() {
                                  currentTransaction = val;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
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
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'Limit: ${currentTransaction.limit.toString()}',
                                  style: _theme.textTheme.headline6,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'Frequency: ${getFrequency(currentTransaction.frequency)}',
                                  style: _theme.textTheme.headline6,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'End Date: ',
                                  style: _theme.textTheme.headline6,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Text(
                                        'Transaction Date:',
                                        style: _theme.textTheme.headline6,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Text(
                                        'From Date: dd/mm/yyyy',
                                        style: _theme.textTheme.headline6,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Text(
                                        'To Date: dd/mm/yyyy',
                                        style: _theme.textTheme.headline6,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'Transaction Type: ${getTransactionType(currentTransaction.transactionType)}',
                                  style: _theme.textTheme.headline6,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'Bank:',
                                  style: _theme.textTheme.headline6,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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
