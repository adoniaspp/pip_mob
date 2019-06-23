import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Functions{

   static String moneyFormat(String money) {
    FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
        amount: double.parse(money),
        settings: MoneyFormatterSettings(
            symbol: 'R\$',
            thousandSeparator: '.',
            decimalSeparator: ',',
            symbolAndNumberSeparator: ' ',
            fractionDigits: 2,
            compactFormatType: CompactFormatType.short));
    return fmf.output.symbolOnLeft;
  } 


}