import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf_render/pdf_render.dart';

class PdfToImage extends StatefulWidget {
  const PdfToImage({super.key});

  @override
  _PdfToImageState createState() => _PdfToImageState();
}

class _PdfToImageState extends State<PdfToImage> {
  final picker = ImagePicker();
  File? pdfFile;

  Future<void> pickPdf() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        pdfFile = File(pickedFile.path);
      });
    }
  }

  Future<void> extractImages() async {
    if (pdfFile == null) return;

    // Open PDF document
    final document = await PdfDocument.openFile(pdfFile!.path);

    for (int i = 0; i < document.pageCount; i++) {
      // Get the page from the document
      final page = await document.getPage(i);

      // Render the page as an image
      final image = await page.render();

      // Save or display the image here
      print('Rendered page $i: ${image.width}x${image.height}');
    }

    // Close the document
    document.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF to Image')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: pickPdf, child: const Text('Pick PDF')),
            ElevatedButton(
                onPressed: extractImages, child: const Text('Extract Images')),
          ],
        ),
      ),
    );
  }
}
