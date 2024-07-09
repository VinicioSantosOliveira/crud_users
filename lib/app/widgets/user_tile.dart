import 'package:crud_users/app/models/user_model.dart';
import 'package:crud_users/app/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final UserModel user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/form', arguments: user);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.orange,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Excluir Usuário"),
                    content: const Text("Tem certeza?"),
                    actions: [
                      FloatingActionButton.small(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text("Não"),
                      ),
                      FloatingActionButton.small(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text("Sim"),
                      ),
                    ],
                  ),
                ).then((confirmed) {
                  if (confirmed) {
                    Provider.of<UsersProvider>(context, listen: false).remove(user);
                  }
                });
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
