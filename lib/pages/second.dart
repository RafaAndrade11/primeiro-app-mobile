import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeiroapp/controllers/counter.dart';

class Second extends StatelessWidget {
  const Second({super.key});
  @override
  Widget build(context) {
    final Controller ctrl = Get.find();
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Second Page"))),
      body: Center(child: Text("${ctrl.count}")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {
          Get.snackbar('Você clicou', '${ctrl.count} vezes')
        },
      )
      );
  }
}