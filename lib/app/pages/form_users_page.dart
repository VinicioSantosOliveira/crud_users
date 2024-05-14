import 'package:flutter/material.dart';

class FormUsersPage extends StatelessWidget {
  const FormUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de usuários'),
      ),
      body: Column(
        children: [
          TextFormField(),
        ],
      ),
    );
  }
}
