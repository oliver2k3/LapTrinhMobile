import 'dien_thoai.dart';
import 'hoa_don.dart';
class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  //Constructor
  CuaHang(this._tenCuaHang, this._diaChi);

  //Getters
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;

  //Setters
  set tenCuaHang(String value) {
    if (value .isEmpty) {
      throw ArgumentError('Tên của hàng không để trống ');
    }
    _tenCuaHang = tenCuaHang;
  }

  set diaChi(String value) {
     if (value .isEmpty) {
      throw ArgumentError('Địa chỉ không để trống ');
    }
    _diaChi = value;
  }

  //Quản lý điện thoại
  void themDienThoai(DienThoai dt) => _danhSachDienThoai.add(dt);

  // Cập nhật thông tin điện thoại
  void capNhatThongTinDienThoai(
      String maDienThoai,
      String tenMoi,
      String hangMoi,
      double giaNhapMoi,
      double giaBanMoi,
      int soLuongTonMoi,
      bool trangThaiMoi) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDienThoai == maDienThoai) {
        dt.tenDienThoai = tenMoi;
        dt.hangSanXuat = hangMoi;
        dt.giaNhap = giaNhapMoi;
        dt.giaBan = giaBanMoi;
        dt.soLuongTon = soLuongTonMoi;
        dt.trangThai = trangThaiMoi;
        print("Thông tin điện thoại đã được cập nhật.");
        return;
      }
    }
    print("Không tìm thấy điện thoại có mã: $maDienThoai.");
  }

  // Ngừng kinh doanh điện thoại
  void ngungKinhDoanhDienThoai(String maDT) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDienThoai == maDT) {
        dt.trangThai = false;
        print("Điện thoại mã $maDT đã ngừng kinh doanh.");
        return;
      }
    }
    print("Không tìm thấy điện thoại có mã: $maDT");
  }

// Tìm kiếm điện thoại theo mã
  List<DienThoai> timKiemDienThoaiTheoMa(String ma) {
    return _danhSachDienThoai
        .where((dt) => dt.maDienThoai.toLowerCase().contains(ma.toLowerCase()))
        .toList();
  }

  // Tìm kiếm điện thoại theo tên
  List<DienThoai> timKiemDienThoaiTheoTen(String ten) {
    return _danhSachDienThoai
        .where(
            (dt) => dt.tenDienThoai.toLowerCase().contains(ten.toLowerCase()))
        .toList();
  }

  // Tìm kiếm điện thoại theo hãng
  List<DienThoai> timKiemDienThoaiTheoHang(String hang) {
    return _danhSachDienThoai
        .where(
            (dt) => dt.hangSanXuat.toLowerCase().contains(hang.toLowerCase()))
        .toList();
  }
  // Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    for (var dt in _danhSachDienThoai) {
      dt.hienThiThongTin();
    }
  }

  //Quản lý hóa đơn

  // Tạo hóa đơn mới
  void taoHoaDon(HoaDon hd) {
    if (hd.dienThoaiDuocBan.kiemTraCoTheBanKhong() &&
        hd.soLuongMua <= hd.dienThoaiDuocBan.soLuongTon) {
      _danhSachHoaDon.add(hd);
      hd.dienThoaiDuocBan.soLuongTon -= hd.soLuongMua; // Cập nhật tồn kho
    } else {
      throw Exception(
          "Không thể tạo hóa đơn. Kiểm tra tồn kho hoặc trạng thái kinh doanh.");
    }
  }
// Tìm kiếm hóa đơn theo mã
  List<HoaDon> timKiemHoaDonTheoMa(String ma) {
    return _danhSachHoaDon
        .where((hd) => hd.maHoaDon.toLowerCase().contains(ma.toLowerCase()))
        .toList();
  }

  // Tìm kiếm hóa đơn theo tên khách hàng
  List<HoaDon> timKiemHoaDonTheoTenKhachHang(String ten) {
    return _danhSachHoaDon
        .where(
            (hd) => hd.tenKhachHang.toLowerCase().contains(ten.toLowerCase()))
        .toList();
  }

  // Tìm kiếm hóa đơn theo ngày bán
  List<HoaDon> timKiemHoaDonTheoNgayBan(DateTime ngayBan) {
    return _danhSachHoaDon
        .where((hd) => hd.ngayBan.isAtSameMomentAs(ngayBan))
        .toList();
  }

  // Hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    for (var hd in _danhSachHoaDon) {
      hd.hienThiThongTinHoaDon();
    }
  }

  // Tính tổng doanh thu trong khoảng thời gian
  double tinhTongDoanhThu(DateTime ngayBatDau, DateTime ngayKetThuc) {
    return _danhSachHoaDon
        .where((hd) =>
            hd.ngayBan.isAfter(ngayBatDau) && hd.ngayBan.isBefore(ngayKetThuc))
        .fold(0, (tong, hd) => tong + hd.tinhTongTien());
  }
  // Tính tổng lợi nhuận trong khoảng thời gian
  double tinhTongLoiNhuan(DateTime ngayBatDau, DateTime ngayKetThuc) {
    return _danhSachHoaDon
        .where((hd) =>
            hd.ngayBan.isAfter(ngayBatDau) && hd.ngayBan.isBefore(ngayKetThuc))
        .fold(0, (tong, hd) => tong + hd.tinhLoiNhuanThucTe());
  }
  
  // Thống kê top điện thoại bán chạy
  Map<String, int> thongKeBanChay() {
    Map<String, int> thongKe = {};

    for (var hd in _danhSachHoaDon) {
      String maDienThoai = hd.dienThoaiDuocBan.maDienThoai;
      thongKe[maDienThoai] = (thongKe[maDienThoai] ?? 0) + hd.soLuongMua;
    }

    var topBanChay = thongKe.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Map.fromEntries(topBanChay);
  }
  // Thống kê tồn kho
  Map<String, int> thongKeTonKho() {
    return _danhSachDienThoai
        .asMap()
        .map((_, dt) => MapEntry(dt.maDienThoai, dt.soLuongTon));
  }

}