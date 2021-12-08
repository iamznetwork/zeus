class Secret {
  int? id;
  String title;
  String? url;
  String? username;
  String? secret;
  // String? seedPhrase;
  String? description;

  Secret(
      {this.id,
      required this.title,
      this.url,
      this.username,
      this.secret,
      // this.seedPhrase,
      this.description});

  set setTitle(String _title) {
    title = _title;
  }

  set setUrl(String _url) {
    url = _url;
  }

  set setUsername(String _username) {
    username = _username;
  }

  set setSecret(String _secret) {
    secret = _secret;
  }

  set setDescription(String _description) {
    description = _description;
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "url": url,
      "username": username,
      "secret": secret,
      "description": description,
    };
  }

  @override
  String toString() {
    // return 'Dog{id: $id, name: $name, age: $age}';
    return 'Secret{id: $id, title: $title, url: $url, username: $username, secret: $secret, description: $description}';
  }
}
