class CategoryId {
  final String? id;
  final String? name;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  CategoryId({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'image': image,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
