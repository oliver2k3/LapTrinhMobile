import 'dart:io';
import 'dart:math';

void main() {
// Hàm nhập và kiểm tra số có hợp lệ không
  double validateInput(String message) {  
    double? inputValue;
    do { 
      stdout.write(message);
      String? input = stdin.readLineSync();
       inputValue = double.tryParse(input ?? '');
      if (inputValue == null ) {
        print('Vui lòng nhập số hợp lệ.');
      }
    } while (inputValue == null);
    return inputValue;
  }
// Hàm nhập hệ số a
  double a;
  do {
    a = validateInput('Nhập hệ số a (a ≠ 0): ');
    if (a == 0) {
     print('Hệ số a phải khác 0! Vui lòng nhập lại.');
    }
  } while (a == 0);

  // Nhập hệ số b
  double b = validateInput('Nhập hệ số b: ');

  // Nhập hệ số c
  double c = validateInput('Nhập hệ số c: ');

// Tính delta
  double delta = b * b - 4 * a * c;

  if (delta > 0) {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print('Phuong trinh co hai nghiem phan biet: x1 = ${x1.toStringAsFixed(2)}, x2 = ${x2.toStringAsFixed(2)}');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print('Phuong trinh co nghiem kep: x = ${x.toStringAsFixed(2)}');
  } else {
    print('Phuong trinh vo nghiem (delta < 0).');
  }
}
