import 'package:flutter/material.dart';
import 'package:monthly_pay_admin/Ledger_Details/models/LedgerModel.dart';

class LedgerList extends StatefulWidget {
  @override
  _LedgerListState createState() => _LedgerListState();
}

class _LedgerListState extends State<LedgerList> {
  List<LedgerModel> ledgerModels = [
    LedgerModel(
        name: 'Ram Dudh Bhandar',
        occupation: 'Milk Man',
        amount: 200,
        status: 'P'),
    LedgerModel(
        name: 'Dainik Bhaskar',
        occupation: 'Newspaper',
        amount: 200,
        status: 'P'),
    LedgerModel(
        name: 'Avantika Gas',
        occupation: 'Gas Pipe Line',
        amount: 500,
        status: 'S'),
    LedgerModel(
        name: 'N.D.P.S', occupation: 'School', amount: 5000, status: 'B'),
    LedgerModel(
        name: 'N.D.P.S', occupation: 'School', amount: 5000, status: 'B'),
    LedgerModel(
        name: 'N.D.P.S', occupation: 'School', amount: 5000, status: 'B'),
    LedgerModel(
        name: 'N.D.P.S', occupation: 'School', amount: 5000, status: 'B'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0.0,6.0,0.0,6.0),
          child: Card(
            elevation: 12,
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  ledgerModels[index].status,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontSize: 35),
                ),
              ),
              title: Text(
                ledgerModels[index].name,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              subtitle: Text(
                ledgerModels[index].occupation,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              trailing: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Center(
                  child: FittedBox(
                                    child: Text(
                      "₹ ${ledgerModels[index].amount}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: ledgerModels.length,
    );
  }
}
