abstract class CacheError implements Exception {}

class ErroGravar implements CacheError {}

class ErroRecuperar implements CacheError {}

class KeyIsMandatoryError implements CacheError {}

class ValueIsMandatoryError implements CacheError {}

class DataSourceError implements CacheError {}
