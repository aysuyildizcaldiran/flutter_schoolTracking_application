import 'dart:convert';

//Hedef3 welcomeFromJson(String str) => Hedef3.fromJson(json.decode(str));
//String welcomeToJson(Hedef3 data) => json.encode(data.toJson());

class Hedef3 {
  Hedef? hedef;

  Hedef3({this.hedef});

  Hedef3.fromJson(Map<String, dynamic> json) {
    hedef = json['hedef'] != null ? Hedef.fromJson(json['hedef']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.hedef != null) {
      data['hedef'] = this.hedef!.toJson();
    }
    return data;
  }
}

class Hedef {
  Hedef2? hedef2;

  Hedef({this.hedef2});

  Hedef.fromJson(Map<String, dynamic> json) {
    hedef2 = json['Hedef2'] != null ? Hedef2.fromJson(json['Hedef2']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hedef2 != null) {
      data['Hedef2'] = this.hedef2!.toJson();
    }
    return data;
  }
}

class Hedef2 {
  int? telefon;
  ServisBtn? servisBtn;
  int? guncelleme;
  VeliizinBtn? veliizinBtn;
  String? hedefAdi;
  bool? durum;
  int? servisKota;
  int? cagrisesId;
  String? tip;
  bool? aylikOdeme;
  String? rid;
  Yer? yer;
  String? anlasma;
  DagitBtn? dagitBtn;
  int? ogrenciKota;
  double? fiyatnet;
  VeliizinBtn? idariizinBtn;
  String? logo;
  ToplaBtn? toplaBtn;
  int? ogrenciSayisi;
  VeliizinBtn? kullaniciizinBtn;
  int? cagriSesAksam;
  int? komisyon;

  Hedef2(
      {this.telefon,
      this.servisBtn,
      this.guncelleme,
      this.veliizinBtn,
      this.hedefAdi,
      this.durum,
      this.servisKota,
      this.cagrisesId,
      this.tip,
      this.aylikOdeme,
      this.rid,
      this.yer,
      this.anlasma,
      this.dagitBtn,
      this.ogrenciKota,
      this.fiyatnet,
      this.idariizinBtn,
      this.logo,
      this.toplaBtn,
      this.ogrenciSayisi,
      this.kullaniciizinBtn,
      this.cagriSesAksam,
      this.komisyon});

  Hedef2.fromJson(Map<String, dynamic> json) {
    telefon = json['telefon'];
    servisBtn = json['servisBtn'] != null ? ServisBtn.fromJson(json['servisBtn']) : null;
    guncelleme = json['guncelleme'];
    veliizinBtn = json['veliizinBtn'] != null ? new VeliizinBtn.fromJson(json['veliizinBtn']) : null;
    hedefAdi = json['hedefAdi'];
    durum = json['durum'];
    servisKota = json['servisKota'];
    cagrisesId = json['cagrisesId'];
    tip = json['tip'];
    aylikOdeme = json['aylikOdeme'];
    rid = json['rid'];
    yer = json['yer'] != null ? Yer.fromJson(json['yer']) : null;
    anlasma = json['anlasma'];
    dagitBtn = json['dagitBtn'] != null ? new DagitBtn.fromJson(json['dagitBtn']) : null;
    ogrenciKota = json['ogrenciKota'];
    fiyatnet = json['fiyatnet'];
    idariizinBtn = json['idariizinBtn'] != null ? new VeliizinBtn.fromJson(json['idariizinBtn']) : null;
    logo = json['logo'];
    toplaBtn = json['toplaBtn'] != null ? new ToplaBtn.fromJson(json['toplaBtn']) : null;
    ogrenciSayisi = json['ogrenciSayisi'];
    kullaniciizinBtn = json['kullaniciizinBtn'] != null ? new VeliizinBtn.fromJson(json['kullaniciizinBtn']) : null;
    cagriSesAksam = json['cagriSesAksam'];
    komisyon = json['komisyon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['telefon'] = this.telefon;
    if (this.servisBtn != null) {
      data['servisBtn'] = this.servisBtn!.toJson();
    }
    data['guncelleme'] = this.guncelleme;
    if (this.veliizinBtn != null) {
      data['veliizinBtn'] = this.veliizinBtn!.toJson();
    }
    data['hedefAdi'] = this.hedefAdi;
    data['durum'] = this.durum;
    data['servisKota'] = this.servisKota;
    data['cagrisesId'] = this.cagrisesId;
    data['tip'] = this.tip;
    data['aylikOdeme'] = this.aylikOdeme;
    data['rid'] = this.rid;
    if (this.yer != null) {
      data['yer'] = this.yer!.toJson();
    }
    data['anlasma'] = this.anlasma;
    if (this.dagitBtn != null) {
      data['dagitBtn'] = this.dagitBtn!.toJson();
    }
    data['ogrenciKota'] = this.ogrenciKota;
    data['fiyatnet'] = this.fiyatnet;
    if (this.idariizinBtn != null) {
      data['idariizinBtn'] = this.idariizinBtn!.toJson();
    }
    data['logo'] = this.logo;
    if (this.toplaBtn != null) {
      data['toplaBtn'] = this.toplaBtn!.toJson();
    }
    data['ogrenciSayisi'] = this.ogrenciSayisi;
    if (this.kullaniciizinBtn != null) {
      data['kullaniciizinBtn'] = this.kullaniciizinBtn!.toJson();
    }
    data['cagriSesAksam'] = this.cagriSesAksam;
    data['komisyon'] = this.komisyon;
    return data;
  }
}

//ServisBtn-baslama
class ServisBtn {
  DagitmaBitir? dagitmaBitir;
  DagitmaBasla? dagitmaBasla;
  OtoBasla? otoBasla;
  OtoBitir? otoBitir;
  ToplamaBitir? toplamaBitir;
  ToplamaBasla? toplamaBasla;

