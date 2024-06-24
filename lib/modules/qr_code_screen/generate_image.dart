import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_editor/image_editor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:upi_qr_code/core/constants/constants.dart';

class ImageUtil {
  static String fontName = "";
  static Future<String> loadFont() async {
    if (!await File(
            '${(await getTemporaryDirectory()).path}/Montserrat-Regular.ttf')
        .exists()) {
      final b = await rootBundle.load(S.montserratPath);
      final File fontData = File(
          '${(await getTemporaryDirectory()).path}/Montserrat-Regular.ttf');

      fontData.writeAsBytesSync(b.buffer.asUint8List());
      fontName = await FontManager.registerFont(fontData);
    }
    return fontName;
  }

  Future<String?> downloadImage(
      String data, String? name, String? amount, String upiId) async {
    final result = await generateImage(data, name, amount, upiId);

    String path =
        'storage/emulated/0/Pictures/Upi Qr Code/${upiId}_${name ?? "-"}_${amount ?? 0}.png';
    File file = File(path);
    await file.create(recursive: true);

    file.writeAsBytesSync(result!);

    return path;
  }

  Future<Uint8List?> shareImage(
      String data, String? name, String? amount, String upiId) async {
    return await generateImage(data, name, amount, upiId);
  }

  Future<Uint8List?> generateImage(
      String data, String? name, String? amount, String upiId) async {
    ByteData? qrCodeBytes = await getQrCodeBytes(data);

    ByteData? imageBytes = await rootBundle.load(S.qrImagePath);

    if (qrCodeBytes != null) {
      final optionGroup = ImageEditorOption();
      optionGroup.outputFormat = const OutputFormat.png();

      optionGroup.addOption(
        MixImageOption(
          x: 620 - 250,
          y: 800,
          width: 500,
          height: 500,
          target: MemoryImageSource(qrCodeBytes.buffer.asUint8List()),
        ),
      );

      final textOption = AddTextOption();

      await loadFont();

      if (name != null) {
        textOption.addText(
          EditorText(
            offset: const Offset(0, 300),
            textAlign: TextAlign.center,
            text: name,
            fontSizePx: 66 - name.length ~/ 2,
            fontName: fontName, // You must register font before use.
          ),
        );
      }

      if (amount != null) {
        textOption.addText(
          EditorText(
            offset: const Offset(0, 340),
            textAlign: TextAlign.center,
            text: "$amount ₹",
            fontSizePx: 44,
            fontName: fontName, // You must register font before use.
          ),
        );
      }

      textOption.addText(
        EditorText(
          offset: const Offset(0, 670),
          textAlign: TextAlign.center,
          text: upiId,
          fontSizePx: 66 - upiId.length ~/ 2,
          fontName: fontName,
        ),
      );

      optionGroup.addOption(textOption);

      return await ImageEditor.editImage(
          image: imageBytes.buffer.asUint8List(),
          imageEditorOption: optionGroup);
    }
    return null;
  }

  Future<ByteData?> getQrCodeBytes(String data) async {
    QrCode qrCode =
        QrCode.fromData(data: data, errorCorrectLevel: QrErrorCorrectLevel.H);
    final im = QrImage(qrCode);

    ByteData? bytes = await im.toImageAsBytes(
      size: 500,
      decoration: const PrettyQrDecoration(
          shape: PrettyQrRoundedSymbol(
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
          background: Colors.white),
    );

    return bytes;
  }
}
