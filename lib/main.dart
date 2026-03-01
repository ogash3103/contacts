import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String status;
  final bool isSelected;

  Contact({required this.name, required this.status, this.isSelected = false});
}

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ContactsPage()));
}

class ContactsPage extends StatefulWidget {
  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> contacts = [
    Contact(name: 'Joe Belfiore', status: 'In a world far away'),
    Contact(name: 'Bill Gates', status: "What I'm doing here?"),
    Contact(name: 'Mark Zuckerberg', status: 'Really Busy, WhatsApp only'),
    Contact(name: 'Marissa Mayer', status: 'In a rush to catch a plane'),
    Contact(name: 'Bill Gates', status: "What I'm doing here?"),
    Contact(name: 'Mark Zuckerberg', status: 'Really Busy, WhatsApp only'),
    Contact(
      name: 'Sundar Pichai',
      status: 'Do androids dream of electric sheep?',
    ),
    Contact(
      name: 'Jeff Bezos',
      status: 'Counting Zeroes : Prime time.',
      isSelected: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: Icon(Icons.menu, color: Colors.grey.shade600),

        title: Text(
          'Contacts',
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search, color: Colors.grey.shade600),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return buildContactItem(contacts[index]);
        },
      ),
    );
  }

  Widget buildContactItem(Contact contact) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 2),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                SizedBox(height: 4),

                Text(
                  contact.status,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade50),
                ),
              ],
            ),
          ),

          if(contact.isSelected)
            Container(
              width: 44,
                height: 44,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.edit,
                color: Colors.grey.shade500,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}
