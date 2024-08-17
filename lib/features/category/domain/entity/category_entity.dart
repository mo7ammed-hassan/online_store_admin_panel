class CategoryEntity {
  final String id;
  final String name;
  final String imageUrl;
  final String createdAt, updatedAt;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });
}
