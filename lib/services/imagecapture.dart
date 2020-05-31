import 'dart:io';
import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/services/category_local_state.dart';
import 'package:capitalvotes/services/category_update_local_state.dart';
import 'package:capitalvotes/services/nominee_with_category_local_state.dart';
import 'package:capitalvotes/services/nominee_with_category_update_local_state.dart';
import 'package:capitalvotes/services/nominee_without_category_local_state.dart';
import 'package:capitalvotes/services/nominee_without_category_update_local_state.dart';
import 'package:capitalvotes/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImageCapture extends StatefulWidget {
  final String location;

  ImageCapture({Key key, this.location}) : super(key: key);

  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File _imageFile;

  // select image via gallery or camera

  Future<void> _getImage(ImageSource source) async {
    File _selected = await ImagePicker.pickImage(source: source);
    setState(() {
      _imageFile = _selected;
    });
  }

  // image cropping

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        // ratioX = 1.0
        // ratioY = 1.0
        // maxWidth = 512
        //maxHeight = 512
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop It',
            toolbarColor: Color(0xaaE5306C),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false));

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  void _clear() {
    setState(() {
      _imageFile = null;
    });
  }

  _addImage(
      image,
      contestState,
      userProfileState,
      localCategoryState,
      localCategoryUpdateState,
      localNomineeWithCategoryState,
      localUpdateNomineeWithCategoryState,
      localNomineeWithoutCategoryState,
      localNomineeWithoutUpdateState) {
    switch (widget.location) {
      case 'add_contest':
        contestState.setContestBanner = imageFileToString(image);
        print('Image is: $image');
        popGoTo(context, '/AddContest');
        break;
      case 'edit_profile':
        userProfileState.setUserImage = imageFileToString(image);
        print('Image is: $image');
        popGoTo(context, '/EditProfile');
        break;
      case 'add_category':
        localCategoryState.setCategoryBanner = imageFileToString(image);
        print('Image is: $image');
        popGoTo(context, '/AddCategoryData');
        break;
      case 'update_category':
        localCategoryUpdateState.setCategoryBanner = imageFileToString(image);
        print('Image is: $image');
        popGoTo(context, '/UpdateCategoryData');
        break;
      case 'add_Nominee_with_category':
        localNomineeWithCategoryState.setNomineeImage = imageFileToString(image);
        print('Image is: $image');
        popGoTo(context, '/AddNomineeWithCategory');
        break;

      case 'update_Nominee_with_category':
        localUpdateNomineeWithCategoryState.setNomineeImage = imageFileToString(image);
        print('Image is: $image');
        popGoTo(context, '/AddNomineeWithCategory');
        break;
      case 'add_Nominee_without_category':
        localNomineeWithoutCategoryState.setNomineeImage = imageFileToString(image);
        print('Image is: $image');
        popGoTo(context, '/AddNomineeWithOutCategory');
        break;

      case 'update_Nominee_without_category':
        localNomineeWithoutUpdateState.setNomineeImage = imageFileToString(image);
        print('Image is: $image');
        popGoTo(context, '/UpdateNomineeWithOutCategory');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Media Query Responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    ContestBloc contestBloc = Provider.of<ContestBloc>(context);

    UserProfileBloc userProfileBloc = Provider.of<UserProfileBloc>(context);

    LocalCategoryBlocState localCategoryBlocState =
        Provider.of<LocalCategoryBlocState>(context);

    LocalCategoryUpdateBlocState localCategoryUpdateBlocState =
        Provider.of<LocalCategoryUpdateBlocState>(context);

    LocalNomineeWithCategoryBlocState localNomineeWithCategoryBlocState =
        Provider.of<LocalNomineeWithCategoryBlocState>(context);

    LocalUpdateNomineeWithCategoryBlocState localUpdateNomineeWithCategoryBlocState =
    Provider.of<LocalUpdateNomineeWithCategoryBlocState>(context);

    LocalNomineeWithoutCategoryBlocState localNomineeWithoutCategoryBlocState =
        Provider.of<LocalNomineeWithoutCategoryBlocState>(context);

    LocalNomineeWithoutUpdateBlocState localNomineeWithoutUpdateBlocState =
    Provider.of<LocalNomineeWithoutUpdateBlocState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Image',
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
        titleSpacing: 0.0,
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Container(
              width: screenWidth * 0.15,
              child: FlatButton(
                onPressed: () {
                  _addImage(
                      _imageFile,
                      contestBloc,
                      userProfileBloc,
                      localCategoryBlocState,
                      localCategoryUpdateBlocState,
                      localNomineeWithCategoryBlocState,
                      localUpdateNomineeWithCategoryBlocState,
                      localNomineeWithoutCategoryBlocState,
                      localNomineeWithoutUpdateBlocState);
                },
                padding: const EdgeInsets.all(0.0),
                color: Color(0xffE5306C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text('Next',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 12.0,
                        color: Colors.white)),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: screenWidth * 0.3,
            child: IconButton(
                icon: Text(
                  'Gallery',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onPressed: () => _getImage(ImageSource.gallery)),
          ),
          Container(
            width: screenWidth * 0.25,
            child: IconButton(
                icon: Text(
                  'Photo',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onPressed: () => _getImage(ImageSource.camera)),
          )
        ],
      )),
      body: ListView(
        children: <Widget>[
          Container(),
          if (_imageFile != null) ...[
            Image.file(_imageFile),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton(
                      color: Color(0xffE5306C),
                      onPressed: _cropImage,
                      child: Icon(
                        Icons.crop,
                        color: Colors.white,
                      )),
                  FlatButton(
                      color: Color(0xffE5306C),
                      onPressed: _clear,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ))
                ])
          ]
        ],
      ),
    );
  }
}
