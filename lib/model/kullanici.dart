class Kullanici {
  Kullanici? kullanici;

  Kullanici({this.kullanici});

  Kullanici.fromJson(Map<String, dynamic> json) {
    kullanici = json['kullanici'] != null ? new Kullanici.fromJson(json['kullanici']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.kullanici != null) {
      data['kullanici'] = this.kullanici!.toJson();
    }
    return data;
  }
}

class Kullanici2 {
  KullaniciJson? kullaniciJson;

  Kullanici2({this.kullaniciJson});

  Kullanici2.fromJson(Map<String, dynamic> json) {
    kullaniciJson = json['kullaniciJson'] != null ? new KullaniciJson.fromJson(json['kullaniciJson']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.kullaniciJson != null) {
      data['kullaniciJson'] = this.kullaniciJson!.toJson();
    }
    return data;
  }
}

class KullaniciJson {
  int? bildirimTel;
  String? rid;
  Kupon? kupon;
  Izin? izin;
  int? yaklastiMesafe;
  Tercih? tercih;
  bool? durum;
  Adres? adres;
  Yetki? yetki;
  String? signalId;
  String? telefon;
  String? adSoyad;
  int? guncelleme;
  Odeme? odeme;
  List<String>? hedefId;
  String? sifre;
  String? acikAdres;

  KullaniciJson(
      {this.bildirimTel,
      this.rid,
      this.kupon,
      this.izin,
      this.yaklastiMesafe,
      this.tercih,
      this.durum,
      this.adres,
      this.yetki,
      this.signalId,
      this.telefon,
      this.adSoyad,
      this.guncelleme,
      this.odeme,
      this.hedefId,
      this.sifre,
      this.acikAdres});

  KullaniciJson.fromJson(Map<String, dynamic> json) {
    bildirimTel = json['bildirimTel'];
    rid = json['rid'];
    kupon = json['kupon'] != null ? new Kupon.fromJson(json['kupon']) : null;
    izin = json['izin'] != null ? new Izin.fromJson(json['izin']) : null;
    yaklastiMesafe = json['yaklastiMesafe'];
    tercih = json['tercih'] != null ? new Tercih.fromJson(json['tercih']) : null;
    durum = json['durum'];
    adres = json['adres'] != null ? new Adres.fromJson(json['adres']) : null;
    yetki = json['yetki'] != null ? new Yetki.fromJson(json['yetki']) : null;
    signalId = json['signalId'];
    telefon = json['telefon'];
    adSoyad = json['adSoyad'];
    guncelleme = json['guncelleme'];
    odeme = json['odeme'] != null ? new Odeme.fromJson(json['odeme']) : null;
    hedefId = json['hedefId'].cast<String>();
    sifre = json['sifre'];
    acikAdres = json['acikAdres'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bildirimTel'] = this.bildirimTel;
    data['rid'] = this.rid;
    if (this.kupon != null) {
      data['kupon'] = this.kupon!.toJson();
    }
    if (this.izin != null) {
      data['izin'] = this.izin!.toJson();
    }
    data['yaklastiMesafe'] = this.yaklastiMesafe;
    if (this.tercih != null) {
      data['tercih'] = this.tercih!.toJson();
    }
    data['durum'] = this.durum;
    if (this.adres != null) {
      data['adres'] = this.adres!.toJson();
    }
    if (this.yetki != null) {
      data['yetki'] = this.yetki!.toJson();
    }
    data['signalId'] = this.signalId;
    data['telefon'] = this.telefon;
    data['adSoyad'] = this.adSoyad;
    data['guncelleme'] = this.guncelleme;
    if (this.odeme != null) {
      data['odeme'] = this.odeme!.toJson();
    }
    data['hedefId'] = this.hedefId;
    data['sifre'] = this.sifre;
    data['acikAdres'] = this.acikAdres;
    return data;
  }
}

class Kupon {
  bool? durum;
  int? indirim;
  String? kuponId;

  Kupon({this.durum, this.indirim, this.kuponId});

  Kupon.fromJson(Map<String, dynamic> json) {
    durum = json['durum'];
    indirim = json['indirim'];
    kuponId = json['kuponId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['durum'] = this.durum;
    data['indirim'] = this.indirim;
    data['kuponId'] = this.kuponId;
    return data;
  }
}

class Izin {
  int? baslaTarih;
  int? bitirTarih;

  Izin({this.baslaTarih, this.bitirTarih});

  Izin.fromJson(Map<String, dynamic> json) {
    baslaTarih = json['baslaTarih'];
    bitirTarih = json['bitirTarih'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['baslaTarih'] = this.baslaTarih;
    data['bitirTarih'] = this.bitirTarih;
    return data;
  }
}

class Tercih {
  bool? cagri;
  bool? sms;

  Tercih({this.cagri, this.sms});

  Tercih.fromJson(Map<String, dynamic> json) {
    cagri = json['cagri'];
    sms = json['sms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cagri'] = this.cagri;
    data['sms'] = this.sms;
    return data;
  }
}

class Adres {
  int? iLongitude;
  int? iLatitude;

  Adres({this.iLongitude, this.iLatitude});

  Adres.fromJson(Map<String, dynamic> json) {
    iLongitude = json['_longitude'];
    iLatitude = json['_latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_longitude'] = this.iLongitude;
    data['_latitude'] = this.iLatitude;
    return data;
  }
}

class Yetki {
  bool? sofor;
  bool? hostes;
  bool? kullanici;
  bool? admin;
  bool? idari;
  bool? veli;

  Yetki({this.sofor, this.hostes, this.kullanici, this.admin, this.idari, this.veli});

  Yetki.fromJson(Map<String, dynamic> json) {
    sofor = json['sofor'];
    hostes = json['hostes'];
    kullanici = json['kullanici'];
    admin = json['admin'];
    idari = json['idari'];
    veli = json['veli'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sofor'] = this.sofor;
    data['hostes'] = this.hostes;
    data['kullanici'] = this.kullanici;
    data['admin'] = this.admin;
    data['idari'] = this.idari;
    data['veli'] = this.veli;
    return data;
  }
}

class Odeme {
  String? odemeUniqId;
  String? paket;
  int? odenen;
  String? songun;
  int? odemeZamani;

  Odeme({this.odemeUniqId, this.paket, this.odenen, this.songun, this.odemeZamani});

  Odeme.fromJson(Map<String, dynamic> json) {
    odemeUniqId = json['odemeUniqId'];
    paket = json['paket'];
    odenen = json['odenen'];
    songun = json['songun'];
    odemeZamani = json['odemeZamani'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['odemeUniqId'] = this.odemeUniqId;
    data['paket'] = this.paket;
    data['odenen'] = this.odenen;
    data['songun'] = this.songun;
    data['odemeZamani'] = this.odemeZamani;
    return data;
  }
}
