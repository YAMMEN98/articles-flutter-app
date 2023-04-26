enum LogFileTypeEnum {
  network,
  error,
  info,
}

extension LogFileTypeEnumExtension on LogFileTypeEnum {
  String get logType {
    switch (this) {
      case LogFileTypeEnum.network:
        return "network";
      case LogFileTypeEnum.error:
        return "error";
      case LogFileTypeEnum.info:
        return "info";
      default:
        return "network";
    }
  }
}
