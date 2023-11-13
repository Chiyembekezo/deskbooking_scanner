import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../routes/imports.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  bool isProcessing = false;

  // Function to handle QR code scanning
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (!isProcessing) {
        isProcessing = true;
        await _handleScanData(scanData as String);
        isProcessing = false;
      }
    });
  }

  // Function to handle scanned data and post to API
  Future<void> _handleScanData(String scanData) async {
    final int userId = int.tryParse(scanData) ?? 0; // Parse the scanned data

    if (userId != 0) {
      final Map<String, dynamic> requestBody = {"user_id": userId};
      final response = await http.post(
        Uri.parse('YOUR_API_ENDPOINT_URL'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("Response from API: $responseData");
        // Handle the response data as needed
      } else {
        print("Error sending data to API. Status code: ${response.statusCode}");
      }
    } else {
      print("Invalid QR code data.");
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }
}
