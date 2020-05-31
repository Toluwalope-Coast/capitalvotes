import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';


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
    title: Text(title),
    elevation: 0.0,
  );
}

AppBar topAppBar2(String title, context) {
  return AppBar(
    automaticallyImplyLeading: true,
    title: Text(
      title,
      style: Theme.of(context).textTheme.headline4,
    ),
    backgroundColor: Color(0xffe2e0e5),
    iconTheme: Theme.of(context).iconTheme,
    titleSpacing: 0.0,
    elevation: 0.0,
  );
}

AppBar topAppBar3(String title, context) {
  return AppBar(
    automaticallyImplyLeading: true,
    title: Text(
      title,
      style: Theme.of(context).textTheme.headline4,
    ),
    backgroundColor: Colors.white,
    iconTheme: Theme.of(context).iconTheme,
    titleSpacing: 0.0,
    elevation: 0.0,
  );
}


// Push Page Routing

void pushGoTo(context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

// Replacement Page Routing

void replaceGoTo(context, page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

// Pop Page Routing

void popGoTo(context, page) {
  Navigator.pop(
    context,
    MaterialPageRoute(builder: (context) => page),
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
