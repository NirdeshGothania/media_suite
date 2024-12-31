import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CompressImage extends StatefulWidget {
  const CompressImage({super.key});

  @override
  _CompressImageState createState() => _CompressImageState();
}

class _CompressImageState extends State<CompressImage> {
  final ImagePicker picker = ImagePicker();
  ImageFile? originalImage;
  ImageFile? compressedImage;
  bool processing = false;
  Configuration config =
      const Configuration(quality: 50); // Adjust quality as needed

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final image = await pickedFile.readAsBytes();
      setState(() {
        originalImage = ImageFile(rawBytes: image, filePath: pickedFile.path);
        compressedImage = null; // Reset compressed image
      });
    }
  }

  Future<void> compressImage() async {
    if (originalImage == null) return;

    setState(() {
      processing = true;
    });

    // Compress the image using the image_compression_flutter package
    final params =
        ImageFileConfiguration(input: originalImage!, config: config);
    final output = await compressor.compress(params);

    setState(() {
      compressedImage = output;
      processing = false;
    });

    if (compressedImage != null) {
      // Provide download option
      final directory = await getTemporaryDirectory();
      final targetPath =
          "${directory.path}/compressed_image.${compressedImage!.extension}";

      await FlutterFileDialog.saveFile(
        params: SaveFileDialogParams(sourceFilePath: targetPath),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compress Image')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (originalImage != null) ...[
              const Text("Original Image:"),
              Image.memory(originalImage!.rawBytes),
              const SizedBox(height: 10),
              Text(
                  "Size: ${(originalImage!.sizeInBytes / 1024).toStringAsFixed(2)} KB"),
            ],
            if (compressedImage != null) ...[
              const Divider(),
              const Text("Compressed Image:"),
              Image.memory(compressedImage!.rawBytes),
              const SizedBox(height: 10),
              Text(
                  "Size: ${(compressedImage!.sizeInBytes / 1024).toStringAsFixed(2)} KB"),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickImage,
              child: const Text('Pick Image'),
            ),
            ElevatedButton(
              onPressed: compressImage,
              child: const Text('Compress Image'),
            ),
            if (processing)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
