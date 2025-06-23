// import 'package:charts/form.dart';
// import 'package:charts/table.dart';
// import 'package:flutter/material.dart';

// import 'transformer_chart.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Energy Dashboard',
//       debugShowCheckedModeBanner: false,
//       home: const DashboardPage(),
//     );
//   }
// }

// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Color(0xFF1A1B2F),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Première ligne : Tableau + Graphique
//                 Expanded(child: MachineTable()),
//             SizedBox(height: 32),

//           Expanded(
//   child: Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Expanded(child: MachineForm()),
//       const SizedBox(width: 16),
//       const SizedBox(width: 400, child: TransformerAvailabilityChart()),
//     ],
//   ),
// ),

//             SizedBox(height: 32),
//             // Deuxième ligne : Formulaire
//             // MachineForm(),
//           ],
//         ),
//       ),
//     );
//   }
// }
// 22222
// import 'package:charts/form.dart';
// import 'package:charts/table.dart';
// import 'package:flutter/material.dart';
// import 'transformer_chart.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Energy Dashboard',
//       debugShowCheckedModeBanner: false,
//       home: const DashboardPage(),
//     );
//   }
// }

// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     final bool isSmallScreen = screenWidth <= 660;

//     return Scaffold(
//       backgroundColor: const Color(0xFF1A1B2F),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Ligne 1 : Tableau (fixe)
//             const SizedBox(height: 16),
//             const SizedBox(
//               height: 300,
//               child: MachineTable(),
//             ),

//             const SizedBox(height: 32),

//             // Ligne 2 : Formulaire + Graphique (responsive)
//             Expanded(
//               child: isSmallScreen
//                   ? Column(
//                       children: const [
//                         MachineForm(),
//                         SizedBox(height: 16),
//                         SizedBox(
//                           height: 400,
//                           child: TransformerAvailabilityChart(),
//                         ),
//                       ],
//                     )
//                   : Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Flexible(child: MachineForm()),
//                         SizedBox(width: 16),
//                         SizedBox(width: 400, child: TransformerAvailabilityChart()),
//                       ],
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
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
      backgroundColor: const Color(0xFF1A1B2F),
      body: SafeArea(
        child: SingleChildScrollView( // ← rend toute la page scrollable
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ligne 1 : Tableau
              const SizedBox(height: 16),
              const SizedBox(
                height: 300,
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
                          width: 400,
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
