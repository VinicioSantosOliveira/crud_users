import 'package:crud_users/app/models/user_model.dart';
import 'package:crud_users/app/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormUsersPage extends StatefulWidget {
  const FormUsersPage({super.key});

  @override
  State<FormUsersPage> createState() => _FormUsersPageState();
}

class _FormUsersPageState extends State<FormUsersPage> {
  final _form = GlobalKey<FormState>();

  late final UserModel user;
  final Map<String, String> _formData = {};

  void _loadFormData(UserModel user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final UserModel user = ModalRoute.of(context)!.settings.arguments as UserModel;
    _loadFormData(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de usuários'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'] = user.name,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }
                  if (value.trim().length < 3) {
                    return 'Nome muito curto, mínimo 3 letras';
                  }
                },
                onSaved: (value) => _formData['name'] = value ?? '',
              ),
              TextFormField(
                initialValue: _formData['email'] = user.email,
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (value) => _formData['email'] = value ?? '',
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'] = user.avatarUrl,
                decoration: const InputDecoration(labelText: 'Url do avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value ?? '',
              ),
              TextButton(
                onPressed: () {
                  final isValid = _form.currentState!.validate();

                  if (isValid) {
                    _form.currentState!.save();
                    Provider.of<UsersProvider>(context, listen: false).put(
                      UserModel(
                        _formData['id'] ?? '',
                        name: _formData['name'] ?? '',
                        email: _formData['email'] ?? '',
                        avatarUrl: _formData['avatarUrl'] ?? '',
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: const SizedBox(
                  width: 65,
                  child: Row(
                    children: [
                      Text('Salvar'),
                      Icon(Icons.save),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
