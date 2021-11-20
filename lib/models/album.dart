import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

import 'image.dart';

@immutable
class Album {

  const Album({
    this.name,
    this.artist,
    this.url,
    this.image,
    this.streamable,
    this.mbid,
  });

  final String? name;
  final String? artist;
  final String? url;
  final List<Image>? image;
  final String? streamable;
  final String? mbid;

  factory Album.fromJson(Map<String,dynamic> json) => Album(
    name: json['name'] != null ? json['name'] as String : null,
    artist: json['artist'] != null ? json['artist'] as String : null,
    url: json['url'] != null ? json['url'] as String : null,
    image: json['image'] != null ? (json['image'] as List? ?? []).map((e) => Image.fromJson(e as Map<String, dynamic>)).toList() : null,
    streamable: json['streamable'] != null ? json['streamable'] as String : null,
    mbid: json['mbid'] != null ? json['mbid'] as String : null
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'artist': artist,
    'url': url,
    'image': image?.map((e) => e.toJson()).toList(),
    'streamable': streamable,
    'mbid': mbid
  };

  Album clone() => Album(
    name: name,
    artist: artist,
    url: url,
    image: image?.map((e) => e.clone()).toList(),
    streamable: streamable,
    mbid: mbid
  );


  Album copyWith({
    Optional<String?>? name,
    Optional<String?>? artist,
    Optional<String?>? url,
    Optional<List<Image>?>? image,
    Optional<String?>? streamable,
    Optional<String?>? mbid
  }) => Album(
    name: checkOptional(name, this.name),
    artist: checkOptional(artist, this.artist),
    url: checkOptional(url, this.url),
    image: checkOptional(image, this.image),
    streamable: checkOptional(streamable, this.streamable),
    mbid: checkOptional(mbid, this.mbid),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Album && name == other.name && artist == other.artist && url == other.url && image == other.image && streamable == other.streamable && mbid == other.mbid;

  @override
  int get hashCode => name.hashCode ^ artist.hashCode ^ url.hashCode ^ image.hashCode ^ streamable.hashCode ^ mbid.hashCode;
}
