class UserModel {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

  UserModel(
    this.id, {
    required this.name,
    required this.email,
    required this.avatarUrl,
  });
}
