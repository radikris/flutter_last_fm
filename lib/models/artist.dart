import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Artist {

  const Artist({
    this.url,
    this.name,
    this.mbid,
  });

  final String? url;
  final String? name;
  final String? mbid;

  factory Artist.fromJson(Map<String,dynamic> json) => Artist(
    url: json['url'] != null ? json['url'] as String : null,
    name: json['name'] != null ? json['name'] as String : null,
    mbid: json['mbid'] != null ? json['mbid'] as String : null
  );
  
  Map<String, dynamic> toJson() => {
    'url': url,
    'name': name,
    'mbid': mbid
  };

  Artist clone() => Artist(
    url: url,
    name: name,
    mbid: mbid
  );


  Artist copyWith({
    Optional<String?>? url,
    Optional<String?>? name,
    Optional<String?>? mbid
  }) => Artist(
    url: checkOptional(url, this.url),
    name: checkOptional(name, this.name),
    mbid: checkOptional(mbid, this.mbid),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Artist && url == other.url && name == other.name && mbid == other.mbid;

  @override
  int get hashCode => url.hashCode ^ name.hashCode ^ mbid.hashCode;
}
