import 'dart:io';
import 'package:capitalvotes/blocs/contest_bloc.dart';
import 'package:capitalvotes/blocs/nominee_with_category_entry_bloc.dart';
import 'package:capitalvotes/blocs/nominee_without_category_entry_bloc.dart';
import 'package:capitalvotes/blocs/user_profile_bloc.dart';
import 'package:capitalvotes/services/category_local_state.dart';
import 'package:capitalvotes/services/category_update_local_state.dart';
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
      addCategoryContestState,
      userProfileState,
      updateCategoryContestState,
      nomineeWithoutContestState,
      nomineeWithContestState) {
    switch (widget.location) {
      case 'add_contest':
        print('Image is: $image');
        contestState.setContestBanner = imageFileToString(image);
        popGoTo(context, '/AddContest');
        break;
      case 'edit_profile':
        print('Image is: $image');
        userProfileState.setUserImage = imageFileToString(image);
        popGoTo(context, '/EditProfile');
        break;

      case 'add_category':
        print('Image is: $image');
        addCategoryContestState.setCategoryBanner = imageFileToString(image);
        popGoTo(context, '/AddCategoryData');
        break;

      case 'update_category':
        print('Image is: $image');
        updateCategoryContestState.setCategoryBanner = imageFileToString(image);
        popGoTo(context, '/UpdateCategoryData');
        break;

      case 'add_Nominee_with_category':
        print('Image is: $image');
        popGoTo(context, '/AddNomineeWithCategory');
        break;

      case 'update_Nominee_with_category':
        print('Image is: $image');
        popGoTo(context, '/UpdateNomineeWithCategory');
        break;

      case 'add_Nominee_without_category':
        print('Image is: $image');
        popGoTo(context, '/AddNomineeWithOutCategory');
        break;

      case 'update_Nominee_without_category':
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

    LocalCategoryBlocState localCategoryBlocState =
        Provider.of<LocalCategoryBlocState>(context);

    LocalCategoryUpdateBlocState localCategoryUpdateBlocState =
        Provider.of<LocalCategoryUpdateBlocState>(context);

    NomineeWithCategoryBloc nomineeWithCategoryBloc =
        Provider.of<NomineeWithCategoryBloc>(context);

    NomineeWithOutCategoryBloc nomineeWithOutCategoryBloc =
        Provider.of<NomineeWithOutCategoryBloc>(context);

    UserProfileBloc userProfileBloc = Provider.of<UserProfileBloc>(context);

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
                      localCategoryBlocState,
                      userProfileBloc,
                      localCategoryUpdateBlocState,
                      nomineeWithOutCategoryBloc,
                      nomineeWithCategoryBloc);
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
