class BrandsResponseEntity {
  BrandsResponseEntity({
    this.results,
    this.data,
  });

  int? results;
  List<DataBrandsEntity>? data;
}

class DataBrandsEntity {
  DataBrandsEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
}
