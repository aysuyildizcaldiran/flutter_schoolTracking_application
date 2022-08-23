class Odeme {
  Odeme? odeme;

  Odeme({this.odeme});

  Odeme.fromJson(Map<String, dynamic> json) {
    odeme = json['odeme'] != null ? new Odeme.fromJson(json['odeme']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.odeme != null) {
      data['odeme'] = this.odeme!.toJson();
    }
    return data;
  }
}

class Odeme2 {
  OdemeJson? odemeJson;

  Odeme2({this.odemeJson});

  Odeme2.fromJson(Map<String, dynamic> json) {
    odemeJson = json['OdemeJson'] != null ? new OdemeJson.fromJson(json['OdemeJson']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.odemeJson != null) {
      data['OdemeJson'] = this.odemeJson!.toJson();
    }
    return data;
  }
}

class OdemeJson {
  String? text;
  int? guncelleme;
  String? hedefId;

  OdemeJson({this.text, this.guncelleme, this.hedefId});

  OdemeJson.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    guncelleme = json['guncelleme'];
    hedefId = json['hedefId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['guncelleme'] = this.guncelleme;
    data['hedefId'] = this.hedefId;
    return data;
  }
}
