import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final String email;
  const Contact(this.name, this.phone, this.email);
}

const contacts = [
  Contact('Aziza Karimova', '+998 90 111 22 33', 'aziza@example.com'),
  Contact('Bobur Tursunov', '+998 91 222 33 44', 'bobur@example.com'),
  Contact('Dilnoza Yusupova', '+998 93 333 44 55', 'dilnoza@example.com'),
  Contact('Jasur Rakhimov', '+998 94 444 55 66', 'jasur@example.com'),
  Contact('Malika Saidova', '+998 97 555 66 77', 'malika@example.com'),
];

void main() => runApp(const MaterialApp(home: ContactListScreen()));

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, i) {
          final c = contacts[i];
          return ListTile(
            leading: CircleAvatar(child: Text(c.name[0])),
            title: Text(c.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // The whole object is passed, not three strings.
                  builder: (context) => ContactScreen(contact: c),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  final Contact contact;
  const ContactScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Row(children: [
                  const Icon(Icons.phone),
                  const SizedBox(width: 8),
                  Text(contact.phone),
                ]),
                const SizedBox(height: 8),
                Row(children: [
                  const Icon(Icons.email),
                  const SizedBox(width: 8),
                  Text(contact.email),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}