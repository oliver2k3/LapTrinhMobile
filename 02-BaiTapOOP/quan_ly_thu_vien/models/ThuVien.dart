import '../models/Sach.dart';
import '../models/DocGia.dart';

class ThuVien {
  List<Sach> _danhSachSach = [];
  List<DocGia> _danhSachDocGia = [];

  List<Sach> get danhSachSach => _danhSachSach;
  List<DocGia> get danhSachDocGia => _danhSachDocGia;

  void themSach(Sach sach) {
    _danhSachSach.add(sach);
    print('Đã thêm sách: ${sach.tenSach}');
  }

  void themDocGia(DocGia docGia) {
    _danhSachDocGia.add(docGia);
    print('Đã thêm độc giả: ${docGia.hoTen}');
  }

  void hienThiDanhSachSach() {
    print('Danh sách sách trong thư viện:');
    for (var sach in _danhSachSach) {
      print('Mã sách: ${sach.maSach}, Tên sách: ${sach.tenSach}, Tác giả: ${sach.tacGia}, Trạng thái: ${sach.trangThai ? "Còn" : "Đã mượn"}');
    }
  }
}