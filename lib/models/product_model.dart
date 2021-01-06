// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.price,
    this.discountPrice,
    this.description,
    this.ingredients,
    this.packageItemsCount,
    this.weight,
    this.unit,
    this.featured,
    this.deliverable,
    this.restaurantId,
    this.categoryId,
    this.offerId,
    this.offerPrice,
    this.createdAt,
    this.updatedAt,
    this.cookTime,
    this.calorie,
    this.isHidden,
    this.customFields,
    this.hasMedia,
    this.restaurant,
    this.category,
    this.extras,
    this.extraGroups,
    this.foodReviews,
    this.media,
  });

  int id;
  String name;
  int price;
  int discountPrice;
  String description;
  dynamic ingredients;
  dynamic packageItemsCount;
  dynamic weight;
  dynamic unit;
  bool featured;
  bool deliverable;
  int restaurantId;
  int categoryId;
  int offerId;
  dynamic offerPrice;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic cookTime;
  dynamic calorie;
  int isHidden;
  List<dynamic> customFields;
  bool hasMedia;
  Restaurant restaurant;
  Category category;
  List<dynamic> extras;
  List<dynamic> extraGroups;
  List<dynamic> foodReviews;
  List<Media> media;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        discountPrice: json["discount_price"],
        description: json["description"] == null ? null : json["description"],
        ingredients: json["ingredients"],
        packageItemsCount: json["package_items_count"],
        weight: json["weight"],
        unit: json["unit"],
        featured: json["featured"],
        deliverable: json["deliverable"],
        restaurantId: json["restaurant_id"],
        categoryId: json["category_id"],
        offerId: json["offer_id"],
        offerPrice: json["offer_price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        cookTime: json["cook_time"],
        calorie: json["calorie"],
        isHidden: json["is_hidden"],
        customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
        hasMedia: json["has_media"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
        category: Category.fromJson(json["category"]),
        extras: List<dynamic>.from(json["extras"].map((x) => x)),
        extraGroups: List<dynamic>.from(json["extra_groups"].map((x) => x)),
        foodReviews: List<dynamic>.from(json["food_reviews"].map((x) => x)),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "discount_price": discountPrice,
        "description": description == null ? null : description,
        "ingredients": ingredients,
        "package_items_count": packageItemsCount,
        "weight": weight,
        "unit": unit,
        "featured": featured,
        "deliverable": deliverable,
        "restaurant_id": restaurantId,
        "category_id": categoryId,
        "offer_id": offerId,
        "offer_price": offerPrice,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "cook_time": cookTime,
        "calorie": calorie,
        "is_hidden": isHidden,
        "custom_fields": List<dynamic>.from(customFields.map((x) => x)),
        "has_media": hasMedia,
        "restaurant": restaurant.toJson(),
        "category": category.toJson(),
        "extras": List<dynamic>.from(extras.map((x) => x)),
        "extra_groups": List<dynamic>.from(extraGroups.map((x) => x)),
        "food_reviews": List<dynamic>.from(foodReviews.map((x) => x)),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.customFields,
    this.hasMedia,
    this.media,
  });

  int id;
  String name;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> customFields;
  bool hasMedia;
  List<Media> media;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
        hasMedia: json["has_media"],
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "custom_fields": List<dynamic>.from(customFields.map((x) => x)),
        "has_media": hasMedia,
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
      };
}

class Media {
  Media({
    this.id,
    this.modelType,
    this.modelId,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
    this.url,
    this.thumb,
    this.icon,
    this.formatedSize,
  });

