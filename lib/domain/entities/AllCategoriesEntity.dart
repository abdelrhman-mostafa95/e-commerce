class AllCategoriesEntity {
  AllCategoriesEntity({
      this.results, 
      this.data,});
  int? results;
  List<DataEntity>? data;

}

class DataEntity {
  DataEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      this.createdAt, 
      this.updatedAt,});

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

}

