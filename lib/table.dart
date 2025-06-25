// EnergyDash

// import 'package:flutter/material.dart';

// class MachineTable extends StatelessWidget {
//   const MachineTable({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     // Ajuste le minWidth selon la largeur de l'écran
//     final double minTableWidth = screenWidth < 900 ? 1000 : 2000;

//     // ScrollController pour Scrollbar
//     final ScrollController scrollController = ScrollController();

//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF0D0D1A),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Liste des Machines",
//             style: TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//           const SizedBox(height: 16),

//           // Scrollbar visible avec SingleChildScrollView horizontal
//            Padding(
//             padding: const EdgeInsets.only(bottom: 12), // espace avant scrollbar
//             child:
// Scrollbar(
//   controller: scrollController,
//   thumbVisibility: true,
//   trackVisibility: true,
//   child: Padding(
//     padding: const EdgeInsets.only(bottom: 12), // espace avant la scrollbar
//     child: SingleChildScrollView(
//       controller: scrollController,
//       scrollDirection: Axis.horizontal,
//       child: ConstrainedBox(
//         constraints: BoxConstraints(minWidth: minTableWidth),
//         child: Table(
//           columnWidths: const {
//             0: FlexColumnWidth(1.5),
//             1: FlexColumnWidth(),
//             2: FlexColumnWidth(),
//             3: FlexColumnWidth(),
//             4: FlexColumnWidth(),
//             5: FlexColumnWidth(),
//             6: FlexColumnWidth(),
//             7: FlexColumnWidth(),
//             8: FlexColumnWidth(),
//           },
//           children: [
//             TableRow(
//               decoration: const BoxDecoration(color: Color(0xFF2A2A3C)),
//               children: [
//                 _buildCell('Nom', true),
//                 _buildCell('Référence', true),
//                 _buildCell('Transfo', true),
//                 _buildCell('Date', true),
//                 _buildCell('Département', true),
//                 _buildCell('Puissance', true),
//                 _buildCell('Courant', true),
//                 _buildCell('Voltage', true),
//                 _buildCell('Facteur', true),
//               ],
//             ),
//             TableRow(
//               children: [
//                 _buildCell('TR-NS-001', false),
//                 _buildCell('SN-45872391', false),
//                 _buildCell('T-1', false),
//                 _buildCell('12/03/2021', false),
//                 _buildCell('**********', false),
//                 _buildCell('** KVA', false),
//                 _buildCell('** A', false),
//                 _buildCell('** V', false),
//                 _buildCell('021245', false),
//               ],
//             ),
//                // Ligne de séparation
//     TableRow(
//       decoration: const BoxDecoration(color: Color.fromARGB(94, 174, 220, 242)),
//       children: List.generate(9, (_) => Container(height: 1)),
//     ),
//                    TableRow(
//               children: [
//                 _buildCell('TR-NS-001', false),
//                 _buildCell('SN-45872391', false),
//                 _buildCell('T-1', false),
//                 _buildCell('12/03/2021', false),
//                 _buildCell('**********', false),
//                 _buildCell('** KVA', false),
//                 _buildCell('** A', false),
//                 _buildCell('** V', false),
//                 _buildCell('021245', false),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   ),
// ),

//       )],
//       ),
//     );
//   }

//   Widget _buildCell(String text, bool isHeader) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: Text(
//         text,
//         style: TextStyle(
//           color: Colors.white,
//           fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//     );
//   }
// }
// Oilapp

import 'package:flutter/material.dart';

class MachineTable extends StatelessWidget {
  const MachineTable({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Ajuste le minWidth selon la largeur de l'écran
    final double minTableWidth = screenWidth < 900 ? 1000 : 2000;

    // ScrollController pour Scrollbar
    final ScrollController scrollController = ScrollController();
final ScrollController horizontalController = ScrollController();
final ScrollController verticalController = ScrollController();

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
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      const SizedBox(height: 16),

      /// ➤ Add vertical scroll
Expanded(
  child: Scrollbar(
    controller: horizontalController, // Horizontal scrollbar
    thumbVisibility: true,
    trackVisibility: true,
    notificationPredicate: (notification) => notification.metrics.axis == Axis.horizontal,
    child: SingleChildScrollView(
      controller: horizontalController,
      scrollDirection: Axis.horizontal,
      child: Scrollbar(
        controller: verticalController, // Vertical scrollbar
        thumbVisibility: true,
        trackVisibility: true,
        notificationPredicate: (notification) => notification.metrics.axis == Axis.vertical,
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
                      TableRow(
                        decoration: const BoxDecoration(
                          color: const Color(0xff3A5B22),
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
                      TableRow(
                        children: [
                          _buildCell('TR-NS-001', false),
                          _buildCell('SN-45872391', false),
                          _buildCell('T-1', false),
                          _buildCell('12/03/2021', false),
                          _buildCell('**********', false),
                          _buildCell('** KVA', false),
                          _buildCell('** A', false),
                          _buildCell('** V', false),
                          _buildCell('021245', false),
                        ],
                      ),
                      // Ligne de séparation
                      TableRow(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(94, 32, 59, 36),
                        ),
                        children: List.generate(9, (_) => Container(height: 1)),
                      ),
                      TableRow(
                        children: [
                          _buildCell('TR-NS-001', false),
                          _buildCell('SN-45872391', false),
                          _buildCell('T-1', false),
                          _buildCell('12/03/2021', false),
                          _buildCell('**********', false),
                          _buildCell('** KVA', false),
                          _buildCell('** A', false),
                          _buildCell('** V', false),
                          _buildCell('021245', false),
                        ],
                      ),
                      TableRow(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(94, 32, 59, 36),
                        ),
                        children: List.generate(9, (_) => Container(height: 1)),
                      ),
                      TableRow(
                        children: [
                          _buildCell('TR-NS-001', false),
                          _buildCell('SN-45872391', false),
                          _buildCell('T-1', false),
                          _buildCell('12/03/2021', false),
                          _buildCell('**********', false),
                          _buildCell('** KVA', false),
                          _buildCell('** A', false),
                          _buildCell('** V', false),
                          _buildCell('021245', false),
                        ],
                      ),
                 
                 
                    ],
                  ),
                ),
              ),
            ),
          ),

          )
  )],
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
