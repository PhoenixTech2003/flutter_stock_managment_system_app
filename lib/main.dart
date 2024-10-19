import 'package:flutter/material.dart';
import 'package:flutter_stock_managment_system_app/theme.dart';
import 'package:flutter_stock_managment_system_app/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: CustomTheme.appThemeData(context),
    );
  }
}





