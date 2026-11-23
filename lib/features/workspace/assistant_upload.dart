import 'dart:io';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

import 'workspace.dart';

const documentTypes = ['pdf', 'docx', 'pptx', 'txt', 'md'];
const mediaTypes = [
  'mp3',
  'm4a',
  'aac',
  'wav',
  'ogg',
  'opus',
  'flac',
  'mp4',
  'mov',
  'webm',
  'mkv',
];

class SourceFile {
  SourceFile(this.file);
  final PlatformFile file;
  String? id;
  bool complete = false;

  Future<String> upload(
    Dio api,
    CancelToken cancel,
    void Function(double) progress,
  ) async {
    if (complete) return id!;
    final local = File(file.path!);
    final size = await local.length();
    final document = documentTypes.contains(file.extension?.toLowerCase());
    if (size == 0 || size > (document ? 25 : 1024) * 1024 * 1024) {
      throw const FormatException(
        'Проверьте размер файла: до 25 МБ для документа и до 1 ГБ для записи.',
      );
    }
    const partSize = 16 * 1024 * 1024;
    final count = (size / partSize).ceil();
    if (id == null) {
      final duration = document
          ? null
          : await const MethodChannel(
              'remora/media',
            ).invokeMethod<int>('duration', local.path);
      if (!document && (duration == null || duration < 1 || duration > 14400)) {
        throw const FormatException(
          'Нужна запись до четырёх часов с доступной длительностью.',
        );
      }
      final created = await api.post<Json>(
        '/api/v1/transcriptions',
        data: {
          'filename': file.name,
          'size_bytes': size,
          'total_parts': count,
          'duration_seconds': duration,
        },
        cancelToken: cancel,
      );
      id = created.data!['id'];
    }
    final path = '/api/v1/transcriptions/$id';
    final current = (await api.get<Json>(path, cancelToken: cancel)).data!;
    if (current['status'] == 'uploading') {
      final state = (await api.get<Json>(
        '$path/upload',
        cancelToken: cancel,
      )).data!;
      final uploaded = rows(
        state['uploaded_parts'],
      ).map((part) => part['part_number']).toSet();
      // В подписанный запрос к хранилищу не должны попасть заголовки авторизации кабинета.
      final storage = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 20),
          sendTimeout: const Duration(minutes: 4),
        ),
      );
      try {
        for (var part = 1; part <= count; part++) {
          if (!uploaded.contains(part)) {
            final links = await api.post<List<dynamic>>(
              '$path/upload/parts',
              data: {
                'part_numbers': [part],
              },
              cancelToken: cancel,
            );
            final url = Uri.parse(rows(links.data).single['url']);
            final start = (part - 1) * partSize;
            final end = math.min(size, start + partSize);
            await storage.putUri<void>(
              url,
              data: local.openRead(start, end),
              cancelToken: cancel,
              options: Options(
                headers: {'Content-Length': end - start},
                followRedirects: false,
              ),
              onSendProgress: (sent, _) => progress((start + sent) / size),
            );
          }
          progress(part / count);
        }
        await api.post('$path/complete', cancelToken: cancel);
      } finally {
        storage.close(force: true);
      }
    }
    complete = true;
    return id!;
  }
}
