import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

import 'track.dart';

@immutable
class Tracks {

  const Tracks({
    this.track,
  });

  final List<Track>? track;

  factory Tracks.fromJson(Map<String,dynamic> json) => Tracks(
    track: json['track'] != null ? (json['track'] as List? ?? []).map((e) => Track.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'track': track?.map((e) => e.toJson()).toList()
  };

  Tracks clone() => Tracks(
    track: track?.map((e) => e.clone()).toList()
  );


  Tracks copyWith({
    Optional<List<Track>?>? track
  }) => Tracks(
    track: checkOptional(track, this.track),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Tracks && track == other.track;

  @override
  int get hashCode => track.hashCode;
}
