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
        ),
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
            NavigationDestination(icon: Icon(Icons.inventory), label: "Inventory"),
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
          selectedIndex: state.uri.toString() == '/'
              ? 0
              : state.uri.toString() == '/inventory'
                  ? 1
                  : state.uri.toString() == '/reports'
                      ? 2
                      : state.uri.toString() == '/users'
                          ? 3
                          : 0,
        ),
      ),
    ),
  ],
);