  ServisBtn({this.dagitmaBitir, this.otoBasla, this.otoBitir, this.dagitmaBasla, this.toplamaBitir, this.toplamaBasla});

  ServisBtn.fromJson(Map<String, dynamic> json) {
    dagitmaBitir = json['dagitmaBitir'] != null ? DagitmaBitir.fromJson(json['dagitmaBitir']) : null;
    otoBasla = json['otoBasla'] != null ? OtoBasla.fromJson(json['otoBasla']) : null;
    otoBitir = json['otoBitir'] != null ? OtoBitir.fromJson(json['otoBitir']) : null;
    dagitmaBasla = json['dagitmaBasla'] != null ? DagitmaBasla.fromJson(json['dagitmaBasla']) : null;
    toplamaBitir = json['toplamaBitir'] != null ? ToplamaBitir.fromJson(json['toplamaBitir']) : null;
    toplamaBasla = json['toplamaBasla'] != null ? ToplamaBasla.fromJson(json['toplamaBasla']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dagitmaBitir != null) {
      data['dagitmaBitir'] = this.dagitmaBitir!.toJson();
    }
    if (this.otoBasla != null) {
      data['otoBasla'] = this.otoBasla!.toJson();
    }
    if (this.otoBitir != null) {
      data['otoBitir'] = this.otoBitir!.toJson();
    }
    if (this.dagitmaBasla != null) {
      data['dagitmaBasla'] = this.dagitmaBasla!.toJson();
    }
    if (this.toplamaBitir != null) {
      data['toplamaBitir'] = this.toplamaBitir!.toJson();
    }
    if (this.toplamaBasla != null) {
      data['toplamaBasla'] = this.toplamaBasla!.toJson();
    }
    return data;
  }
}

class DagitmaBitir {
  String? id;
  String? mesaj;
  bool? durum;

  DagitmaBitir({this.id, this.mesaj, this.durum});

  DagitmaBitir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mesaj = json['mesaj'];
    durum = json['durum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mesaj'] = this.mesaj;
    data['durum'] = this.durum;
    return data;
  }
}

class DagitmaBasla {
  String? id;
  String? mesaj;
  bool? durum;

  DagitmaBasla({this.id, this.mesaj, this.durum});

  DagitmaBasla.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mesaj = json['mesaj'];
    durum = json['durum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['mesaj'] = this.mesaj;
    data['durum'] = this.durum;
    return data;
  }
}

class OtoBasla {
  String? id;
  String? mesaj;
  bool? durum;

  OtoBasla({this.id, this.mesaj, this.durum});

  OtoBasla.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mesaj = json['mesaj'];
    durum = json['durum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['mesaj'] = this.mesaj;
    data['durum'] = this.durum;
    return data;
  }
}

class OtoBitir {
  String? id;
  String? mesaj;
  bool? durum;

  OtoBitir({this.id, this.mesaj, this.durum});

