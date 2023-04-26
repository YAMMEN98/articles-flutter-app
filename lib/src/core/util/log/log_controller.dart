import 'dart:io';

import 'package:ny_times_app/src/core/common_feature/domain/entities/log_file_type.dart';
import 'package:ny_times_app/src/core/util/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:path_provider/path_provider.dart';

class LogController {
  /// Initialization log controller
  initLog() async {
    await FlutterLogs.initLogs(
      logLevelsEnabled: [
        LogLevel.INFO,
        LogLevel.WARNING,
        LogLevel.ERROR,
        LogLevel.SEVERE
      ],
      timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
      directoryStructure: DirectoryStructure.SINGLE_FILE_FOR_DAY,
      logTypesEnabled: LogFileTypeEnum.values.map((e) => e.logType).toList(),
      // logTypesEnabled: ["info", "error", "network"],
      logFileExtension: LogFileExtension.LOG,
      logsWriteDirectoryName: logFolderName,
      logSystemCrashes: true,
      zipFilesOnly: true,
      enabled: true,
      logsExportZipFileName: exportedLogZipName,
      logsExportDirectoryName: exportedLogFolderName,
      debugFileOperations: true,
      singleLogFileSize: 1,
      isDebuggable: true,
      autoClearLogs: true,
    );
  }

  /// Log message
  log(String tag, String message, LogLevel level,
      {String? subTag, Exception? exception, String? errorMessage}) {
    if (level != LogLevel.ERROR) {
      FlutterLogs.logThis(
        tag: tag,
        subTag: subTag ?? defaultStr,
        logMessage: '$message ${DateTime.now().millisecondsSinceEpoch}',
        level: level,
      );
    } else {
      FlutterLogs.logThis(
        tag: tag,
        subTag: subTag ?? defaultStr,
        level: level,
        exception: exception,
        errorMessage: errorMessage ?? defaultStr,
      );
    }
  }

  /// Log message to file
  logToFile(
    LogFileTypeEnum logFileType,
    String message,
  ) {
    FlutterLogs.logToFile(
      logFileName: logFileType.logType,
      overwrite: false,
      logMessage: "$message\n",
    );
  }

  // Check if there is exported log zip
  Future<bool> isLogFileExist(BuildContext context) async {
    Directory? appDocumentsDirectory;
    if (Platform.isIOS) {
      appDocumentsDirectory = await getApplicationDocumentsDirectory();
    } else {
      appDocumentsDirectory = await getExternalStorageDirectory();
    }

    String pathFile = '${appDocumentsDirectory!.path}/$logFolderName/';
    if (Directory(pathFile).existsSync()) {
      if (await Directory(pathFile).list().isEmpty) {
        return false;
      }
    } else {
      return false;
    }

    return true;
  }

  Future<void> exportZipFile({required Function(String?) callBack}) async {
    FlutterLogs.channel.setMethodCallHandler((call) async {
      if (call.method == 'logsExported') {
        var zipName = call.arguments.toString();
        Directory? externalDirectory;
        if (Platform.isIOS) {
          externalDirectory = await getApplicationDocumentsDirectory();
        } else {
          externalDirectory = await getExternalStorageDirectory();
        }
        String pathD = '${externalDirectory!.path}/';
        // if (!Directory(pathD).existsSync()) {
        //   Directory(pathD).create();
        // }
        File file = File("$pathD/$zipName");
        if (file.existsSync()) {
          callBack(file.path);
        } else {
          callBack(null);
        }
      } else if (call.method == 'logsPrinted') {}
    });
    FlutterLogs.exportLogs(exportType: ExportType.ALL);
  }

  // Get Exported zip log name
  Future<String?> getZipLogPath(BuildContext context) async {
    Directory? appDocumentsDirectory;
    if (Platform.isIOS) {
      appDocumentsDirectory = await getApplicationDocumentsDirectory();
    } else {
      appDocumentsDirectory = await getExternalStorageDirectory();
    }
    String pathFile =
        '${appDocumentsDirectory!.path}/$logFolderName/$exportedLogFolderName/';
    if (Directory(pathFile).existsSync()) {
      if (Directory(pathFile).listSync().isNotEmpty) {
        return Directory(pathFile).listSync().first.path;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  // Delete Exported zip log folder
  Future<void> removeOldZipLog(String pathFile) async {
    Directory? appDocumentsDirectory;
    if (Platform.isIOS) {
      appDocumentsDirectory = await getApplicationDocumentsDirectory();
    } else {
      appDocumentsDirectory = await getExternalStorageDirectory();
    }
    String pathD = '${appDocumentsDirectory!.path}/$pathFile';
    File file = File(pathD);
    if (file.existsSync()) {
      file.deleteSync();
    }
  }
}
