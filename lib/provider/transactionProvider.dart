import 'package:account/model/transaction.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier{
  List<Transaction> transactions = [
    Transaction(title: 'หนังสือ', amount: 100),
    Transaction(title: 'กางเกงยีน', amount: 450),
    Transaction(title: 'เสื้อ', amount: 150),
    Transaction(title: 'เดรส', amount: 550),
    Transaction(title: 'กระเป๋า', amount: 200),
    Transaction(title: 'KFC', amount: 299),
  ];

  List<Transaction> getTransaction() {
    return transactions;
  }
  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

}