class UserModel {
  final String? email;
  final String? name;
  final String? photo;

  UserModel({
    this.email,
    this.name,
    this.photo,
  });

  factory UserModel.copyWith(
    String? email,
    String? name,
    String? photo,
  ) {
    return UserModel(
      email: email,
      name: name,
      photo: photo,
    );
  }
}
