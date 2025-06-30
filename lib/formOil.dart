
import 'package:flutter/material.dart';

class MachineForm extends StatefulWidget {
  const MachineForm({super.key});

  @override
  State<MachineForm> createState() => _MachineFormState();
}

class _MachineFormState extends State<MachineForm> {
  String? selectedTransfo;
  String? selectedDepartement;

  final List<String> transfos = ['T1', 'T2', 'T3'];
  final List<String> departements = ['Production', 'Maintenance', 'Logistique'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints(
          minHeight: 400, // Setting the minimum height to 400
        ),
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
              "Identité de la Machine",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(height: 16),
            LayoutBuilder(builder: (context, constraints) {
              final isSmallScreen = constraints.maxWidth < 600;

              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _formField("Nom de la machine", isSmallScreen),
                  _formField("Référence", isSmallScreen),
                  _dropdownField(
                    label: "Transfo nombre",
                    isSmallScreen: isSmallScreen,
                    value: selectedTransfo,
                    items: transfos,
                    onChanged: (value) {
                      setState(() {
                        selectedTransfo = value;
                      });
                    },
                  ),
                  _formField("Date de fabrication", isSmallScreen),
                  _dropdownField(
                    label: "Département",
                    isSmallScreen: isSmallScreen,
                    value: selectedDepartement,
                    items: departements,
                    onChanged: (value) {
                      setState(() {
                        selectedDepartement = value;
                      });
                    },
                  ),
                  _formField("Puissance (KVA)", isSmallScreen),
                  _formField("Courant (A)", isSmallScreen),
                  _formField("Voltage (V)", isSmallScreen),
                  _formField("Facteur utilisation 1", isSmallScreen),
                  _formField("Facteur utilisation 2", isSmallScreen),
                  _formField("Facteur utilisation 3", isSmallScreen),
                ],
              );
            }),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Ajouter"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff3A5B22),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formField(String label, bool isSmallScreen) {
    return SizedBox(
      width: isSmallScreen ? double.infinity : 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.black, fontSize: 14)),
          const SizedBox(height: 6),
          TextField(
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: const Color.fromARGB(143, 27, 42, 22).withOpacity(0.63), // Applied opacity here
                  width: 1, // Set the width of the border
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropdownField({
    required String label,
    required bool isSmallScreen,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return SizedBox(
      width: isSmallScreen ? double.infinity : 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.black, fontSize: 14)),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: value,
            onChanged: onChanged,
            items: items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            dropdownColor: Colors.white,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: const Color.fromARGB(139, 27, 42, 22).withOpacity(0.63), // Applied opacity here
                  width: 1, // Set the width of the border
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
