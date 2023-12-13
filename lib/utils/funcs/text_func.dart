import 'package:flutter_spotify_ui/utils/constants/constants_uikit.dart';
import 'package:flutter_spotify_ui/utils/enum/text_enum.dart';

class UtilsFuns {
  static double getFontSize({required TextEnum style}) {
    if (style == TextEnum.title) {
      return UTILSConstants.titleSize;
    } else if (style == TextEnum.bottom) {
      return UTILSConstants.bottomText;
    }
    return UTILSConstants.commonSize;
  }
}
