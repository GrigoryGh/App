import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:indigo/api/indigo_api.dart';
import 'package:indigo/models/product_model.dart';
import 'package:indigo/models/settings_model.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({Key? key}) : super(key: key);

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: const Text(
          'Settings',
        ),
        automaticallyImplyLeading: false,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder(
      future: IndigoAPI().settings.getSettingsData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final settings = snapshot.data as List<Settings>;

          return ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(settings[index].settingName!),
                trailing: Switch(
                  value: settings[index].settingValue!,
                  onChanged: (bool value) {},
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: settings.length,
          );
        } else {
          return const Center(
            child: Text('No Items'),
          );
        }
      },
    );
  }
}
