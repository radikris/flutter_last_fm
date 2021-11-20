import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

import 'streamable.dart';
import 'attr.dart';
import 'artist.dart';

@immutable
class Track {

  const Track({
    this.streamable,
    this.duration,
    this.url,
    this.name,
    this.attr,
    this.artist,
  });

  final Streamable? streamable;
  final int? duration;
  final String? url;
  final String? name;
  final Attr? attr;
  final Artist? artist;

  factory Track.fromJson(Map<String,dynamic> json) => Track(
    streamable: json['streamable'] != null ? Streamable.fromJson(json['streamable'] as Map<String, dynamic>) : null,
    duration: json['duration'] != null ? json['duration'] as int : null,
    url: json['url'] != null ? json['url'] as String : null,
    name: json['name'] != null ? json['name'] as String : null,
    attr: json['@attr'] != null ? Attr.fromJson(json['@attr'] as Map<String, dynamic>) : null,
    artist: json['artist'] != null ? Artist.fromJson(json['artist'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'streamable': streamable?.toJson(),
    'duration': duration,
    'url': url,
    'name': name,
    '@attr': attr?.toJson(),
    'artist': artist?.toJson()
  };

  Track clone() => Track(
    streamable: streamable?.clone(),
    duration: duration,
    url: url,
    name: name,
    attr: attr?.clone(),
    artist: artist?.clone()
  );


  Track copyWith({
    Optional<Streamable?>? streamable,
    Optional<int?>? duration,
    Optional<String?>? url,
    Optional<String?>? name,
    Optional<Attr?>? attr,
    Optional<Artist?>? artist
  }) => Track(
    streamable: checkOptional(streamable, this.streamable),
    duration: checkOptional(duration, this.duration),
    url: checkOptional(url, this.url),
    name: checkOptional(name, this.name),
    attr: checkOptional(attr, this.attr),
    artist: checkOptional(artist, this.artist),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Track && streamable == other.streamable && duration == other.duration && url == other.url && name == other.name && attr == other.attr && artist == other.artist;

  @override
  int get hashCode => streamable.hashCode ^ duration.hashCode ^ url.hashCode ^ name.hashCode ^ attr.hashCode ^ artist.hashCode;
}
