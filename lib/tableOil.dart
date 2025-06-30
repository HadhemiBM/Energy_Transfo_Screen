// Oilapp

import 'package:flutter/material.dart';

class MachineTable extends StatefulWidget {
  const MachineTable({super.key});

  @override
  State<MachineTable> createState() => _MachineTableState();
}

class _MachineTableState extends State<MachineTable> {
  final ScrollController horizontalController = ScrollController();
  final ScrollController verticalController = ScrollController();

  String selectedFilter = 'Aucun';
  final List<String> filterTypes = ['Aucun', 'Transfo', 'Département', 'Date'];
  String filterValue = '';

  final List<List<String>> machineData = [
    [
      'TR-NS-001',
      'SN-45872391',
      'T-2',
      '12/05/2021',
      'info',
      '** KVA',
      '** A',
      '** V',
      '021245',
    ],
    [
      'TR-NS-001',
      'SN-45872391',
      'T-1',
      '12/03/2021',
      'tech',
      '** KVA',
      '** A',
      '** V',
      '021245',
    ],
    [
      'TR-NS-001',
      'SN-45872391',
      'T-1',
      '12/03/2021',
      '**********',
      '** KVA',
      '** A',
      '** V',
      '021245',
    ],
  ];

  List<List<String>> get filteredMachines {
    if (selectedFilter == 'Aucun' || filterValue.isEmpty) return machineData;
    int index =
        selectedFilter == 'Transfo'
            ? 2
            : selectedFilter == 'Département'
            ? 4
            : selectedFilter == 'Date'
            ? 3
            : -1;
    return machineData
        .where((row) => row[index].contains(filterValue))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double minTableWidth = screenWidth < 900 ? 1000 : 2000;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Liste des Machines",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),

          // 🔍 Filter Row
          Row(
            children: [
              DropdownButton<String>(
                value: selectedFilter,
                items:
                    filterTypes
                        .map(
                          (filter) => DropdownMenuItem(
                            value: filter,
                            child: Text(filter),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedFilter = value!;
                    filterValue = '';
                  });
                },
              ),
              const SizedBox(width: 16),
              if (selectedFilter != 'Aucun')
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Entrez une valeur pour filtrer',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (val) {
                      setState(() {
                        filterValue = val;
                      });
                    },
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),

          /// ➤ Table with scrollbars
          Expanded(
            child: Scrollbar(
              controller: horizontalController,
              thumbVisibility: true,
              trackVisibility: true,
              notificationPredicate:
                  (notification) =>
                      notification.metrics.axis == Axis.horizontal,
              child: SingleChildScrollView(
                controller: horizontalController,
                scrollDirection: Axis.horizontal,
                child: Scrollbar(
                  controller: verticalController,
                  thumbVisibility: true,
                  trackVisibility: true,
                  notificationPredicate:
                      (notification) =>
                          notification.metrics.axis == Axis.vertical,
                  child: SingleChildScrollView(
                    controller: verticalController,
                    scrollDirection: Axis.vertical,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: minTableWidth),
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(1.5),
                          1: FlexColumnWidth(),
                          2: FlexColumnWidth(),
                          3: FlexColumnWidth(),
                          4: FlexColumnWidth(),
                          5: FlexColumnWidth(),
                          6: FlexColumnWidth(),
                          7: FlexColumnWidth(),
                          8: FlexColumnWidth(),
                        },
                        children: [
                          // Header
                          TableRow(
                            decoration: const BoxDecoration(
                              color: Color(0xff3A5B22),
                            ),
                            children: [
                              _buildCell('Nom', true),
                              _buildCell('Référence', true),
                              _buildCell('Transfo', true),
                              _buildCell('Date', true),
                              _buildCell('Département', true),
                              _buildCell('Puissance', true),
                              _buildCell('Courant', true),
                              _buildCell('Voltage', true),
                              _buildCell('Facteur', true),
                            ],
                          ),
                          // Data Rows
                          for (var row in filteredMachines) ...[
                            TableRow(
                              children:
                                  row
                                      .map((cell) => _buildCell(cell, false))
                                      .toList(),
                            ),
                            TableRow(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(94, 32, 59, 36),
                              ),
                              children: List.generate(
                                9,
                                (_) => Container(height: 1),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCell(String text, bool isHeader) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          color: isHeader ? Colors.white : Colors.black,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
