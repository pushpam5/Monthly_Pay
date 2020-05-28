import 'package:flutter/material.dart';
import 'package:monthly_pay_admin/Customer_Dashboard/models/orders_model.dart';

class ActiveOrder extends StatefulWidget {
  @override
  _ActiveOrderState createState() => _ActiveOrderState();
}

class _ActiveOrderState extends State<ActiveOrder> {
  List<ActiveOrderModel> activeOrders = [
    ActiveOrderModel(name: 'Ram Dudh Bhandar', occupation: 'Milk Man'),
    ActiveOrderModel(name: 'Malvi News Agency', occupation: 'News Paper'),
    ActiveOrderModel(name: 'Malvi News Agency', occupation: 'News Paper'),
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Card(
        elevation: 12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: constraints.maxHeight * 0.02,
            ),
            Center(
              child: Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                  child: Text(
                    'Active Order',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.03,
            ),
            Container(
              height: constraints.maxHeight * 0.74,
              child: SingleChildScrollView(
                child: Column(
                  children: activeOrders.map((order) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            order.name,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            order.occupation,
                            style:
                                Theme.of(context).textTheme.subtitle2,
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.03,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.01,)
          ],
        ),
      );
    });
  }
}