  int id;
  String modelType;
  int modelId;
  String collectionName;
  String name;
  String fileName;
  String mimeType;
  String disk;
  int size;
  List<dynamic> manipulations;
  CustomProperties customProperties;
  List<dynamic> responsiveImages;
  int orderColumn;
  DateTime createdAt;
  DateTime updatedAt;
  String url;
  String thumb;
  String icon;
  String formatedSize;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        modelType: json["model_type"],
        modelId: json["model_id"],
        collectionName: json["collection_name"],
        name: json["name"],
        fileName: json["file_name"],
        mimeType: json["mime_type"],
        disk: json["disk"],
        size: json["size"],
        manipulations: List<dynamic>.from(json["manipulations"].map((x) => x)),
        customProperties: CustomProperties.fromJson(json["custom_properties"]),
        responsiveImages:
            List<dynamic>.from(json["responsive_images"].map((x) => x)),
        orderColumn: json["order_column"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        url: json["url"],
        thumb: json["thumb"],
        icon: json["icon"],
        formatedSize: json["formated_size"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_type": modelType,
        "model_id": modelId,
        "collection_name": collectionName,
        "name": name,
        "file_name": fileName,
        "mime_type": mimeType,
        "disk": disk,
        "size": size,
        "manipulations": List<dynamic>.from(manipulations.map((x) => x)),
        "custom_properties": customProperties.toJson(),
        "responsive_images": List<dynamic>.from(responsiveImages.map((x) => x)),
        "order_column": orderColumn,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "url": url,
        "thumb": thumb,
        "icon": icon,
        "formated_size": formatedSize,
      };
}

class CustomProperties {
  CustomProperties({
    this.uuid,
    this.userId,
    this.generatedConversions,
  });

  String uuid;
  int userId;
  GeneratedConversions generatedConversions;

  factory CustomProperties.fromJson(Map<String, dynamic> json) =>
      CustomProperties(
        uuid: json["uuid"],
        userId: json["user_id"],
        generatedConversions:
            GeneratedConversions.fromJson(json["generated_conversions"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "user_id": userId,
        "generated_conversions": generatedConversions.toJson(),
      };
}

class GeneratedConversions {
  GeneratedConversions({
    this.thumb,
    this.icon,
  });

  bool thumb;
  bool icon;

  factory GeneratedConversions.fromJson(Map<String, dynamic> json) =>
      GeneratedConversions(
        thumb: json["thumb"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "icon": icon,
      };
}

class Restaurant {
  Restaurant({
    this.id,
    this.name,
    this.description,
    this.address,
    this.latitude,
    this.longitude,
    this.phone,
    this.mobile,
    this.information,
    this.adminCommission,
    this.deliveryFee,
    this.deliveryRange,
    this.defaultTax,
    this.closed,
    this.active,
    this.availableForDelivery,
    this.createdAt,
    this.updatedAt,
    this.openingTime,
    this.preparationTime,
    this.closingTime,
    this.customFields,
    this.hasMedia,
    this.rate,
    this.media,
  });

  int id;
  String name;
  String description;
  dynamic address;
  String latitude;
  String longitude;
  dynamic phone;
  String mobile;
  dynamic information;
  int adminCommission;
  dynamic deliveryFee;
  int deliveryRange;
  int defaultTax;
  bool closed;
  bool active;
  bool availableForDelivery;
  DateTime createdAt;
  DateTime updatedAt;
  String openingTime;
  int preparationTime;
  String closingTime;
  List<dynamic> customFields;
  bool hasMedia;
  dynamic rate;
  List<Media> media;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        phone: json["phone"],
        mobile: json["mobile"],
        information: json["information"],
        adminCommission: json["admin_commission"],
        deliveryFee: json["delivery_fee"],
        deliveryRange: json["delivery_range"],
        defaultTax: json["default_tax"],
        closed: json["closed"],
        active: json["active"],
        availableForDelivery: json["available_for_delivery"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        openingTime: json["opening_time"],
        preparationTime: json["preparation_time"],
        closingTime: json["closing_time"],
        customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
        hasMedia: json["has_media"],
        rate: json["rate"],
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "phone": phone,
        "mobile": mobile,
        "information": information,
        "admin_commission": adminCommission,
        "delivery_fee": deliveryFee,
        "delivery_range": deliveryRange,
        "default_tax": defaultTax,
        "closed": closed,
        "active": active,
        "available_for_delivery": availableForDelivery,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "opening_time": openingTime,
        "preparation_time": preparationTime,
        "closing_time": closingTime,
        "custom_fields": List<dynamic>.from(customFields.map((x) => x)),
        "has_media": hasMedia,
        "rate": rate,
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
      };
}
