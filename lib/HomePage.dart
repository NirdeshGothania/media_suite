import 'package:flutter/material.dart';

import 'CompressImage.dart';
import 'CompressPdf.dart';
import 'ImageToPdf.dart';
import 'PdfToImage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Media Suite')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ImageToPdf()),
              ),
              child: const Text('Image to PDF'),
            ),
            FilledButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PdfToImage()),
              ),
              child: const Text('PDF to Image'),
            ),
            FilledButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CompressPdf()),
              ),
              child: const Text('Compress PDF'),
            ),
            FilledButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CompressImage()),
              ),
              child: const Text('Compress Image'),
            ),
          ],
        ),
      ),
    );
  }
}
