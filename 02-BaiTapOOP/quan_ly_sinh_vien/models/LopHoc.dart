import '../models/SinhVien.dart';
class LopHoc{
  String _tenLop;
  List<SinhVien> _danhSachSV = [];
  LopHoc(this._tenLop);
  //Getters
  String get tenLop => _tenLop;
  List<SinhVien> get danhSachSV => _danhSachSV;
  //setter 
  set tenLop(String tenLop){
    if(tenLop.isNotEmpty){
      _tenLop = tenLop;
    }
  }
  void themSinhVien(SinhVien sv){
    _danhSachSV.add(sv);

  }
  void hienThiDanhSach(){
    print('\n-----------------------------');
    print('\n-----------------------------');

    print(' danh sach sinh vien lop $_tenLop');
    for (var sv in _danhSachSV){
    print('\n-----------------------------');
      sv.hienThiThongTin();
      print('\nXep loai: ${sv.xepLoai()}');
    }
  }
}