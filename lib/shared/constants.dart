import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:capitalvotes/pages/add_category_data.dart';
import 'package:capitalvotes/services/imageCapture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'multiline_textField.dart';


// advert top containers
Widget advertContainer() {
  AssetImage advertImage =
      AssetImage('images/container_image_3.png'); //add image here  6001 X 834
  Image imageDimensions = Image(image: advertImage, fit: BoxFit.fill);
  return Container(child: imageDimensions);
}

//Top  Navigation bar

AppBar topAppBar(String title) {
  return AppBar(
    automaticallyImplyLeading: true,
    title: Text(title, style: TextStyle(fontSize: 16.0)),
    elevation: 0.0,
  );
}

AppBar topAppBar2(String title, context) {
  return AppBar(
    automaticallyImplyLeading: true,
    title: Text(title, style: TextStyle(fontSize: 16.0)),
    titleSpacing: 0.0,
    elevation: 0.0,
  );
}

AppBar topAppBar3(String title, context) {
  return AppBar(
    automaticallyImplyLeading: true,
    title: Text(title, style: TextStyle(fontSize: 16.0)),
    titleSpacing: 0.0,
    elevation: 0.0,
  );
}


// Push Page Routing

 pushGoTo(context, page) {
  Navigator.pushNamed(context, page);
}

void navigateToAddCategory(context, String value) {

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddCategoryData(categoryIndex: value)),
  );
}




// Replacement Page Routing

void replaceGoTo(context, page) {
  Navigator.pushReplacementNamed(context, page);
}

// Pop Page Routing

void popGoTo(context, page) {
  Navigator.popAndPushNamed(context, page);
}

// routing with dsta

void navigateToMultilineText(context, String value) {

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MultiLineTextField(location: value)),
  );
}

void navigateToImageCapture(context, String value) {

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ImageCapture(location: value)),
  );
}




void cardWidget() {
  Card(
    child: Stack(
      children: <Widget>[
        Positioned.fill(child: Image.asset('images/contestant_1')),
        Positioned(
          bottom: 0,
          child: Container(
            color: Color(0x77E5306C),
            child: Center(
              child: Text(
                'Chloe Hermann',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'poppins'),
              ),
            ),
          ),
        )
      ],
    ),
  );
}


// ***********************        Images Functions          **********************

// image Compressor

Future<List<int>> imageIntCompressToIntList(List<int> list) async {
  var result = await FlutterImageCompress.compressWithList(
    list,
    minHeight: 1920,
    minWidth: 1080,
    quality: 96,
    rotate: 135,
  );
  print(list.length);
  print(result.length);
  return result;
}


// Image Converter


String imageFileToString (File imageFile) {

//  List<int> imageBytes;

  List<int> uncompressImageBytes = imageFile.readAsBytesSync();

//   imageIntCompressToIntList(uncompressImageBytes).then((List<int> result) =>  imageBytes = result);

      return base64Encode(uncompressImageBytes);
}

Uint8List stringToImageFile (String imageString) {
  return base64Decode(imageString);
}

String convertDateToMonth(date) {
  List months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  int currentMonth = int.parse(date.substring(5, 7));
  int currentYear = date.substring(date.indexOf('/')+1, date.indexOf('/'));
  String month = months[currentMonth].toString();
  print(month);

  return '$month + $currentYear';

}