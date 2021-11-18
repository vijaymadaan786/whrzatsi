class Photo {
  int latitude;
  String userId;
  int longitude;
  int radius;
  int limit;
  int skip;
  String search;
  Photo({ this.latitude, this.userId,  this.longitude,  this.radius, this.limit, this.skip, this.search});

  Photo.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    userId = json['userid'];
    longitude = json['longitude'];
    radius = json['radius'];
    limit = json['limit'];
    skip = json['skip'];
    search = json['search'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['userid'] = this.userId;
    data['longitude'] = this.longitude;
    data['radius'] = this.radius;
    data['limit'] = this.limit;
    data['skip'] = this.skip;
    data['search'] = this.search;
    return data;
  }
}