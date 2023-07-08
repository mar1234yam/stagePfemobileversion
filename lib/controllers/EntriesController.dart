import 'package:get/get.dart';

import '../widgets/CommandRow.dart';

class EntriesController extends GetxController {
  final RxList<Map<String, String>> rowData = <Map<String, String>>[].obs;

  // Function to add a new row
  void addCommandRow() {
    rowData.add({
      'article': '',
      'quantity': '',
    });
    int index = commandRows.length;
    commandRows.add(CommandRow(index: index));
    update();
  }

  final commandRows = <CommandRow>[].obs;
  final selectedRow = RxInt(-1);

  void removeCommandRow(int index) {
    commandRows.removeAt(index);
    update();
  }

  void selectRow(int index) {
    selectedRow.value = index;
  }

  bool isRowSelected(int index) {
    return selectedRow.value == index;
  }

  void updateRowValue(int index, String field, String? value) {
    rowData[index][field] =
        value ?? ''; // Use an empty string if the value is null
    update();
  }
}