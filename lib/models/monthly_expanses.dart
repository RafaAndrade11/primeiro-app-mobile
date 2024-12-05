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

  Map<String, dynamic> toJson() {
    return{
      'id': id,
      'title': title,
      'amount': amount,
      'dueDate': dueDate,
    };
  }

}