  OtoBitir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mesaj = json['mesaj'];
    durum = json['durum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['mesaj'] = this.mesaj;
    data['durum'] = this.durum;
    return data;
  }
}

class ToplamaBitir {
  String? id;
  String? mesaj;
  bool? durum;

  ToplamaBitir({this.id, this.mesaj, this.durum});

  ToplamaBitir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mesaj = json['mesaj'];
    durum = json['durum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['mesaj'] = this.mesaj;
    data['durum'] = this.durum;
    return data;
  }
}

class ToplamaBasla {
  String? id;
  String? mesaj;
  bool? durum;

  ToplamaBasla({this.id, this.mesaj, this.durum});

  ToplamaBasla.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mesaj = json['mesaj'];
    durum = json['durum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['mesaj'] = this.mesaj;
    data['durum'] = this.durum;
    return data;
  }
}
//ServisBtn-bitiş

//VeliİzinBtn-baslama
class VeliizinBtn {
  Iki? iki;
  Uc? uc;
  Bir? bir;

  VeliizinBtn({this.iki, this.uc, this.bir});

  VeliizinBtn.fromJson(Map<String, dynamic> json) {
    iki = json['iki'] != null ? Iki.fromJson(json['iki']) : null;
    uc = json['uc'] != null ? Uc.fromJson(json['uc']) : null;
    bir = json['bir'] != null ? Bir.fromJson(json['bir']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iki != null) {
      data['iki'] = this.iki!.toJson();
    }
    if (this.uc != null) {
      data['uc'] = this.uc!.toJson();
    }
    if (this.bir != null) {
      data['bir'] = this.bir!.toJson();
    }
    return data;
  }
}

class Iki {
  int? yon;
  bool? kilit;
  bool? sms;
  String? renk;
  bool? durum;
  String? mesaj;
  String? id;

  Iki({this.yon, this.kilit, this.sms, this.renk, this.durum, this.mesaj, this.id});

  Iki.fromJson(Map<String, dynamic> json) {
    yon = json['yon'];
    kilit = json['kilit'];
    sms = json['sms'];
    renk = json['renk'];
    durum = json['durum'];
    mesaj = json['mesaj'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yon'] = this.yon;
    data['kilit'] = this.kilit;
    data['sms'] = this.sms;
    data['renk'] = this.renk;
    data['durum'] = this.durum;
    data['mesaj'] = this.mesaj;
    data['id'] = this.id;
    return data;
  }
}

class Uc {
  int? yon;
  bool? kilit;
  bool? sms;
  String? renk;
  bool? durum;
  String? mesaj;
  String? id;

  Uc({this.yon, this.kilit, this.sms, this.renk, this.durum, this.mesaj, this.id});

  Uc.fromJson(Map<String, dynamic> json) {
    yon = json['yon'];
    kilit = json['kilit'];
    sms = json['sms'];
    renk = json['renk'];
    durum = json['durum'];
    mesaj = json['mesaj'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yon'] = this.yon;
    data['kilit'] = this.kilit;
    data['sms'] = this.sms;
    data['renk'] = this.renk;
    data['durum'] = this.durum;
    data['mesaj'] = this.mesaj;
    data['id'] = this.id;
    return data;
  }
}

class Bir {
  int? yon;
  bool? kilit;
  bool? sms;
  String? renk;
  bool? durum;
  String? mesaj;
  String? id;

  Bir({this.yon, this.kilit, this.sms, this.renk, this.durum, this.mesaj, this.id});

  Bir.fromJson(Map<String, dynamic> json) {
    yon = json['yon'];
    kilit = json['kilit'];
    sms = json['sms'];
    renk = json['renk'];
    durum = json['durum'];
    mesaj = json['mesaj'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yon'] = this.yon;
    data['kilit'] = this.kilit;
    data['sms'] = this.sms;
    data['renk'] = this.renk;
    data['durum'] = this.durum;
    data['mesaj'] = this.mesaj;
    data['id'] = this.id;
    return data;
  }
}
//VeliİzinBtn-bitiş

class Yer {
  double? dLatitude;
  double? dLongitude;

  Yer({this.dLatitude, this.dLongitude});

  Yer.fromJson(Map<String, dynamic> json) {
    dLatitude = json['_latitude'];
    dLongitude = json['_longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_latitude'] = this.dLatitude;
    data['_longitude'] = this.dLongitude;
    return data;
  }
}

class DagitBtn {
  Yaklasti? yaklasti;
  Yaklasti? indi;
  Yaklasti? serviseBinmedi;
  Yaklasti? serviseBindi;

