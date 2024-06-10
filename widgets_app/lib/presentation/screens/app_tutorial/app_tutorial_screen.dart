import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo(
    title: 'First Slide',
    description: 'This is the second slide',
    image: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Second Slide',
    description: 'This is the third slide',
    image: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Third Slide',
    description: 'This is the fourth slide',
    image: 'assets/images/3.png',
  ),
];

class SlideInfo {
  final String title;
  final String description;
  final String image;

  SlideInfo({
    required this.title,
    required this.description,
    required this.image,
  });
}

class AppTutorial extends StatefulWidget {
  static String name = 'apptutorial_screen';

  const AppTutorial({super.key});

  @override
  State<AppTutorial> createState() => _AppTutorialState();
}

class _AppTutorialState extends State<AppTutorial> {
  final PageController pageController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final page = pageController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.2)) {
        endReached = true;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slide) => _Slide(
                        title: slide.title,
                        description: slide.description,
                        image: slide.image,
                      ))
                  .toList()),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Skip'))),
          if (endReached)
            Positioned(
                right: 20,
                bottom: 50,
                child: FadeInRight(
                  from: 15,
                  delay: const Duration(seconds: 1),
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Begin'),
                  ),
                ))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const _Slide(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final descriptionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(image)),
            Text(
              title,
              style: titleStyle,
            ),
            Text(description, style: descriptionStyle),
          ],
        ),
      ),
    );
  }
}
