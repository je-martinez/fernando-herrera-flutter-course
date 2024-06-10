import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {
  static String name = 'ui_controls_screen';
  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView({
    super.key,
  });

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = false;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            value: isDeveloper,
            onChanged: (value) {
              isDeveloper = value;
              setState(() {});
            },
            subtitle: const Text('Enable or disable developer mode'),
            title: const Text('Developer Mode')),
        ExpansionTile(
          title: const Text('Vehiculo de Transporte'),
          subtitle: Text(selectedTransportation.name.toUpperCase()),
          expansionAnimationStyle: AnimationStyle(
              curve: Easing.emphasizedAccelerate,
              duration: Durations.extralong1),
          children: [
            RadioListTile(
                secondary: const Icon(Icons.directions_car),
                value: Transportation.car,
                groupValue: selectedTransportation,
                title: const Text('Car'),
                onChanged: (value) => {
                      selectedTransportation = Transportation.car,
                      setState(() {})
                    }),
            RadioListTile(
                secondary: const Icon(Icons.directions_boat),
                value: Transportation.plane,
                groupValue: selectedTransportation,
                title: const Text('Plane'),
                onChanged: (value) => {
                      selectedTransportation = Transportation.plane,
                      setState(() {})
                    }),
            RadioListTile(
                secondary: const Icon(Icons.water),
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                title: const Text('Submarine'),
                onChanged: (value) => {
                      selectedTransportation = Transportation.submarine,
                      setState(() {})
                    }),
          ],
        ),
        CheckboxListTile(
            value: wantsBreakfast,
            onChanged: (value) {
              wantsBreakfast = value!;
              setState(() {});
            },
            title: const Text('Desayuno')),
        CheckboxListTile(
            value: wantsLunch,
            onChanged: (value) {
              wantsLunch = value!;
              setState(() {});
            },
            title: const Text('Almuerzo')),
        CheckboxListTile(
            value: wantsDinner,
            onChanged: (value) {
              wantsDinner = value!;
              setState(() {});
            },
            title: const Text('Cena')),
      ],
    );
  }
}
