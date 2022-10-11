import 'package:fishop_admin/app/bloc/app_bloc.dart';
import 'package:fishop_admin/ui/home/view/home_screen.dart';
import 'package:fishop_admin/ui/login/cubit/login_cubit.dart';
import 'package:fishop_admin/ui/login/view/login_screen.dart';
import 'package:fishop_admin/ui/product_add/view/product_add_view.dart';
import 'package:fishop_firebase/fishop_firebase.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fi_theme/fi_theme.dart';
import 'package:formz/formz.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;
  final AuthenticationRepository _authenticationRepository;
  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          builder: (context, state) {
            return RepositoryProvider.value(
              value: _authenticationRepository,
              child: const LoginPage(),
            );
          },
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) {
            return HomeScreen();
          },
        )
      ],
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      routerConfig: router,
    );
  }
}
