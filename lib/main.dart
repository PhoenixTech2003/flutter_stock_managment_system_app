import 'package:flutter/material.dart';
import 'package:flutter_stock_managment_system_app/pages/inventory.dart';
import 'package:flutter_stock_managment_system_app/pages/home.dart';
import 'package:flutter_stock_managment_system_app/pages/reports.dart';
import 'package:flutter_stock_managment_system_app/pages/users.dart';
import 'package:flutter_stock_managment_system_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.appThemeData(context),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.surface,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: const [
        HomePage(),
        InventoryPage(),
        ReportsPage(),
        UsersPage()
      ][currentIndexPage],

      bottomNavigationBar: NavigationBar(
        
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndexPage = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard,), label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.inventory), label: "Inventory", ),
          NavigationDestination(icon: Icon(Icons.book), label: "Reports"),
          NavigationDestination(icon: Icon(Icons.people), label: "Users")
        ],
        selectedIndex: currentIndexPage,
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
