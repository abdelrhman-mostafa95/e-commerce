import 'package:ecommerce_app_v2/domain/entities/AllCategoriesEntity.dart';

class AllCategoriesDto extends AllCategoriesEntity {
  AllCategoriesDto({
      super.results,
      this.metadata,
      super.data,
  this.message,
  this.statusMsg,
  });

  AllCategoriesDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataDto.fromJson(v));
      });
    }
  }
  String? message;
  String? statusMsg;
  Metadata? metadata;
}

class DataDto extends DataEntity {
  DataDto({
      super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,});

  DataDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }


}

class Metadata {
  Metadata({
      this.currentPage,
      this.numberOfPages,
      this.limit,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }

}