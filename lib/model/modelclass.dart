import 'dart:convert';

import 'dart:core';

import 'dart:core';

import 'package:flutter/foundation.dart';

class Model {
  String id;
  String maxFavourites;

  Model({this.id, this.maxFavourites});

  factory Model.fromJson(Map<String, dynamic> json) =>
      new Model( id: json["_id"], maxFavourites: json["maxFavourites"]);

  Map<String, dynamic> toJson() => {"_id": id, "maxFavourites": maxFavourites};

  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Model &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          maxFavourites == other.maxFavourites;

  int get hashCode => id.hashCode ^ maxFavourites.hashCode;
}
