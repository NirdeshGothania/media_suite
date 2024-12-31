import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_compressor/pdf_compressor.dart';

class CompressPdf extends StatefulWidget {
  const CompressPdf({super.key});

  @override
  _CompressPdfState createState() => _CompressPdfState();
}

class _CompressPdfState extends State<CompressPdf> {
  bool isLoading = false;
  String? result;

  @override
  void initState() {
    super.initState();
  }

  void _setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  Future<String> getTempPath() async {
    var dir = await getExternalStorageDirectory();
    await Directory('${dir!.path}/CompressPdfs').create(recursive: true);

    String randomString = getRandomString(10);
    String pdfFileName = '$randomString.pdf';
    return '${dir.path}/CompressPdfs/$pdfFileName';
  }

  String getRandomString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  Future<String?> openFilePicker() async {
    // Use FilePicker for picking a PDF file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      String inputPath = result.files.single.path!;
      String outputPath = await getTempPath();
      _setLoading(true);
      try {
        await PdfCompressor.compressPdfFile(
            inputPath, outputPath, CompressQuality.MEDIUM);
        return outputPath;
      } catch (e) {
        print(e);
        return 'Error';
      }
    }
    return null;
  }

  Future<void> pickPdf() async {
    setState(() {
      isLoading = true;
    });

    result = await openFilePicker().whenComplete(() {
      _setLoading(false);
    });

    setState(() {});
  }

  Future<void> compressPdf() async {
    if (result == null || result == 'Error') return;

    // Provide download option
    final params = SaveFileDialogParams(sourceFilePath: result!);
    await FlutterFileDialog.saveFile(params: params);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compress PDF')),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: pickPdf, child: const Text('Pick PDF')),
                  ElevatedButton(
                      onPressed: compressPdf,
                      child: const Text('Compress PDF')),
                  if (result != null) Text('Result: $result'),
                ],
              ),
            ),
    );
  }
}
