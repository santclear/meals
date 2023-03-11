import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';

import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged, {super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings = Settings();

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configuration'),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Configuration',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _createSwitch(
                  'Gluten-free',
                  'It only displays gluten-free meals!',
                  settings.isGlutenFree,
                  (value) => setState(
                    () => settings.isGlutenFree = value,
                  ),
                ),
                _createSwitch(
                  'Lactose-free',
                  'It only displays lactose-free meals!',
                  settings.isLactoseFree,
                  (value) => setState(
                    () => settings.isLactoseFree = value,
                  ),
                ),
                _createSwitch(
                  'Vegan-free',
                  'It only displays vegan meals!',
                  settings.isVegan,
                  (value) => setState(
                    () => settings.isVegan = value,
                  ),
                ),
                _createSwitch(
                  'Vegetarian-free',
                  'It only displays vegetarian meals!',
                  settings.isVegetarian,
                  (value) => setState(
                    () => settings.isVegetarian = value,
                  ),
                ),
              ],
            ))
          ],
        ));
  }
}
