import '../models/Sach.dart';
class DocGia{
  String _maDocGia;
  String _hoTen;
  Linh<Sach> _danhSachMuon = [];
  DocGia(this._maDocGia, this._hoTen);
  String get maDocGia => _maDocGia;
  String get hoTen => _hoTen;
  List<Sach> get danhSachMuon => _danhSachMuon;
  set maDocGia(String maDocGia){
    if(maDocGia.isNotEmpty){
      _maDocGia = maDocGia;
    }
  }
  set hoTen(String hoTen){
    if(hoTen.isNotEmpty){
      _hoTen = hoTen;
    }
  }
   void muonSach(Sach sach) {
    if (!sach.trangThai) {
      print('Sách đã được mượn.');
      return;
    }
    _danhSachMuon.add(sach);
    sach.trangThai = false;
    print('Sách đã được mượn thành công.');
  }
  
  void traSach(Sach sach) {
    if (_danhSachMuon.contains(sach)) {
      _danhSachMuon.remove(sach);
      sach.trangThai = true;
      print('Sách đã được trả thành công.');
    } else {
      print('Sách không có trong danh sách mượn.');
    }
  }
}
