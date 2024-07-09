import 'package:crud_users/app/pages/form_users_page.dart';
import 'package:crud_users/app/pages/home_page.dart';
import 'package:crud_users/app/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const HomePage(),
          '/form': (context) => const FormUsersPage(),
        },
      ),
    );
  }
}
