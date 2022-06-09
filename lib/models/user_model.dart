import 'package:meta/meta.dart';

class User {
  final String name;
  final String contact;

  final String imageUrl;

  const User({
    @required this.name,
    @required this.contact,
    @required this.imageUrl,
  });
}
