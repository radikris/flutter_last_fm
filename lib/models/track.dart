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
    this.rank,
    this.mbid,
  });

  final Streamable? streamable;
  final int? duration;
  final String? url;
  final String? name;
  final Attr? attr;
  final Artist? artist;
  final String? rank;
  final List<String>? mbid;

  factory Track.fromJson(Map<String,dynamic> json) => Track(
    streamable: json['streamable'] != null ? Streamable.fromJson(json['streamable'] as Map<String, dynamic>) : null,
    duration: json['duration'] != null ? json['duration'] as int : null,
    url: json['url'] != null ? json['url'] as String : null,
    name: json['name'] != null ? json['name'] as String : null,
    attr: json['@attr'] != null ? Attr.fromJson(json['@attr'] as Map<String, dynamic>) : null,
    artist: json['artist'] != null ? Artist.fromJson(json['artist'] as Map<String, dynamic>) : null,
    rank: json['@rank'] != null ? json['@rank'] as String : null,
    mbid: json['mbid'] != null ? (json['mbid'] as List? ?? []).map((e) => e as String).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'streamable': streamable?.toJson(),
    'duration': duration,
    'url': url,
    'name': name,
    '@attr': attr?.toJson(),
    'artist': artist?.toJson(),
    '@rank': rank,
    'mbid': mbid?.map((e) => e.toString()).toList()
  };

  Track clone() => Track(
    streamable: streamable?.clone(),
    duration: duration,
    url: url,
    name: name,
    attr: attr?.clone(),
    artist: artist?.clone(),
    rank: rank,
    mbid: mbid?.toList()
  );


  Track copyWith({
    Optional<Streamable?>? streamable,
    Optional<int?>? duration,
    Optional<String?>? url,
    Optional<String?>? name,
    Optional<Attr?>? attr,
    Optional<Artist?>? artist,
    Optional<String?>? rank,
    Optional<List<String>?>? mbid
  }) => Track(
    streamable: checkOptional(streamable, this.streamable),
    duration: checkOptional(duration, this.duration),
    url: checkOptional(url, this.url),
    name: checkOptional(name, this.name),
    attr: checkOptional(attr, this.attr),
    artist: checkOptional(artist, this.artist),
    rank: checkOptional(rank, this.rank),
    mbid: checkOptional(mbid, this.mbid),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Track && streamable == other.streamable && duration == other.duration && url == other.url && name == other.name && attr == other.attr && artist == other.artist && rank == other.rank && mbid == other.mbid;

  @override
  int get hashCode => streamable.hashCode ^ duration.hashCode ^ url.hashCode ^ name.hashCode ^ attr.hashCode ^ artist.hashCode ^ rank.hashCode ^ mbid.hashCode;
}
