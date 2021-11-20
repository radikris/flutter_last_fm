import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

import 'track.dart';

@immutable
class Tracks {

  const Tracks({
    this.track,
    this.text,
  });

  final List<Track>? track;
  final String? text;

  factory Tracks.fromJson(Map<String,dynamic> json) => Tracks(
    track: json['track'] != null ? (json['track'] as List? ?? []).map((e) => Track.fromJson(e as Map<String, dynamic>)).toList() : null,
    text: json['#text'] != null ? json['#text'] as String : null
  );
  
  Map<String, dynamic> toJson() => {
    'track': track?.map((e) => e.toJson()).toList(),
    '#text': text
  };

  Tracks clone() => Tracks(
    track: track?.map((e) => e.clone()).toList(),
    text: text
  );


  Tracks copyWith({
    Optional<List<Track>?>? track,
    Optional<String?>? text
  }) => Tracks(
    track: checkOptional(track, this.track),
    text: checkOptional(text, this.text),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Tracks && track == other.track && text == other.text;

  @override
  int get hashCode => track.hashCode ^ text.hashCode;
}
