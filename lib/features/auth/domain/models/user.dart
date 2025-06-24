class User {
  final String id;
  final String name;
  final String email;
  final String? imageUrl;
  final String? bio;
  final String? phoneNumber;
  final String? createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.imageUrl,
    this.bio,
    this.phoneNumber,
    this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'imageUrl': imageUrl,
    'bio': bio,
    'phoneNumber': phoneNumber,
    'createAt': createdAt
  };

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    imageUrl: json['imageUrl'],
    bio: json['bio'],
    phoneNumber: json['phoneNumber'],
    createdAt: json['createAt']
  );
}
