class Kisi {
  Kisi? kisi;
  Kisi({this.kisi});

  Kisi.fromJson(Map<String, dynamic> json) {
    kisi = json['kisi'] != null ? new Kisi.fromJson(json['kisi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.kisi != null) {
      data['kisi'] = this.kisi!.toJson();
    }
    return data;
  }
}

class Kisi2 {
  KisiJson? kisiJson;

  Kisi2({this.kisiJson});

  Kisi2.fromJson(Map<String, dynamic> json) {
    kisiJson = json['kisiJson'] != null ? new KisiJson.fromJson(json['kisiJson']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.kisiJson != null) {
      data['kisiJson'] = this.kisiJson!.toJson();
    }
    return data;
  }
}

class KisiJson {
  String? email;
  String? sifre;
  KisiJson({this.email, this.sifre});
  KisiJson.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    sifre = json['sifre'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['sifre'] = this.sifre;
    return data;
  }
}