  DagitBtn({this.yaklasti, this.indi, this.serviseBinmedi, this.serviseBindi});

  DagitBtn.fromJson(Map<String, dynamic> json) {
    yaklasti = json['yaklasti'] != null ? Yaklasti.fromJson(json['yaklasti']) : null;
    indi = json['indi'] != null ? Yaklasti.fromJson(json['indi']) : null;
    serviseBinmedi = json['serviseBinmedi'] != null ? Yaklasti.fromJson(json['serviseBinmedi']) : null;
    serviseBindi = json['serviseBindi'] != null ? Yaklasti.fromJson(json['serviseBindi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.yaklasti != null) {
      data['yaklasti'] = this.yaklasti!.toJson();
    }
    if (this.indi != null) {
      data['indi'] = this.indi!.toJson();
    }
    if (this.serviseBinmedi != null) {
      data['serviseBinmedi'] = this.serviseBinmedi!.toJson();
    }
    if (this.serviseBindi != null) {
      data['serviseBindi'] = this.serviseBindi!.toJson();
    }
    return data;
  }
}

class Yaklasti {
  String? renk;
  bool? sms;
  String? kmesaj;
  String? id;
  bool? cagri;
  String? text;
  bool? kilit;
  int? yon;
  String? mesaj;

  Yaklasti({this.renk, this.sms, this.kmesaj, this.id, this.cagri, this.text, this.kilit, this.yon, this.mesaj});

  Yaklasti.fromJson(Map<String, dynamic> json) {
    renk = json['renk'];
    sms = json['sms'];
    kmesaj = json['kmesaj'];
    cagri = json['cagri'];
    id = json['id'];
    text = json['text'];
    kilit = json['kilit'];
    yon = json['yon'];
    mesaj = json['mesaj'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['renk'] = this.renk;
    data['sms'] = this.sms;
    data['kmesaj'] = this.kmesaj;
    data['id'] = this.id;
    data['cagri'] = this.cagri;
    data['text'] = this.text;
    data['kilit'] = this.kilit;
    data['yon'] = this.yon;
    data['mesaj'] = this.mesaj;
    return data;
  }
}

class ToplaBtn {
  Yaklasti? serviseBindi;
  Yaklasti? serviseBinmedi;
  Yaklasti? duragaYaklasti;
  Yaklasti? beklendiAlindi;
  Yaklasti? indi;
  Yaklasti? beklendiAlinmadi;

  ToplaBtn(
      {this.serviseBindi,
      this.serviseBinmedi,
      this.duragaYaklasti,
      this.beklendiAlindi,
      this.indi,
      this.beklendiAlinmadi});

  ToplaBtn.fromJson(Map<String, dynamic> json) {
    serviseBindi = json['serviseBindi'] != null ? new Yaklasti.fromJson(json['serviseBindi']) : null;
    serviseBinmedi = json['serviseBinmedi'] != null ? new Yaklasti.fromJson(json['serviseBinmedi']) : null;
    duragaYaklasti = json['duragaYaklasti'] != null ? new Yaklasti.fromJson(json['duragaYaklasti']) : null;
    beklendiAlindi = json['beklendiAlindi'] != null ? new Yaklasti.fromJson(json['beklendiAlindi']) : null;
    indi = json['indi'] != null ? new Yaklasti.fromJson(json['indi']) : null;
    beklendiAlinmadi = json['beklendiAlinmadi'] != null ? new Yaklasti.fromJson(json['beklendiAlinmadi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.serviseBindi != null) {
      data['serviseBindi'] = this.serviseBindi!.toJson();
    }
    if (this.serviseBinmedi != null) {
      data['serviseBinmedi'] = this.serviseBinmedi!.toJson();
    }
    if (this.duragaYaklasti != null) {
      data['duragaYaklasti'] = this.duragaYaklasti!.toJson();
    }
    if (this.beklendiAlindi != null) {
      data['beklendiAlindi'] = this.beklendiAlindi!.toJson();
    }
    if (this.indi != null) {
      data['indi'] = this.indi!.toJson();
    }
    if (this.beklendiAlinmadi != null) {
      data['beklendiAlinmadi'] = this.beklendiAlinmadi!.toJson();
    }
    return data;
  }
}
