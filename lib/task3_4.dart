import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomeScreen()));

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _color = Colors.grey;

  Future<void> _chooseColour() async {
    // Wait here until the second screen pops with a value.
    final c = await Navigator.push<Color>(
      context,
      MaterialPageRoute(builder: (context) => const ChooseColourScreen()),
    );
    if (!mounted) return; // never use context/setState after await unchecked
    if (c != null) {
      setState(() => _color = c);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current colour')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 120, height: 120, color: _color),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _chooseColour,
              child: const Text('Choose colour'),
            ),
          ],
        ),
      ),
    );
  }
}

class ChooseColourScreen extends StatelessWidget {
  const ChooseColourScreen({super.key});

  Widget _button(BuildContext context, String label, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color, foregroundColor: Colors.white),
      onPressed: () => Navigator.pop(context, color), // send the result back
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick a colour')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _button(context, 'Red', Colors.red),
            const SizedBox(height: 12),
            _button(context, 'Green', Colors.green),
            const SizedBox(height: 12),
            _button(context, 'Blue', Colors.blue),
          ],
        ),
      ),
    );
  }
}