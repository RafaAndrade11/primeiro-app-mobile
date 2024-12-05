import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:primeiroapp/controllers/user.dart';
import 'package:primeiroapp/models/monthly_expanses.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<MonthlyExpanses> monthly_expanses = [];

  @override
  void initState() {
    super.initState();
  }

  void showAddAcountDialog(BuildContext context) {
    final TextEditingController accountNameController = TextEditingController();
    final TextEditingController dueDateController = TextEditingController();
    final TextEditingController amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Conta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: accountNameController,
                decoration: const InputDecoration(labelText: 'Nome da Conta'),
              ),
              TextField(
                controller: dueDateController,
                decoration: const InputDecoration(labelText: 'Dia do Vencimento'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2)
                ],
              ),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+.?\d{0,2}')),
                ]
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
               Get.back();
              },
            ),
            TextButton(
              child: const Text('Salvar'),
              onPressed: () {
                String accountName = accountNameController.text;
                int? dueDate = int.tryParse(dueDateController.text);
                double? amount = double.tryParse(amountController.text);

                if(dueDate != null &&
                  dueDate >= 1 &&
                  dueDate <= 31 &&
                  amount != null &&
                  accountName.isNotEmpty) {
                    monthly_expanses.add(MonthlyExpanses(id: '${DateTime.now().toString()}-$accountName',
                     title: accountName,
                      amount: amount,
                       dueDate: dueDate));
                  }

                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.account_circle, size: 40,),
          onPressed: () {
            Get.toNamed('/profile');
          },
          ),
title: const Center(child: Text("Minhas Despesas", textAlign: TextAlign.center)),
        actions: <Widget>[
           IconButton(icon: const Icon(Icons.add, size: 40,),
        onPressed: () {
          showAddAcountDialog(context);
        },
        ),
        ],
      ),
      body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (monthly_expanses.isEmpty) 
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Nenhuma despesa cadastrada!',
                  style: TextStyle(fontSize: 18),
                ),
              )
            else 
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: monthly_expanses.length,
                itemBuilder: (BuildContext context, int index) {
                  final expense = monthly_expanses[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    child: ListTile(
                      title: Text(expense.title),
                      subtitle: Text(
                        'Vencimento: ${expense.dueDate} - Valor: R\$ ${expense.amount.toStringAsFixed(2)}',
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    ),
  );
  }  
}