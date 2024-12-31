# Media Suite

## Overview
Media Suite is a mobile application designed to simplify the process of handling documents required for filling out various forms, such as job applications, exams, and personal documents. Often, when filling out forms, users are required to upload documents in specific formats (e.g., photos, Aadhar card IDs, signatures) and with size limitations. Users usually need to switch between multiple apps or websites to convert, compress, or scan these documents. Media Suite brings together all these features in one application, offering users an easy, efficient, and seamless experience.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Architecture](#architecture)
- [Frontend Implementation](#frontend-implementation)
- [Limitations and Future Plans](#limitations-and-future-plans)
- [Conclusion](#conclusion)
- [Resources](#resources)
- [Installation](#installation)
- [Usage](#usage)

## Introduction
Whenever users fill out forms for exams, job applications, or other purposes, they often need to upload documents like photos, Aadhar card IDs, signatures, and more. These documents can be in either image or PDF format, and sometimes have specific size limits. Users typically have to use multiple apps to modify the file type, compress the file, or scan documents. Media Suite brings together all these functionalities into one seamless mobile app, simplifying document management for users.

## Features
- **Image to PDF Conversion:** Converts images (e.g., photographs, Aadhar card) to PDF format in a simple and intuitive interface.
- **PDF to Image Conversion:** Converts PDF files to images for easy viewing or editing.
- **Document Compression:** Compresses images and PDF files to meet file size requirements for applications, ensuring that users don’t have to worry about file size limitations.
- **Scanning:** Enables users to scan physical documents using their phone’s camera, turning them into digital files for easy processing and submission.
- **Seamless User Interface:** A smooth and easy-to-use interface for uploading, processing, and downloading documents.

## Architecture

### Technology Stack
- **Frontend:** Flutter
- **Storage:** Local device storage (with temporary file saving)
- **Libraries/Packages Used:** 
  - `pdf_render` for rendering PDFs
  - `image_compression_flutter` for compressing images
  - `image_picker` for selecting images from the gallery
  - `flutter_file_dialog` for saving files

### Frontend Architecture
The application is built using Flutter, which allows it to run on both Android and iOS platforms. Key components of the frontend include:
- **PdfToImage:** A page that allows the user to pick a PDF and convert it into images.
- **ImageToPdf:** A page that allows the user to pick images and convert them into a PDF.
- **CompressImage:** A page for compressing images to reduce file size.
- **Scanning:** Allows the user to scan documents and save them in the correct format.

## Frontend Implementation
The frontend is implemented in Flutter with the following key features:
- **Stateful Widgets:** For handling user interaction with documents, such as selecting files and processing them.
- **Image and PDF Conversion:** Provides a seamless user experience for converting images to PDFs and PDFs to images.
- **File Compression:** Compresses files locally to meet file size restrictions.
- **Scanning Support:** Allows users to scan documents directly from the app.

## Limitations and Future Plans
### Limitations:
- **No Cloud Storage:** All documents are processed locally and are not stored in the cloud.
- **Platform Limitations:** The app may have limitations on iOS and Android platforms in terms of file handling and compression.
- **Limited File Formats:** Currently supports images and PDFs only; other document types may be added in the future.

### Future Plans:
- **Cloud Integration:** Add cloud storage options for users to save their documents for easy access across multiple devices.
- **Multi-Document Support:** Enhance the app to handle multiple documents at once, allowing users to process several files in parallel.
- **OCR Support:** Add Optical Character Recognition (OCR) to allow users to scan text documents and convert them to editable formats.

## Conclusion
Media Suite is a one-stop solution for users who frequently deal with document submissions for applications. The app combines multiple document processing features like conversion, compression, and scanning into one platform, making it a convenient tool for anyone needing to manage their application documents quickly and easily.

## Resources
- Flutter SDK
- pdf_render package
- image_compression_flutter package
- image_picker package
- flutter_file_dialog package

## Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/NirdeshGothania/MediaSuite

2. **Install frontend dependencies:**
   ```sh
   flutter pub get

3. **Run the app:**
   ```sh
   flutter run

## Usage

1. **Pick an image or PDF**: 
   - Select the document you want to work with from your gallery.

2. **Convert or Compress**: 
   - Use the respective buttons to:
     - **Convert an image to PDF**
     - **Convert a PDF to an image**
     - **Compress the document** (image or PDF)

3. **Download the processed file**: 
   - After the process is complete, download the converted or compressed file directly to your device.
