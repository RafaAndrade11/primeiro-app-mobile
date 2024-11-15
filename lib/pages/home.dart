import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeiroapp/controllers/counter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Controller>();
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("counter"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'clicks: ${controller.count}',
                  style: const TextStyle(fontSize: 24),
                )),
            ElevatedButton(
              child: const Text('Next Route'),
              onPressed: () {
                Get.toNamed('/second');
              },
            ),
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

