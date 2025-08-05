import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class GenerateThumbnail {
  static Future<File> getThumbnail(String path) async {
    final filename = await VideoThumbnail.thumbnailFile(
      video: path,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.WEBP,
      quality: 100,
      maxHeight: 150,
      maxWidth: 150,
    );
    File file = File(filename!);
    return file;
  }
}
