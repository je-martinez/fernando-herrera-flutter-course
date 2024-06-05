// ignore: file_names
// ignore: file_names
enum Sender { me, other }

class Message {
  final String text;
  final String? imageUrl;
  final Sender fromWho;

  Message({required this.text, this.imageUrl, required this.fromWho});
}
