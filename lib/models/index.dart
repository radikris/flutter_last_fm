export 'album.dart';
export 'albumdetail.dart';
export 'albummatches.dart';
export 'artist.dart';
export 'attr.dart';
export 'image.dart';
export 'streamable.dart';
export 'tag.dart';
export 'tags.dart';
export 'track.dart';
export 'tracks.dart';
export 'wiki.dart';
import 'package:quiver/core.dart';

T? checkOptional<T>(Optional<T?>? optional, T? def) {
  // No value given, just take default value
  if (optional == null) return def;

  // We have an input value
  if (optional.isPresent) return optional.value;

  // We have a null inside the optional
  return null;
}
