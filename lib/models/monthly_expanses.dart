import 'dart:convert';

class MonthlyExpanses {
  final String id;
  final String title;
  final double amount;
  final int dueDate;

  MonthlyExpanses({required this.id, required this.title, required this.amount, required this.dueDate});

  factory MonthlyExpanses.fromJson(Map<String, dynamic> json) {
    return MonthlyExpanses(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      dueDate: json['dueDate'],
    );
  }

  factory MonthlyExpanses.fromJsonString(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return MonthlyExpanses(
      id: jsonMap['id'],
      title: jsonMap['title'],
      amount: jsonMap['amount'],
      dueDate: jsonMap['dueDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'id': id,
      'title': title,
      'amount': amount,
      'dueDate': dueDate,
    };
  }

  	String toJsonString() {
      return '{"id": "$id", "title": "$title", "amount": "$amount", "dueDate": "$dueDate"}';
    }
}