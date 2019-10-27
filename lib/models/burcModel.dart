class BurcModel{

  String _burcAdi;
  String _burcTarihi;
  String _burcDetay;
  String _burcBuyukResim;
  String _burcKucukResim;

  BurcModel(this._burcAdi, this._burcTarihi, this._burcDetay,
      this._burcBuyukResim, this._burcKucukResim);

  String get burcKucukResim => _burcKucukResim;

  set burcKucukResim(String value) {
    _burcKucukResim = value;
  }

  String get burcBuyukResim => _burcBuyukResim;

  set burcBuyukResim(String value) {
    _burcBuyukResim = value;
  }

  String get burcDetay => _burcDetay;

  set burcDetay(String value) {
    _burcDetay = value;
  }

  String get burcTarihi => _burcTarihi;

  set burcTarihi(String value) {
    _burcTarihi = value;
  }

  String get burcAdi => _burcAdi;

  set burcAdi(String value) {
    _burcAdi = value;
  }



}