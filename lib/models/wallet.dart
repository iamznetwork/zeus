class Wallet {
  int? id;
  String title;
  String? blockchain;
  String? pubAddress;
  String? recoveryPhrase;
  String? description;

  Wallet(
      {this.id,
      required this.title,
      this.blockchain,
      this.pubAddress,
      this.recoveryPhrase,
      this.description});

  set setTitle(String _title) {
    title = _title;
  }

  set setUrl(String _url) {
    blockchain = _url;
  }

  set setUsername(String _username) {
    pubAddress = _username;
  }

  set setSecret(String _secret) {
    recoveryPhrase = _secret;
  }

  set setDescription(String _description) {
    description = _description;
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "url": blockchain,
      "username": pubAddress,
      "secret": recoveryPhrase,
      "description": description,
    };
  }

  @override
  String toString() {
    // return 'Dog{id: $id, name: $name, age: $age}';
    return 'Secret{id: $id, title: $title, url: $blockchain, username: $pubAddress, secret: $recoveryPhrase, description: $description}';
  }
}
