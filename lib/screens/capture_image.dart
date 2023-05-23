import 'dart:convert';

import 'package:college_gatekeeper/services/api_services.dart';
import 'package:college_gatekeeper/utils/show_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

import '../constants.dart';

class ImageCapture extends StatefulWidget {
  const ImageCapture({super.key});

  @override
  State<ImageCapture> createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File? imageFile;

  Future<String> getRollNumber(String base64String) async {
    try {
      Map<String, dynamic> response = await APIServices.getRollNumber(
          '/upload_image', base64String, context);
      return response['message'];
    } catch (err) {
      showSnackBar(context, err.toString());
      return "-4";
    }
  }

  Future<void> confirmRollNumberAPI(String rollNumber) async {
    try {
      Map<String, dynamic> response = await APIServices.confirmRollNumber('/confirm_roll_number', rollNumber, context);
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }

  void confirmRollNumber(BuildContext context, String base64String) async {
    String rollNumber = await getRollNumber(base64String);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Confirm Roll Number',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Source Sans Pro',
            color: kDarkBlue,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              rollNumber,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: 'Source Sans Pro',
                color: kDarkBlue,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                    _getFromCamera();
                  },
                  icon: const Icon(
                    Icons.camera,
                    size: 20,
                    color: kDarkBlue,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () async{
                    confirmRollNumberAPI(rollNumber);
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.check,
                    size: 20,
                    color: kDarkGreen,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth / 4),
              child: SizedBox(
                height: screenHeight / 19,
                width: screenWidth / 2,
                child: TextButton(
                  onPressed: _getFromCamera,
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 131, 37, 1),
                  ),
                  child: const Text(
                    "Capture ID Card",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //! to get the image from camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final img.Image image = img.decodeImage(bytes)!;
      img.grayscale(image);
      Uint8List grayscaleImageBytes = img.encodeJpg(image);
      final base64GrayscaleImage = base64Encode(grayscaleImageBytes);
      confirmRollNumber(context, base64GrayscaleImage);
    }
  }
}
