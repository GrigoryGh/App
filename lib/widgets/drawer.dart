import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:indigo/base/routes.dart';

class NavigatorDrawer extends StatefulWidget {
  const NavigatorDrawer({super.key});

  @override
  State<NavigatorDrawer> createState() => _NavigatorDrawerState();
}

class _NavigatorDrawerState extends State<NavigatorDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Indigo'),
        ),
        body: Column(
          children: [
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.settingpage);
              },
            ),
            ListTile(
              title: const Text('FeedBack'),
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.feedBackPage);
              },
            ),
            const Spacer(),
            ListTile(
                title: const Text('Log Out'),
                onTap: () {
                  setState(() {
                    SystemNavigator.pop();
                  });
                }),
          ],
        ),
      ),
    );
  }
}
