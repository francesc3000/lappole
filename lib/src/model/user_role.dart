enum UserRole {
  admin('admin', 3),
  manager('manager', 2),
  user('user', 1);

  const UserRole(this.name, this.level);

  final String name;
  final int level;

  @override
  toString() => name;
}
