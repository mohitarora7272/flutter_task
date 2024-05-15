class GetBusiness {
  final List<Businesses>? businesses;
  final int? total;
  final Region? region;

  GetBusiness({
    this.businesses,
    this.total,
    this.region,
  });

  GetBusiness.fromJson(Map<String, dynamic> json)
      : businesses = (json['businesses'] as List?)?.map((dynamic e) => Businesses.fromJson(e as Map<String,dynamic>)).toList(),
        total = json['total'] as int?,
        region = (json['region'] as Map<String,dynamic>?) != null ? Region.fromJson(json['region'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'businesses' : businesses?.map((e) => e.toJson()).toList(),
    'total' : total,
    'region' : region?.toJson()
  };
}

class Businesses {
  final String? id;
  final String? alias;
  final String? name;
  final String? imageUrl;
  final bool? isClosed;
  final String? url;
  final int? reviewCount;
  final List<Categories>? categories;
  final double? rating;
  final Coordinates? coordinates;
  final List<dynamic>? transactions;
  final String? price;
  final Location? location;
  final String? phone;
  final String? displayPhone;
  final double? distance;

  Businesses({
    this.id,
    this.alias,
    this.name,
    this.imageUrl,
    this.isClosed,
    this.url,
    this.reviewCount,
    this.categories,
    this.rating,
    this.coordinates,
    this.transactions,
    this.price,
    this.location,
    this.phone,
    this.displayPhone,
    this.distance,
  });

  Businesses.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        alias = json['alias'] as String?,
        name = json['name'] as String?,
        imageUrl = json['image_url'] as String?,
        isClosed = json['is_closed'] as bool?,
        url = json['url'] as String?,
        reviewCount = json['review_count'] as int?,
        categories = (json['categories'] as List?)?.map((dynamic e) => Categories.fromJson(e as Map<String,dynamic>)).toList(),
        rating = json['rating'] as double?,
        coordinates = (json['coordinates'] as Map<String,dynamic>?) != null ? Coordinates.fromJson(json['coordinates'] as Map<String,dynamic>) : null,
        transactions = json['transactions'] as List?,
        price = json['price'] as String?,
        location = (json['location'] as Map<String,dynamic>?) != null ? Location.fromJson(json['location'] as Map<String,dynamic>) : null,
        phone = json['phone'] as String?,
        displayPhone = json['display_phone'] as String?,
        distance = json['distance'] as double?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'alias' : alias,
    'name' : name,
    'image_url' : imageUrl,
    'is_closed' : isClosed,
    'url' : url,
    'review_count' : reviewCount,
    'categories' : categories?.map((e) => e.toJson()).toList(),
    'rating' : rating,
    'coordinates' : coordinates?.toJson(),
    'transactions' : transactions,
    'price' : price,
    'location' : location?.toJson(),
    'phone' : phone,
    'display_phone' : displayPhone,
    'distance' : distance
  };
}

class Categories {
  final String? alias;
  final String? title;

  Categories({
    this.alias,
    this.title,
  });

  Categories.fromJson(Map<String, dynamic> json)
      : alias = json['alias'] as String?,
        title = json['title'] as String?;

  Map<String, dynamic> toJson() => {
    'alias' : alias,
    'title' : title
  };
}

class Coordinates {
  final double? latitude;
  final double? longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  Coordinates.fromJson(Map<String, dynamic> json)
      : latitude = json['latitude'] as double?,
        longitude = json['longitude'] as double?;

  Map<String, dynamic> toJson() => {
    'latitude' : latitude,
    'longitude' : longitude
  };
}

class Location {
  final String? address1;
  final String? address2;
  final String? address3;
  final String? city;
  final String? zipCode;
  final String? country;
  final String? state;
  final List<String>? displayAddress;

  Location({
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.zipCode,
    this.country,
    this.state,
    this.displayAddress,
  });

  Location.fromJson(Map<String, dynamic> json)
      : address1 = json['address1'] as String?,
        address2 = json['address2'] as String?,
        address3 = json['address3'] as String?,
        city = json['city'] as String?,
        zipCode = json['zip_code'] as String?,
        country = json['country'] as String?,
        state = json['state'] as String?,
        displayAddress = (json['display_address'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
    'address1' : address1,
    'address2' : address2,
    'address3' : address3,
    'city' : city,
    'zip_code' : zipCode,
    'country' : country,
    'state' : state,
    'display_address' : displayAddress
  };
}

class Region {
  final BusinessCenter? center;

  Region({
    this.center,
  });

  Region.fromJson(Map<String, dynamic> json)
      : center = (json['center'] as Map<String,dynamic>?) != null ? BusinessCenter.fromJson(json['center'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'center' : center?.toJson()
  };
}

class BusinessCenter {
  final double? longitude;
  final double? latitude;

  BusinessCenter({
    this.longitude,
    this.latitude,
  });

  BusinessCenter.fromJson(Map<String, dynamic> json)
      : longitude = json['longitude'] as double?,
        latitude = json['latitude'] as double?;

  Map<String, dynamic> toJson() => {
    'longitude' : longitude,
    'latitude' : latitude
  };
}