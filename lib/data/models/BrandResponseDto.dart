import '../../domain/entities/BrandsResponseEntity.dart';

class BrandResponseDto extends BrandsResponseEntity {
  BrandResponseDto({
      super.results,
      this.metadata, 
      super.data,});

  BrandResponseDto.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBrandsDto.fromJson(v));
      });
    }
  }
  Metadata? metadata;
}

class DataBrandsDto extends DataBrandsEntity {
  DataBrandsDto({
      super.id,
      super.name,
      super.slug,
      super.image,});

  DataBrandsDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

}

class Metadata {
  Metadata({
      this.currentPage, 
      this.numberOfPages, 
      this.limit, 
      this.nextPage,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    map['nextPage'] = nextPage;
    return map;
  }

}