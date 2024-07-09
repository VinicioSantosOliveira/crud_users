import 'dart:math';

import 'package:crud_users/app/data/dummy_data.dart';
import 'package:crud_users/app/models/user_model.dart';
import 'package:flutter/material.dart';

class UsersProvider with ChangeNotifier {
  final Map<String, UserModel> _items = {...DUMMY_USERS};

  List<UserModel> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  UserModel byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(UserModel user) {
    if (user == null) {
      return;
    }
    if (user.id != null && user.id.trim().isNotEmpty && _items.containsKey(user.id)) {
      //alterar
      _items.update(
        user.id,
        (_) => UserModel(
          user.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    } else {
      //adicionar
      final id = Random().nextDouble().toString();

      _items.putIfAbsent(
        id,
        () => UserModel(
          id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }

    notifyListeners();
  }

  void remove(UserModel user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
