
import 'package:flutter/material.dart';

class MachineForm extends StatelessWidget {
  const MachineForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Pour scroll si l'écran est petit
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E2C),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Identité de la Machine",
              style: TextStyle(
                  color: Colors.white,
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
                  _formField("Transfo nombre", isSmallScreen),
                  _formField("Date de fabrication", isSmallScreen),
                  _formField("Département", isSmallScreen),
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
                backgroundColor: const Color(0xFF00C2FF),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
              style: const TextStyle(color: Colors.white, fontSize: 14)),
          const SizedBox(height: 6),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF2A2A3C),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
