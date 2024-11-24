import 'dien_thoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoaiDuocBan;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoaiDuocBan, this._soLuongMua,
      this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach);

  //Getters
   String get maHoaDon => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoaiDuocBan => _dienThoaiDuocBan;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get soDienThoaiKhach => _soDienThoaiKhach;

  //Setters
  set maHoaDon(String maHoaDon) {
    if (maHoaDon.isNotEmpty && !maHoaDon.startsWith('HD-')) {
      throw FormatException(
        'Mã hóa đơn không được để trống và phải có định dạng HD-XXX !');
    }
    _maHoaDon = maHoaDon;
  }

  set ngayBan(DateTime ngayBan) {
    if (ngayBan.isAfter(DateTime.now())) {
      throw FormatException('Ngày bán không được sau ngày hiện tại');
    }
    _ngayBan = ngayBan;
  }

  set soLuongMua(int soLuongMua) {
    if (soLuongMua <= 0 || soLuongMua > dienThoaiDuocBan.soLuongTon) {
      throw ArgumentError("Số lượng mua phải > 0 và <= tồn kho.");
    }
    _soLuongMua = soLuongMua;
  }

  set giaBanThucTe(double giaBanThucTe) {
    if (giaBanThucTe < 0) {
      throw ArgumentError('Giá bạn thực tế > 0 ');
    }
    _giaBanThucTe = giaBanThucTe;
  }

  set tenKhachHang(String tenKhachHang) {
    if (tenKhachHang.isEmpty) {
       throw ArgumentError('Tên khách hàng không được để trống ');
    }
     _tenKhachHang = tenKhachHang;
  }

  set soDienThoaiKhach(String sdt) {
    if (RegExp(r'^\d{11}$').hasMatch(sdt) && sdt.isNotEmpty) {
      _soDienThoaiKhach = sdt;
    }
  }
// Tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() =>
      _soLuongMua * (_giaBanThucTe - _dienThoaiDuocBan.giaNhap);
// Tính tổng tiền
  double tinhTongTien() => _soLuongMua * _giaBanThucTe;

  void hienThiThongTinHoaDon() {
   print("Mã hóa đơn: $_maHoaDon");
    print("Ngày bán: ${_ngayBan.toLocal()}");
    print("Điện thoại đã bán: ${_dienThoaiDuocBan.maDienThoai}");
    print("Số lượng mua: $_soLuongMua");
    print("Giá bán thực tế: ${_giaBanThucTe}");
    print("Tên khách hàng: $_tenKhachHang");
    print("Số điện thoại khách hàng: $_soDienThoaiKhach");
    print("Tổng tiền: ${tinhTongTien()}");
  }
}