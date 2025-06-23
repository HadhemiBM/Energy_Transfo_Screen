
import 'package:charts/form.dart';
import 'package:charts/table.dart';
import 'package:flutter/material.dart';
import 'transformer_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Energy Dashboard',
      debugShowCheckedModeBanner: false,
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth <= 800;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      body: SafeArea(
        child: SingleChildScrollView( // ← rend toute la page scrollable
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ligne 1 : Tableau
              const SizedBox(height: 16),
              const SizedBox(
                height:300,
                child: MachineTable(),
              ),

              const SizedBox(height: 32),

              // Ligne 2 : Formulaire + Graphique (responsive)
              isSmallScreen
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        MachineForm(),
                        SizedBox(height: 16),
                        SizedBox(
                          height: 400,
                          child: TransformerAvailabilityChart(),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Flexible(child: MachineForm()),
                        SizedBox(width: 16),
                        SizedBox(
                          width: 500,
                          child: TransformerAvailabilityChart(),
                        ),
                      ],
                    ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
