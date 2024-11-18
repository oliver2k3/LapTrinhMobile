class Sach{
  String _maSach;
  String _tenSach;
  String _tacGia;
  bool _trangThai;
  Sach(this._maSach, this._tenSach, this._tacGia, this._trangThai);
//Getters
  String get maSach => _maSach;
  String get tenSach => _tenSach;
  String get tacGia => _tacGia;
  String get trangThai => _trangThai;
//Setters
  set maSach(String maSach){
    if(maSach.isNotEmpty){
      _maSach = maSach;
    }
  }
  set tenSach(String tenSach){
    if(tenSach.isNotEmpty){
      _tenSach = tenSach;
    }
  }
  set tacGia(String tacGia){
    if(tacGia.isNotEmpty){
      _tacGia = tacGia;
    }
  }
  set trangThai(bool trangThai) => _trangThai;
  void hienThiThongTin(){
    print('ma sach: $_maSach');
    print(' ten sach: $_tenSach');
    print(' tac gia: $_tacGia');
    print(' trang thai: $_trangThai');
  }
}