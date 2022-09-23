import 'package:flutter/material.dart';
import 'package:indigo/widgets/drawer.dart';
import 'package:indigo/widgets/grid_builder.dart';
import 'package:indigo/widgets/list_builder.dart';

import '../../base/routes.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  bool isGrid = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigatorDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.settingpage);
              },
              icon: const Icon(Icons.settings)),
          if (isGrid)
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                setState(() {
                  isGrid = false;
                });
              },
            )
          else
            IconButton(
              icon: const Icon(Icons.grid_on),
              onPressed: () {
                setState(() {
                  isGrid = true;
                });
              },
            )
        ],
        title: const Text(
          'Home',
        ),
        // automaticallyImplyLeading: false,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return isGrid ? const GridBuild() : const ListBuild();
  }
}
