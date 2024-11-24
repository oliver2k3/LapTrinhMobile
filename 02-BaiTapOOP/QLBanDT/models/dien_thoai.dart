class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTon;
  bool _trangThai;

  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTon, this._trangThai);


  //Getters
  String get maDienThoai => _maDienThoai;
  String get tenDienThoai => _tenDienThoai;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTon => _soLuongTon;
  bool get trangThai => _trangThai;

  //Setters

  set maDienThoai(String maDienThoai) {
    if (!RegExp(r'^DT-\d{3}$').hasMatch(maDienThoai)) {
      throw FormatException(
          'Mã điện thoại không hợp lệ. Định dạng phải là DT-XXX');
    }
    _maDienThoai = maDienThoai;
  }

  set tenDienThoai(String tenDienThoai) {
    if (tenDienThoai.isNotEmpty) {
      _tenDienThoai = tenDienThoai;
    }
  }

  set hangSanXuat(String hangSanXuat) {
    if (hangSanXuat.isNotEmpty) {
      _hangSanXuat = hangSanXuat;
    }
  }

  set giaNhap(double giaNhap) {
    if (giaNhap > 0 && giaNhap < _giaBan) {
      _giaNhap = giaNhap;
    }
  }

  set giaBan(double giaBan) {
    if (giaBan > 0 && giaBan > _giaNhap) {
      _giaBan = giaBan;
    }
  }

  set soLuongTon(int soLuongTon) {
    if (soLuongTon >= 0) {
      _soLuongTon = soLuongTon;
    }
  }

  set trangThai(bool trangThai) {
    _trangThai = trangThai;
  }

// Tính lợi nhuận dự kiến
  double loiNhuanDuKien() => _giaNhap - _giaBan;

  //Hien thi thong tin
  void hienThiThongTin() {
    print("---------------------");
     print('Mã điện thoại: $_maDienThoai');
    print('Tên điện thoại: $_tenDienThoai');
    print('Hãng sản xuất: $_hangSanXuat');
    print('Giá nhập: $_giaNhap');
    print('Giá bán: $_giaBan');
    print('Số lượng tồn kho: $_soLuongTon');

     print(
        'Trạng thái: ${_trangThai ? 'Còn kinh doanh' : 'Ngừng kinh doanh'}');
    
  }
//Kiểm tra có thể bán không

  bool kiemTraCoTheBanKhong() {
    if (_soLuongTon <= 0 || !_trangThai) return false;
    return true;
  }
}