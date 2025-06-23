import 'package:flutter/material.dart';

class MachineTable extends StatelessWidget {
  const MachineTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Liste des Machines",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
           Table(
            columnWidths: {
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
                decoration: BoxDecoration(color: Color(0xFF2A2A3C)),
                children: [
                  Padding(padding: EdgeInsets.all(8), child: Text('Nom', style: TextStyle(color: Colors.white))),
                  Padding(padding: EdgeInsets.all(8), child: Text('Référence', style: TextStyle(color: Colors.white))),
                  Padding(padding: EdgeInsets.all(8), child: Text('Transfo', style: TextStyle(color: Colors.white))),
                  Padding(padding: EdgeInsets.all(8), child: Text('Date', style: TextStyle(color: Colors.white))),
                  Padding(padding: EdgeInsets.all(8), child: Text('Département', style: TextStyle(color: Colors.white))),
                  Padding(padding: EdgeInsets.all(8), child: Text('Puissance', style: TextStyle(color: Colors.white))),
                  Padding(padding: EdgeInsets.all(8), child: Text('Courant', style: TextStyle(color: Colors.white))),
                  Padding(padding: EdgeInsets.all(8), child: Text('Voltage', style: TextStyle(color: Colors.white))),
                  Padding(padding: EdgeInsets.all(8), child: Text('Facteur', style: TextStyle(color: Colors.white))),
                ],
              ),
              // Exemple de ligne de données
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8), child: Text('TR-NS-001', style: TextStyle(color: Colors.white))),
                Padding(padding: EdgeInsets.all(8), child: Text('SN-45872391', style: TextStyle(color: Colors.white))),
                Padding(padding: EdgeInsets.all(8), child: Text('T-1', style: TextStyle(color: Colors.white))),
                Padding(padding: EdgeInsets.all(8), child: Text('12/03/2021', style: TextStyle(color: Colors.white))),
                Padding(padding: EdgeInsets.all(8), child: Text('**********', style: TextStyle(color: Colors.white))),
                Padding(padding: EdgeInsets.all(8), child: Text('** KVA', style: TextStyle(color: Colors.white))),
                Padding(padding: EdgeInsets.all(8), child: Text('** A', style: TextStyle(color: Colors.white))),
                Padding(padding: EdgeInsets.all(8), child: Text('** V', style: TextStyle(color: Colors.white))),
                Padding(padding: EdgeInsets.all(8), child: Text('021245', style: TextStyle(color: Colors.white))),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
