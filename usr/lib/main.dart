import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academic Year Update',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AcademicYearScreen(),
      },
    );
  }
}

class AcademicYearScreen extends StatelessWidget {
  const AcademicYearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academic Year Update'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ChangeCard(
            title: 'Academic Year',
            oldValue: '2024 - 2025',
            oldValueWords: 'Two Thousand Twenty-Four to Two Thousand Twenty-Five',
            newValue: '2025 - 2026',
            newValueWords: 'Two Thousand Twenty-Five to Two Thousand Twenty-Six',
          ),
          SizedBox(height: 16),
          ChangeCard(
            title: 'Term Period',
            oldValue: 'April 2025',
            oldValueWords: 'April Two Thousand Twenty-Five',
            newValue: 'April 2026',
            newValueWords: 'April Two Thousand Twenty-Six',
          ),
        ],
      ),
    );
  }
}

class ChangeCard extends StatelessWidget {
  final String title;
  final String oldValue;
  final String oldValueWords;
  final String newValue;
  final String newValueWords;

  const ChangeCard({
    super.key,
    required this.title,
    required this.oldValue,
    required this.oldValueWords,
    required this.newValue,
    required this.newValueWords,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_month, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(),
            ),
            const Text(
              'Previous:',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              oldValue,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              oldValueWords,
              style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_forward_rounded, 
                           size: 16, 
                           color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 4),
                      Text(
                        'Updated To:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    newValue,
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold, 
                      color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                  Text(
                    newValueWords,
                    style: TextStyle(
                      fontStyle: FontStyle.italic, 
                      color: Theme.of(context).colorScheme.onSurfaceVariant
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
