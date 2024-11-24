import '../models/cua_hang.dart';
import '../models/dien_thoai.dart';
import '../models/hoa_don.dart';

  
void main() {
  // Tạo cửa hàng
  var cuaHang = CuaHang('Cửa hàng ABC', '123 Đường Chính, TP. HCM');

  // Thêm điện thoại
  var dt1 = DienThoai('DT-001', 'iPhone 16 Pro Max', 'Apple', 28000000, 32000000, 10, true);
  var dt2 = DienThoai('DT-002', 'Samsung Galaxy S24 Ultra', 'Samsung', 26000000, 30000000, 8, true);
  
  cuaHang.themDienThoai(dt1);
  cuaHang.themDienThoai(dt2);
  print("Danh sách điện thoại ban đầu:");
  cuaHang.hienThiDanhSachDienThoai();
  // Cập nhật thông tin điện thoại
print("\nCập nhật thông tin cho điện thoại mã 'DT-002':");
  cuaHang.capNhatThongTinDienThoai(
      "DT-002", "Samsung Galaxy S24 Ultra", "Apple", 25000000, 29000000, 20, true);
  cuaHang.hienThiDanhSachDienThoai();
  // Ngừng kinh doanh điện thoại
   print("\nNgừng kinh doanh điện thoại mã 'DT-002':");
  cuaHang.ngungKinhDoanhDienThoai("DT-002");
  cuaHang.hienThiDanhSachDienThoai();

  // Tạo hóa đơn
  var hoaDon1 = HoaDon('HD-001', DateTime.now(), dt1, 2, 24000000, 'Nguyen Van A', '0123456789');
  var hoaDon2 = HoaDon('HD-002', DateTime.now(), dt2, 1, 20000000, 'Le Thi B', '0987654321');

  cuaHang.taoHoaDon(hoaDon1);
  cuaHang.taoHoaDon(hoaDon2);

  cuaHang.hienThiDanhSachHoaDon();

  // Thống kê
  print('Tổng doanh thu: ${cuaHang.tinhTongDoanhThu(DateTime(2024, 1, 1), DateTime(2024, 12, 31))}');
  print('Tổng lợi nhuận: ${cuaHang.tinhTongLoiNhuan(DateTime(2024, 1, 1), DateTime(2024, 12, 31))}');

  cuaHang.thongKeBanChay();
  cuaHang.thongKeTonKho();
}