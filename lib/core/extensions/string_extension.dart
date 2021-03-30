
import 'package:base_structor/core/constants/custom_enums.dart';
import 'package:easy_localization/easy_localization.dart';

extension ValidatorExtension on String {
  String validControlSignIn(String value, EnumInputType type) {
    String result;
    switch (type) {
      case EnumInputType.Username:
        return value.length < 1 || value == null
            ? "Kullanıcı adı zorunludur."
            : null;
        break;
      case EnumInputType.Password:
        return value.length < 1 || value == null
            ? "Şifre alanı zorunludur."
            : null;
        break;
      default:
    }
    return result;
  }

  String validControlSignUp(String value, EnumInputType type) {
    String emailPattern =
        "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$";

    //Minimum eight characters, at least one letter, one number and one special character:
    String passwordPattern =
        "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@\$!%*#?&])[A-Za-z\d@\$!%*#?&]{8,}\$";

    //username is 8-20 characters long
    //no _ or . at the beginning
    // __ or _. or ._ or .. inside
    //allowed characters
    //no _ or . at the end
    String usernamePattern =
        "^(?=[a-zA-Z0-9._]{8,20}\$)(?!.*[_.]{2})[^_.].*[^_.]\$";

    String result;

    //TODO: Regex ile kontrol edilcek
    switch (type) {
      case EnumInputType.Email:
        return RegExp(emailPattern).hasMatch(value) ? null : "Hatalı Email";
        break;
      case EnumInputType.Name:
        return value.length >= 3
            ? null
            : "Adınızı en az 3 karakter girmelisiniz.";
        break;

      case EnumInputType.Password:
        return RegExp(passwordPattern).hasMatch(value)
            ? null
            : "Şifrenizi en az 6 karakter girmelisiniz.";
        break;

      case EnumInputType.Username:
        return RegExp(usernamePattern).hasMatch(value)
            ? null
            : "Kullanıcı adınızı en az 8-20 karakter arası olmalır."; //TODO: uyarı mesajı daha açıklayıcı yapılacak.
        break;

      default:
    }
    return result;
  }
}

extension LocaleExtension on String {
  String get locale => this.tr();
}
