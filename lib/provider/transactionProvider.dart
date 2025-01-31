import 'package:account/model/transaction.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier{
  List<Transaction> transactions = [
    Transaction(title: 'หนังสือ', amount : 300 ,date:DateTime.now() ),
    Transaction(title: 'เสื้อยืด', amount : 200,date:DateTime.now() ),
    Transaction(title: 'รองเท้า', amount : 359,date:DateTime.now() ),
    Transaction(title: 'กระเป๋า', amount : 150,date:DateTime.now() ),
    Transaction(title: 'แผ่นเกมส์', amount : 1500,date:DateTime.now() ),
    Transaction(title: 'KFC', amount : 299,date:DateTime.now() ),

  ];

  List<Transaction> getTransaction(){
    return transactions;
  }

  void addTransaction(Transaction transaction){
    transactions.add(transaction);
  }
}