import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class ImageToPdf extends StatefulWidget {
  const ImageToPdf({super.key});

  @override
  _ImageToPdfState createState() => _ImageToPdfState();
}

class _ImageToPdfState extends State<ImageToPdf> {
  final picker = ImagePicker();
  List<File> images = [];

  Future<void> pickImages() async {
    final pickedFiles = await picker.pickMultiImage();
    setState(() {
      images = pickedFiles.map((e) => File(e.path)).toList();
    });
  }

  Future<void> createPdf() async {
    final pdf = pw.Document();
    for (var image in images) {
      final imageBytes = await image.readAsBytes();
      final pdfImage = pw.MemoryImage(imageBytes);
      pdf.addPage(pw.Page(build: (context) => pw.Image(pdfImage)));
    }
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/output.pdf");
    await file.writeAsBytes(await pdf.save());

    final params = SaveFileDialogParams(sourceFilePath: file.path);
    await FlutterFileDialog.saveFile(params: params);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image to PDF')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(onPressed: pickImages, child: const Text('Pick Images')),
          FilledButton(onPressed: createPdf, child: const Text('Create PDF')),
        ],
      ),
    );
  }
}
