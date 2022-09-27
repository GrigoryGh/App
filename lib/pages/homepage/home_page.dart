import 'package:flutter/material.dart';
import 'package:indigo/pages/homepage/home_page_provider.dart';
import 'package:indigo/widgets/drawer.dart';
import 'package:indigo/widgets/grid_builder.dart';
import 'package:indigo/widgets/list_builder.dart';
import 'package:provider/provider.dart';

import '../../base/routes.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageProvider>(
      create: (context) => HomePageProvider(),
      child: Scaffold(
        drawer: const NavigatorDrawer(),
        appBar: AppBar(
          actions: [
            Consumer<HomePageProvider>(
              builder: (context, value, child) {
                return IconButton(
                    onPressed: () {
                      value.onChange();
                    },
                    icon: value.isGrid
                        ? const Icon(Icons.list)
                        : const Icon(Icons.grid_view_outlined));
              },
            ),
          ],
          title: const Text(
            'Home',
          ),
          // automaticallyImplyLeading: false,
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, value, child) {
        return value.isGrid
            ? GridBuild(value.products)
            : ListBuild(value.products);
      },
    );
  }
}
