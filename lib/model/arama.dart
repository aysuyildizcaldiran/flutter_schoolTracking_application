class Arama {
  Arama? arama;

  Arama({this.arama});

  Arama.fromJson(Map<String, dynamic> json) {
    arama = json['arama'] != null ? Arama.fromJson(json['arama']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (arama != null) {
      data['arama'] = arama!.toJson();
    }
    return data;
  }
}

class Arama2 {
  AramaJson? aramaJson;

  Arama2({this.aramaJson});

  Arama2.fromJson(Map<String, dynamic> json) {
    aramaJson = json['aramaJson'] != null ? AramaJson.fromJson(json['aramaJson']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (aramaJson != null) {
      data['aramaJson'] = aramaJson!.toJson();
    }
    return data;
  }
}

class AramaJson {
  int? guncelleme;
  String? text;
  String? hedefId;

  AramaJson({this.guncelleme, this.text, this.hedefId});

  AramaJson.fromJson(Map<String, dynamic> json) {
    guncelleme = json['guncelleme'];
    text = json['text'];
    hedefId = json['hedefId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guncelleme'] = guncelleme;
    data['text'] = text;
    data['hedefId'] = hedefId;
    return data;
  }
}
