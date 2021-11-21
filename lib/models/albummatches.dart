import 'package:flutter/foundation.dart';
import 'index.dart';

import 'album.dart';

@immutable
class Albummatches {
  const Albummatches({
    required this.album,
  });

  final List<Album> album;

  factory Albummatches.fromJson(Map<String, dynamic> json) => Albummatches(
      album: (json['album'] as List? ?? []).map((e) => Album.fromJson(e as Map<String, dynamic>)).toList());

  Map<String, dynamic> toJson() => {'album': album.map((e) => e.toJson()).toList()};

  Albummatches clone() => Albummatches(album: album.map((e) => e.clone()).toList());

  Albummatches copyWith({List<Album>? album}) => Albummatches(
        album: album ?? this.album,
      );

  @override
  bool operator ==(Object other) => identical(this, other) || other is Albummatches && album == other.album;

  @override
  int get hashCode => album.hashCode;
}
