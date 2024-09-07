class SubCategoryEntity {
  final String id;
  final String name;
  final String categoryId;

  SubCategoryEntity({
    required this.id,
    required this.name,
    required this.categoryId,
  });

  factory SubCategoryEntity.fromJson(Map<String, dynamic> json) {
    return SubCategoryEntity(
      id: json['_id'], // Assumes MongoDB's default '_id' field
      name: json['name'],
      categoryId: json['categoryId'],
    );
  }
}
