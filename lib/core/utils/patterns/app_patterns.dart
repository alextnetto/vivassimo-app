import 'package:my_app/core/utils/enums/credit_card_enum.dart';

class AppPatterns {
  static Map<CardBrand, Set<List<String>>> cardNumPatterns = <CardBrand, Set<List<String>>>{
    CardBrand.visa: <List<String>>{
      <String>['4'],
    },
    CardBrand.americanExpress: <List<String>>{
      <String>['34'],
      <String>['37'],
    },
    CardBrand.discover: <List<String>>{
      <String>['6011'],
      <String>['622126', '622925'],
      <String>['644', '649'],
      <String>['65']
    },
    CardBrand.mastercard: <List<String>>{
      <String>['51', '55'],
      <String>['2221', '2229'],
      <String>['223', '229'],
      <String>['23', '26'],
      <String>['270', '271'],
      <String>['2720'],
    },
  };
}
