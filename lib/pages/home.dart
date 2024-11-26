import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:primeiroapp/controllers/user.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Salvar'),
              onPressed: () {
                String accountName = accountNameController.text;
                String dueDate = dueDateController.text;
                String amount = amountController.text;

                // Aqui você pode adicionar a lógica para salvar os dados
                print('Conta: $accountName, Vencimento: $dueDate, Valor: $amount');

                Navigator.of(context).pop();
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Obx(() => Text(
                  'clicks: ${UserController.count}',
                  style: const TextStyle(fontSize: 24),
                )),
          ],
        ),
      ),
    );
  }
}

