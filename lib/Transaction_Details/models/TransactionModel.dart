class TransactionModel {
  String name;
  double limit;
  Frequency frequency;
  TransactionType transactionType;


  TransactionModel({this.name,this.frequency,this.limit,this.transactionType});
}

enum Frequency{
  monthly,
  adHoc,
}

enum TransactionType{
  fixed,
  flexible,
}