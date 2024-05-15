class GetBusinessDetails {
  final String? id;
  final String? alias;
  final String? name;
  final String? imageUrl;
  final bool? isClaimed;
  final bool? isClosed;
  final String? url;
  final String? phone;
  final String? displayPhone;
  final int? reviewCount;
  final List<Categories>? categories;
  final double? rating;
  final Location? location;
  final Coordinates? coordinates;
  final List<String>? photos;
  final String? price;
  final List<Hours>? hours;
  final List<dynamic>? transactions;

  GetBusinessDetails({
    this.id,
    this.alias,
    this.name,
    this.imageUrl,
    this.isClaimed,
    this.isClosed,
    this.url,
    this.phone,
    this.displayPhone,
    this.reviewCount,
    this.categories,
    this.rating,
    this.location,
    this.coordinates,
    this.photos,
    this.price,
    this.hours,
    this.transactions,
  });

  GetBusinessDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        alias = json['alias'] as String?,
        name = json['name'] as String?,
        imageUrl = json['image_url'] as String?,
        isClaimed = json['is_claimed'] as bool?,
        isClosed = json['is_closed'] as bool?,
        url = json['url'] as String?,
        phone = json['phone'] as String?,
        displayPhone = json['display_phone'] as String?,
        reviewCount = json['review_count'] as int?,
        categories = (json['categories'] as List?)?.map((dynamic e) => Categories.fromJson(e as Map<String,dynamic>)).toList(),
        rating = json['rating'] as double?,
        location = (json['location'] as Map<String,dynamic>?) != null ? Location.fromJson(json['location'] as Map<String,dynamic>) : null,
        coordinates = (json['coordinates'] as Map<String,dynamic>?) != null ? Coordinates.fromJson(json['coordinates'] as Map<String,dynamic>) : null,
        photos = (json['photos'] as List?)?.map((dynamic e) => e as String).toList(),
        price = json['price'] as String?,
        hours = (json['hours'] as List?)?.map((dynamic e) => Hours.fromJson(e as Map<String,dynamic>)).toList(),
        transactions = json['transactions'] as List?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'alias' : alias,
    'name' : name,
    'image_url' : imageUrl,
    'is_claimed' : isClaimed,
    'is_closed' : isClosed,
    'url' : url,
    'phone' : phone,
    'display_phone' : displayPhone,
    'review_count' : reviewCount,
    'categories' : categories?.map((e) => e.toJson()).toList(),
    'rating' : rating,
    'location' : location?.toJson(),
    'coordinates' : coordinates?.toJson(),
    'photos' : photos,
    'price' : price,
    'hours' : hours?.map((e) => e.toJson()).toList(),
    'transactions' : transactions
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

class Location {
  final String? address1;
  final String? address2;
  final String? address3;
  final String? city;
  final String? zipCode;
  final String? country;
  final String? state;
  final List<String>? displayAddress;
  final String? crossStreets;

  Location({
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.zipCode,
    this.country,
    this.state,
    this.displayAddress,
    this.crossStreets,
  });

  Location.fromJson(Map<String, dynamic> json)
      : address1 = json['address1'] as String?,
        address2 = json['address2'] as String?,
        address3 = json['address3'] as String?,
        city = json['city'] as String?,
        zipCode = json['zip_code'] as String?,
        country = json['country'] as String?,
        state = json['state'] as String?,
        displayAddress = (json['display_address'] as List?)?.map((dynamic e) => e as String).toList(),
        crossStreets = json['cross_streets'] as String?;

  Map<String, dynamic> toJson() => {
    'address1' : address1,
    'address2' : address2,
    'address3' : address3,
    'city' : city,
    'zip_code' : zipCode,
    'country' : country,
    'state' : state,
    'display_address' : displayAddress,
    'cross_streets' : crossStreets
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

class Hours {
  final List<Open>? open;
  final String? hoursType;
  final bool? isOpenNow;

  Hours({
    this.open,
    this.hoursType,
    this.isOpenNow,
  });

  Hours.fromJson(Map<String, dynamic> json)
      : open = (json['open'] as List?)?.map((dynamic e) => Open.fromJson(e as Map<String,dynamic>)).toList(),
        hoursType = json['hours_type'] as String?,
        isOpenNow = json['is_open_now'] as bool?;

  Map<String, dynamic> toJson() => {
    'open' : open?.map((e) => e.toJson()).toList(),
    'hours_type' : hoursType,
    'is_open_now' : isOpenNow
  };
}

class Open {
  final bool? isOvernight;
  final String? start;
  final String? end;
  final int? day;

  Open({
    this.isOvernight,
    this.start,
    this.end,
    this.day,
  });

  Open.fromJson(Map<String, dynamic> json)
      : isOvernight = json['is_overnight'] as bool?,
        start = json['start'] as String?,
        end = json['end'] as String?,
        day = json['day'] as int?;

  Map<String, dynamic> toJson() => {
    'is_overnight' : isOvernight,
    'start' : start,
    'end' : end,
    'day' : day
  };
}