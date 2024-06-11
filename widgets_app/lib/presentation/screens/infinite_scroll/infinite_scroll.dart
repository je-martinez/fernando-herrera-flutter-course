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
    scrollController.dispose();
    super.dispose();
  }

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

    if (!mounted) return;
    setState(() {});
    if (mounted) ScaffoldMessenger.of(context).hideCurrentSnackBar();
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    isLoading = false;
    addFiveImages();
    setState(() {});
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Center(
          child: RefreshIndicator(
            edgeOffset: 10,
            onRefresh: onRefresh,
            child: ListView.builder(
              controller: scrollController,
              // physics: const ClampingScrollPhysics(),
              itemCount: imagesIds.length,
              itemBuilder: (context, index) =>
                  _ItemImage(imageId: imagesIds[index].toString()),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: _FloatingButton(
          isLoading: isLoading,
        ),
      ),
    );
  }
}

class _ItemImage extends StatelessWidget {
  final String imageId;
  const _ItemImage({
    super.key,
    required this.imageId,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
        width: double.infinity,
        fit: BoxFit.cover,
        height: 300,
        placeholder: const AssetImage('assets/images/jar-loading.gif'),
        placeholderColorBlendMode: BlendMode.darken,
        image: NetworkImage(
          'https://picsum.photos/id/$imageId/500/300',
        ));
  }
}

class _FloatingButton extends StatelessWidget {
  final bool isLoading;
  const _FloatingButton({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? FadeIn(
            key: key,
            duration: const Duration(milliseconds: 500),
            child: const Icon(Icons.arrow_back_ios_new))
        : FadeIn(
            key: key,
            duration: const Duration(milliseconds: 500),
            child: SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_rounded)),
          );
  }
}
