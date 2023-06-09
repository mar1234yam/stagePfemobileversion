import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/views/navigation_drawer.dart';
import 'package:get/get.dart';
import '../../controllers/EntriesController.dart';
import '../../controllers/ExitsController.dart';
import '../../widgets/ExitCommandList.dart';
import '../../widgets/NewCommand.dart';
import '../navigation_drawer.dart';

class Exits extends GetView<ExitsController> {
  final BottomNavigationBar bottomNavigationBar;
  const Exits({Key? key, required this.bottomNavigationBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ExitsController controller = Get.put(ExitsController());
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Exits'),
        backgroundColor: Colors.blue.shade700,
      ),
      bottomNavigationBar: bottomNavigationBar,
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: controller.commands.length,
                  itemBuilder: (context, index) {
                    final command = controller.commands[index];
                    //print('Command at index $index: $command');
                    return CommandCard(
                      commandReference: command['code'],
                      dateOfCreation: command['created_at'],
                      articlesCount: command['articles_count'],
                      userName: command['user_name'],
                      price: command['price'],
                      status: command['status'],
                      client: command['client_name'],
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Material(
                color: Colors.transparent,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => AddCommandModal(),
                    );
                  },
                  backgroundColor: Colors.blue,
                  icon: const Icon(Icons.add),
                  label: const Text('Create Command'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
