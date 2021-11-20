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
    this.artist,
    this.tags,
    this.name,
    this.id,
    this.mbid,
    this.releasedate,
    this.image,
    this.tracks,
    this.listeners,
    this.playcount,
    this.url,
    this.wiki,
  });

  final String? artist;
  final Tag? tags;
  final String? name;
  final String? id;
  final String? mbid;
  final String? releasedate;
  final List<Image>? image;
  final Tracks? tracks;
  final String? listeners;
  final String? playcount;
  final String? url;
  final Wiki? wiki;

  factory Albumdetail.fromJson(Map<String,dynamic> json) => Albumdetail(
    artist: json['artist'] != null ? json['artist'] as String : null,
    tags: json['tags'] != null ? Tag.fromJson(json['tags'] as Map<String, dynamic>) : null,
    name: json['name'] != null ? json['name'] as String : null,
    id: json['id'] != null ? json['id'] as String : null,
    mbid: json['mbid'] != null ? json['mbid'] as String : null,
    releasedate: json['releasedate'] != null ? json['releasedate'] as String : null,
    image: json['image'] != null ? (json['image'] as List? ?? []).map((e) => Image.fromJson(e as Map<String, dynamic>)).toList() : null,
    tracks: json['tracks'] != null ? Tracks.fromJson(json['tracks'] as Map<String, dynamic>) : null,
    listeners: json['listeners'] != null ? json['listeners'] as String : null,
    playcount: json['playcount'] != null ? json['playcount'] as String : null,
    url: json['url'] != null ? json['url'] as String : null,
    wiki: json['wiki'] != null ? Wiki.fromJson(json['wiki'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'artist': artist,
    'tags': tags?.toJson(),
    'name': name,
    'id': id,
    'mbid': mbid,
    'releasedate': releasedate,
    'image': image?.map((e) => e.toJson()).toList(),
    'tracks': tracks?.toJson(),
    'listeners': listeners,
    'playcount': playcount,
    'url': url,
    'wiki': wiki?.toJson()
  };

  Albumdetail clone() => Albumdetail(
    artist: artist,
    tags: tags?.clone(),
    name: name,
    id: id,
    mbid: mbid,
    releasedate: releasedate,
    image: image?.map((e) => e.clone()).toList(),
    tracks: tracks?.clone(),
    listeners: listeners,
    playcount: playcount,
    url: url,
    wiki: wiki?.clone()
  );


  Albumdetail copyWith({
    Optional<String?>? artist,
    Optional<Tag?>? tags,
    Optional<String?>? name,
    Optional<String?>? id,
    Optional<String?>? mbid,
    Optional<String?>? releasedate,
    Optional<List<Image>?>? image,
    Optional<Tracks?>? tracks,
    Optional<String?>? listeners,
    Optional<String?>? playcount,
    Optional<String?>? url,
    Optional<Wiki?>? wiki
  }) => Albumdetail(
    artist: checkOptional(artist, this.artist),
    tags: checkOptional(tags, this.tags),
    name: checkOptional(name, this.name),
    id: checkOptional(id, this.id),
    mbid: checkOptional(mbid, this.mbid),
    releasedate: checkOptional(releasedate, this.releasedate),
    image: checkOptional(image, this.image),
    tracks: checkOptional(tracks, this.tracks),
    listeners: checkOptional(listeners, this.listeners),
    playcount: checkOptional(playcount, this.playcount),
    url: checkOptional(url, this.url),
    wiki: checkOptional(wiki, this.wiki),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Albumdetail && artist == other.artist && tags == other.tags && name == other.name && id == other.id && mbid == other.mbid && releasedate == other.releasedate && image == other.image && tracks == other.tracks && listeners == other.listeners && playcount == other.playcount && url == other.url && wiki == other.wiki;

  @override
  int get hashCode => artist.hashCode ^ tags.hashCode ^ name.hashCode ^ id.hashCode ^ mbid.hashCode ^ releasedate.hashCode ^ image.hashCode ^ tracks.hashCode ^ listeners.hashCode ^ playcount.hashCode ^ url.hashCode ^ wiki.hashCode;
}
