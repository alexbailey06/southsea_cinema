class UserSettings {
  final String name;
  final String address;
  final String email;
  final bool receiveNewsletter;

  const UserSettings({
    this.name = "",
    this.address = "",
    this.email = "",
    bool? receiveNewsletter,
    bool? recieveNewsletter,
  }) : receiveNewsletter = receiveNewsletter ?? recieveNewsletter ?? false;

  bool get recieveNewsletter => receiveNewsletter;
}

class UserSetting extends UserSettings {
  const UserSetting({
    super.name = "",
    super.address = "",
    super.email = "",
    bool? receiveNewsletter,
    bool? recieveNewsletter,
  }) : super(
          receiveNewsletter: receiveNewsletter ?? recieveNewsletter ?? false,
        );
}
