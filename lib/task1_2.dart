import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LetterScreen(
      letter: 'A',
      color: Colors.red,
      next: () => LetterScreen(
        letter: 'B',
        color: Colors.green,
        next: () => const LetterScreen(letter: 'C', color: Colors.blue),
      ),
    ),
  ));
}

class LetterScreen extends StatelessWidget {
  final String letter;
  final Color color;

  final Widget Function()? next;

  const LetterScreen({
    super.key,
    required this.letter,
    required this.color,
    this.next,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen $letter'),
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: next != null
            ? ElevatedButton(
                child: const Text('Next'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => next!()),
                  );
                },
              )
            : ElevatedButton(
                child: const Text('Back'),
                onPressed: () => Navigator.pop(context),
              ),
      ),
    );
  }
}