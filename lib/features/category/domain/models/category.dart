class Category {
  final String id;
  final String nameEn;
  final String nameAr;

  Category({required this.id, required this.nameEn, required this.nameAr});

  factory Category.fromFirestore(Map<String, dynamic> data, String documentId) {
    return Category(
      id: documentId,
      nameEn: data['name_en'] ?? '', // Handles typo er/en
      nameAr: data['name_ar'] ?? '',
    );
  }
}
