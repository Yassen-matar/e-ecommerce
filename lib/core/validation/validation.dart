import 'package:form_validator/form_validator.dart';



vailedate(String val, int min, int max, String type) {
  if (type == "username") {
    if (ValidationBuilder().minLength(5,val).build() == true) {
      return "ادخل اسم مستخدم من فضلك";
    }
  }
// /////phone
//   if (type == "phone") {
//     if (!GetUtils.isPhoneNumber(val)) {
//       return "ادخل رقم هاتف صحيح";
//     }
//   }

  if (type == "email") { 

    if (ValidationBuilder().email(val).maxLength(50).build() == true) {
      return "ادخل برديد صحيح";
    }
  }

  if (val.isEmpty) {
    return "لايوجد بيانات";
  }

  if (val.length < min) {
    return "لا يمكن اصغر $min";
  }

  if (val.length > max) {
    return "لا يمكن اكبر $max";
  }
}
