import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

import 'tag.dart';
import 'image.dart';
import 'tracks.dart';
import 'wiki.dart';

@immutable
class Albumdetail {

  const Albumdetail({
    required this.artist,
    required this.tags,
    required this.name,
    required this.image,
    required this.tracks,
    required this.listeners,
    required this.playcount,
    required this.url,
    required this.wiki,
  });

  final String artist;
  final Tag tags;
  final String name;
  final List<Image> image;
  final Tracks tracks;
  final String listeners;
  final String playcount;
  final String url;
  final Wiki wiki;

  factory Albumdetail.fromJson(Map<String,dynamic> json) => Albumdetail(
    artist: json['artist'] as String,
    tags: Tag.fromJson(json['tags'] as Map<String, dynamic>),
    name: json['name'] as String,
    image: (json['image'] as List? ?? []).map((e) => Image.fromJson(e as Map<String, dynamic>)).toList(),
    tracks: Tracks.fromJson(json['tracks'] as Map<String, dynamic>),
    listeners: json['listeners'] as String,
    playcount: json['playcount'] as String,
    url: json['url'] as String,
    wiki: Wiki.fromJson(json['wiki'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'artist': artist,
    'tags': tags.toJson(),
    'name': name,
    'image': image.map((e) => e.toJson()).toList(),
    'tracks': tracks.toJson(),
    'listeners': listeners,
    'playcount': playcount,
    'url': url,
    'wiki': wiki.toJson()
  };

  Albumdetail clone() => Albumdetail(
    artist: artist,
    tags: tags.clone(),
    name: name,
    image: image.map((e) => e.clone()).toList(),
    tracks: tracks.clone(),
    listeners: listeners,
    playcount: playcount,
    url: url,
    wiki: wiki.clone()
  );


  Albumdetail copyWith({
    String? artist,
    Tag? tags,
    String? name,
    List<Image>? image,
    Tracks? tracks,
    String? listeners,
    String? playcount,
    String? url,
    Wiki? wiki
  }) => Albumdetail(
    artist: artist ?? this.artist,
    tags: tags ?? this.tags,
    name: name ?? this.name,
    image: image ?? this.image,
    tracks: tracks ?? this.tracks,
    listeners: listeners ?? this.listeners,
    playcount: playcount ?? this.playcount,
    url: url ?? this.url,
    wiki: wiki ?? this.wiki,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Albumdetail && artist == other.artist && tags == other.tags && name == other.name && image == other.image && tracks == other.tracks && listeners == other.listeners && playcount == other.playcount && url == other.url && wiki == other.wiki;

  @override
  int get hashCode => artist.hashCode ^ tags.hashCode ^ name.hashCode ^ image.hashCode ^ tracks.hashCode ^ listeners.hashCode ^ playcount.hashCode ^ url.hashCode ^ wiki.hashCode;
}
