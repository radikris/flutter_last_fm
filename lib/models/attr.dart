import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Attr {

  const Attr({
    this.rank,
  });

  final int? rank;

  factory Attr.fromJson(Map<String,dynamic> json) => Attr(
    rank: json['rank'] != null ? json['rank'] as int : null
  );
  
  Map<String, dynamic> toJson() => {
    'rank': rank
  };

  Attr clone() => Attr(
    rank: rank
  );


  Attr copyWith({
    Optional<int?>? rank
  }) => Attr(
    rank: checkOptional(rank, this.rank),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Attr && rank == other.rank;

  @override
  int get hashCode => rank.hashCode;
}
