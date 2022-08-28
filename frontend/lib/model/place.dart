import 'package:cartoswiss/model/link.dart';
import 'package:cartoswiss/model/location.dart';
import 'package:cartoswiss/types/tag_type.dart';

class Place {
  final String id;
  final String name;
  final Location location;
  final List<TagType> tags;
  final List<Link> links;

  const Place({
    required this.id,
    required this.name,
    required this.location,
    required this.tags,
    required this.links,
  });
}
