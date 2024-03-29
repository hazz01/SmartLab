import 'package:flutter/material.dart';
import 'package:smartlab/HomePage.dart';
import 'package:smartlab/Peminjaman.dart';
import 'package:smartlab/login.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [
    Home(),
    Peminjaman(),
    Login(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Water System'),
      //   automaticallyImplyLeading: false,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (BuildContext context) {
      //             return const Settings();
      //           },
      //         ),
      //       );
      //     },
      //     icon: const Icon(Icons.account_circle),
      //   ),
      //   centerTitle: true,
      //   actions: <Widget>[
      //     IconButton(
      //       onPressed: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (BuildContext context) {
      //               return const Settings();
      //             },
      //           ),
      //         );
      //       },
      //       icon: const Icon(Icons.settings),
      //     ),
      //   ],
      // ),
      body: pages[currentPage], // Use currentPage to switch between pages
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Pinjam',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
        currentIndex: currentPage,
        onTap: (int index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }
}
