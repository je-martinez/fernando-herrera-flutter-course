import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static String name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  void loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    const snackbar = SnackBar(
      content: Text('Fetching more images...'),
      duration: Duration(minutes: 10),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    if (!isMounted) return;
    setState(() {});
    if (mounted) ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    isMounted = false;
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Center(
          child: ListView.builder(
            controller: scrollController,
            // physics: const ClampingScrollPhysics(),
            itemCount: imagesIds.length,
            itemBuilder: (context, index) => FadeInImage(
                width: double.infinity,
                fit: BoxFit.cover,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                  'https://picsum.photos/id/${imagesIds[index]}/500/300',
                )),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: !isLoading
            ? FadeIn(child: const Icon(Icons.arrow_back_ios_new))
            : FadeIn(
                child: SpinPerfect(
                    infinite: true, child: const Icon(Icons.refresh_rounded)),
              ),
      ),
    );
  }
}
