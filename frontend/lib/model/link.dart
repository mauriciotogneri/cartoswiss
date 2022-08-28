import 'package:cartoswiss/types/link_type.dart';

class Link {
  final LinkType type;
  final String value;

  const Link._({
    required this.type,
    required this.value,
  });

  factory Link.website(String value) => Link._(type: LinkType.website, value: value);

  factory Link.email(String value) => Link._(type: LinkType.email, value: value);

  factory Link.phone(String value) => Link._(type: LinkType.phone, value: value);

  factory Link.google(String value) => Link._(type: LinkType.google, value: value);

  factory Link.facebook(String value) => Link._(type: LinkType.facebook, value: value);

  factory Link.instagram(String value) => Link._(type: LinkType.instagram, value: value);
}
