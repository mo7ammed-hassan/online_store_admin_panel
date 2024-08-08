class CategoryEntity {
  final String id;
  final String createdAt, updatedAt;
  final String categoryName, categoryImage;

  CategoryEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryName,
    required this.categoryImage,
  });

  // factory constructor
  factory CategoryEntity.fromJson(data) {
    return CategoryEntity(
      id: data['_id'],
      categoryName: data['name'],
      categoryImage: data['image'],
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
    );
  }

  // method to convert a CategoryEntity instance to a map to pass the db
  Map<String, dynamic> toJson() {
    return {
      'name': categoryName,
      'image': categoryImage,
    };
  }
}
