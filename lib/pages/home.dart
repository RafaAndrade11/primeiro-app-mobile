import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeiroapp/controllers/counter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Controller>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.menu),
        onPressed: () {
          //Ação ao pressionar o ícone de menu
        },
        ),
        title: const Center(child: Text("App", textAlign: TextAlign.center)),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.account_circle),
          onPressed: () {
            Get.toNamed('/profile');
          },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'clicks: ${controller.count}',
                  style: const TextStyle(fontSize: 24),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

