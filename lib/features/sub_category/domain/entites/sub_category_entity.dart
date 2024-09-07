class SubCategoryEntity {
  final String id;
  final String name;
  final String categoryId;
  final String createdAt;
  final String updatedAt;

  SubCategoryEntity({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubCategoryEntity.fromJson(Map<String, dynamic> json) {
    return SubCategoryEntity(
      id: json['_id'], // Assumes MongoDB's default '_id' field
      name: json['name'],
      categoryId: json['categoryId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
