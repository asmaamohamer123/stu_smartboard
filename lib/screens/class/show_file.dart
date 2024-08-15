// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PDFScreen extends StatelessWidget {
  final String url;

  PDFScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Viewer'),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         _flutterMediaDownloaderPlugin.downloadMedia(context, url);
        //       },
        //       icon: Icon(Icons.download))
        // ],
      ),
      body: FutureBuilder<File>(
        future: _downloadPDF(url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return PDFView(filePath: snapshot.data!.path);
            } else {
              return Center(child: Text('Error loading PDF'));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<File> _downloadPDF(String url) async {
    final response = await http.get(Uri.parse(url));
    final file = File('${(await getTemporaryDirectory()).path}/temp.pdf');
    await file.writeAsBytes(response.bodyBytes);
    print(file);
    return file;
  }
}

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class PDFScreen extends StatelessWidget {
//   final String url;
//   PDFScreen(this.url);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: WebViewWidget(
//         controller: WebViewController()
//           ..loadRequest(Uri.parse(
//               "chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://firebasestorage.googleapis.com/v0/b/smart-board-9c23c.appspot.com/o/content_files%2FCloud%20computing.pdf?alt=media&token=6ec18c67-40ab-4048-9ecc-6358fccdd161")),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'dart:io';
// import 'package:http/http.dart' as http;

// class PDFScreen extends StatefulWidget {
//   final String fileRefPath; // Pass the path of the file in Firebase Storage

//   PDFScreen( this.fileRefPath);

//   @override
//   _PDFScreenState createState() => _PDFScreenState();
// }

// class _PDFScreenState extends State<PDFScreen> {
//   File? pdfFile; // Make pdfFile nullable
//   bool isLoading = true; // Flag to track loading state
//   String? errorMessage; // To store any error messages

//   @override
//   void initState() {
//     super.initState();
//     _downloadAndSavePDF(widget.fileRefPath);
//   }

//   Future<void> _downloadAndSavePDF(String fileRefPath) async {
//     try {
//       // Get reference to the file in Firebase Storage
//       FirebaseStorage storage = FirebaseStorage.instance;
//       Reference fileRef = storage.ref().child(fileRefPath);

//       // Get the download URL
//       String url = await fileRef.getDownloadURL();

//       // Download the file
//       final http.Response response = await http.get(Uri.parse(url));
//       final Directory tempDir = await getTemporaryDirectory();
//       final String tempPath = '${tempDir.path}/temp.pdf';
//       pdfFile = File(tempPath);

//       // Write the file to the local file system
//       await pdfFile!.writeAsBytes(response.bodyBytes);

//       // Update the UI to display the PDF
//       setState(() {
//         isLoading = false;
//       });
//     } catch (e) {
//       // Handle errors and update UI
//       print('Error downloading PDF: $e');
//       setState(() {
//         isLoading = false;
//         errorMessage = 'Failed to load PDF'; // Set a user-friendly error message
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : pdfFile != null
//               ? SfPdfViewer.file(pdfFile!)
//               : Center(child: Text(errorMessage ?? 'Failed to load PDF')),
//     );
//   }
// }
