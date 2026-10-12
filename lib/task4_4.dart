import 'package:flutter/material.dart';

class User {
  final String name;
  final int age;
  final String city;
  const User(this.name, this.age, this.city);
}

const users = [
  User('Aziza', 20, 'Tashkent'),
  User('Bobur', 22, 'Samarkand'),
  User('Dilnoza', 19, 'Bukhara'),
  User('Jasur', 24, 'Navoi'),
];

void main() {
  runApp(MaterialApp(
    home: const UserListScreen(), // handles '/'; no routes table
    onGenerateRoute: (settings) {
      if (settings.name == '/profile') {
        final args = settings.arguments;
        // Check the type before using it.
        if (args is User) {
          return MaterialPageRoute(
            builder: (context) => ProfileScreen(user: args),
          );
        }
      }
      return null;
    },
  ));
}

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: ListView(
        children: [
          for (final u in users)
            ListTile(
              title: Text(u.name),
              onTap: () =>
                  Navigator.pushNamed(context, '/profile', arguments: u),
            ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name}', style: const TextStyle(fontSize: 22)),
            Text('Age: ${user.age}', style: const TextStyle(fontSize: 22)),
            Text('City: ${user.city}', style: const TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}