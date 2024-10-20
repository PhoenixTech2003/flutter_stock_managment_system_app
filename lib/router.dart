import 'package:flutter_stock_managment_system_app/pages/edit_inventory.dart';
import 'package:flutter_stock_managment_system_app/pages/reports.dart';
import 'package:flutter_stock_managment_system_app/pages/users.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_stock_managment_system_app/pages/home.dart';
import 'package:flutter_stock_managment_system_app/pages/inventory.dart';
import 'package:flutter/material.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      routes: [
        GoRoute(path: "/", builder: (context, state) => const HomePage()),
        GoRoute(
            path: "/inventory",
            builder: (context, state) => const InventoryPage(),
            routes: [
              GoRoute(
                path: "/:productId",
                builder: (context, state) => const EditInventoryPage(),
              )
            ]),
        GoRoute(
          path: "/reports",
          builder: (context, state) => const ReportsPage(),
        ),
        GoRoute(
          path: "/users",
          builder: (context, state) => const UsersPage(),
        ),
      ],
      builder: (context, state, child) => Scaffold(
        body: child,
        bottomNavigationBar: NavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.dashboard), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.inventory), label: "Inventory"),
            NavigationDestination(icon: Icon(Icons.book), label: "Reports"),
            NavigationDestination(icon: Icon(Icons.people), label: "Users"),
          ],
          onDestinationSelected: (int index) {
            switch (index) {
              case 0:
                context.go('/');
                break;
              case 1:
                context.go('/inventory');
                break;
              case 2:
                context.go('/reports');
                break;
              case 3:
                context.go('/users');
                break;
            }
          },
          selectedIndex: _getSelectedIndex(state.uri.toString()),
        ),
      ),
    ),
  ],
);

int _getSelectedIndex(String uri) {
  if (uri == '/') {
    return 0;
  } else if (uri.startsWith('/inventory')) {
    return 1;
  } else if (uri.startsWith('/reports')) {
    return 2;
  } else if (uri.startsWith('/users')) {
    return 3;
  } else {
    return 0;
  }
}
