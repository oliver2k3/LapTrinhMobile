
import '../models/Sach.dart';
import '../models/DocGia.dart';
import '../models/ThuVien.dart';

void main() {
  group('TestBai2', () {
    test('Tạo và quản lý sách', () {
      var sach = Sach('001', 'Dart Programming', 'Author A', true);
      expect(sach.maSach, '001');
      expect(sach.tenSach, 'Dart Programming');
      expect(sach.tacGia, 'Author A');
      expect(sach.trangThai, true);
    });

    test('Kiểm tra getter/setter', () {
      var sach = Sach('002', 'Flutter Development', 'Author B', true);
      sach.tenSach = 'Advanced Flutter';
      sach.tacGia = 'Author C';
      sach.trangThai = false;
      expect(sach.tenSach, 'Advanced Flutter');
      expect(sach.tacGia, 'Author C');
      expect(sach.trangThai, false);
    });

    test('Kiểm tra quy trình mượn/trả sách', () {
      var sach = Sach('003', 'Learning Dart', 'Author D', true);
      var docGia = DocGia('DG001', 'John Doe');
      docGia.muonSach(sach);
      expect(sach.trangThai, false);
      expect(docGia.danhSachMuon.contains(sach), true);

      docGia.traSach(sach);
      expect(sach.trangThai, true);
      expect(docGia.danhSachMuon.contains(sach), false);
    });

    test('Kiểm tra quản lý thư viện', () {
      var thuVien = ThuVien();
      var sach1 = Sach('004', 'Dart Basics', 'Author E', true);
      var sach2 = Sach('005', 'Flutter Basics', 'Author F', true);
      var docGia = DocGia('DG002', 'Jane Doe');

      thuVien.themSach(sach1);
      thuVien.themSach(sach2);
      thuVien.themDocGia(docGia);

      expect(thuVien.danhSachSach.length, 2);
      expect(thuVien.danhSachDocGia.length, 1);

      thuVien.hienThiDanhSachSach();
    });
  });
}