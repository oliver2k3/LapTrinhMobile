import '../models/SinhVien.dart';
import '../models/LopHoc.dart';
void main(){
  var sv= SinhVien('Nguyen Van A', 20, 'SV001', 8.5);
  print('Test getter: ${sv.hoTen}');
  sv.hoTen = 'Nguyen Van B';
  print(' Sau khi set: ${sv.hoTen}');
  print(' Xep loai: ${sv.xepLoai()}');
  var lop = LopHoc('21DTHD5');
  lop.themSinhVien(SinhVien('Nguyen Van A', 20, 'SV001', 8.5));
  lop.themSinhVien(SinhVien('Nguyen Van B', 20, 'SV002', 6.5));
  lop.hienThiDanhSach();
}