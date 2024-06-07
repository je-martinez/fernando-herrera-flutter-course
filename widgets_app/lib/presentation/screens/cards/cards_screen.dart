import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {
    'elevation': 0.0,
    'label': 'Elevation 0',
  },
  {
    'elevation': 1.0,
    'label': 'Elevation 1',
  },
  {
    'elevation': 2.0,
    'label': 'Elevation 2',
  },
  {
    'elevation': 3.0,
    'label': 'Elevation 3',
  },
  {
    'elevation': 4.0,
    'label': 'Elevation 4',
  },
];

class CardScreen extends StatelessWidget {
  static String name = 'card_screen';

  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Screen'),
      ),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map(
            (card) => _CardType1(
              elevation: card['elevation'],
              label: card['label'],
            ),
          ),
          ...cards.map(
            (card) => _CardType2(
              elevation: card['elevation'],
              label: card['label'],
            ),
          ),
          ...cards.map(
            (card) => _CardType3(
              elevation: card['elevation'],
              label: card['label'],
            ),
          ),
          ...cards.map(
            (card) => _CardType4(
              elevation: card['elevation'],
              label: card['label'],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType1({super.key, required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                )),
            Align(alignment: Alignment.bottomLeft, child: Text(label))
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType2({super.key, required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: colors.outline),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                )),
            Align(
                alignment: Alignment.bottomLeft,
                child: Text("$label - outline"))
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType3({super.key, required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceContainerHighest,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                )),
            Align(alignment: Alignment.bottomLeft, child: Text("$label filled"))
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType4({super.key, required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network('https://picsum.photos/id/${elevation.toInt()}/600/250',
              height: 350, fit: BoxFit.cover),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(20))),
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                ),
              )),
        ],
      ),
    );
  }
}
