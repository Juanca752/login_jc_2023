import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_jc_2023/screens/user/profile.dart';

class DrawerProfile extends StatefulWidget {
  const DrawerProfile({super.key});

  @override
  State<DrawerProfile> createState() => _DrawerProfile();
}

class _DrawerProfile extends State<DrawerProfile> {
  String? username;
  String? email;
  @override
  void initState() {
    super.initState();
    // Obtén el nombre del usuario antes de construir el cajón de navegación
   
  }



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(215, 123, 255, 1),
            ),
            accountName: Text(username ?? 'User Fullname'),
            accountEmail: Text(email ?? 'Email'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Porfile'),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const TheProfile());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurations'),
            onTap: () {
              // final route = MaterialPageRoute(builder: (context) => Page2());
              // Navigator.push(context, route);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sing out'),
            onTap: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
    );
  }
}
