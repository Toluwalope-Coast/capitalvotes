import 'package:flutter/material.dart';

class AddSocialMediaForm extends StatefulWidget {

  String socialMediaLink;
  String socialMediaNetwork;


  AddSocialMediaForm({Key key, this.socialMediaLink, this.socialMediaNetwork}): super(key:key);

  @override
  _AddSocialMediaFormState createState() => _AddSocialMediaFormState();


}

class _AddSocialMediaFormState extends State<AddSocialMediaForm> {
  final socialMediaFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Media Query Responsiveness
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    final List<String> socialNetworks = [
      'Social Media',
      'Facebook',
      'Twitter',
      'Instagram',
      'Snapchat'
    ]; // for the social Network dropdown values


    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      child: Card(
        elevation: 0.0,
        child: Form(
          key: socialMediaFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
//              Container(
////                margin: EdgeInsets.only(bottom: 20.0),
//                alignment: Alignment.centerRight,
//                child: IconButton(icon: Icon(Icons.delete, color:  Color(0xffE5306C), size: 30.0),
//                    onPressed: widget.onDelete),
//              ),
//              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: screenWidth * 0.42,
                      height: screenHeight * 0.06,
                      padding: EdgeInsets.all(0.0),
                      child: TextFormField(
                          textAlignVertical:
                          TextAlignVertical.bottom,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 16.0),
                          initialValue: widget.socialMediaLink ??
                              '',
                          autovalidate: true,
                          keyboardType: TextInputType.url,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0X553D2960))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0X553D2960))),
                              hintText: 'paste link',
                              hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'poppins',
                                  color: Color(0X553D2960),
                                  fontStyle: FontStyle.italic,
                                  textBaseline:
                                  TextBaseline.alphabetic),
                              filled: true,
                              fillColor: Colors.white),
                          onChanged: (value) {
                            widget.socialMediaLink = value;
                            print('The social media link: $value');
                          }
                          )),
                  Container(
                      alignment: Alignment.topLeft,
                      width: screenWidth * 0.45,
                      height: screenHeight * 0.06,
//                            padding:  EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border:
                          Border.all(color: Color(0X553D2960)),
                          color: Colors.white),
                      constraints: BoxConstraints(
                          minWidth: screenWidth * 0.45,
                          minHeight: screenHeight * 0.06),
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 8.0,
                                  bottom: 10.0,
                                  top: 0.0),
                              border: InputBorder.none),
                          value: socialNetworks[0],
                          items: socialNetworks
                              .map((socialNetwork) =>
                              DropdownMenuItem(
                                  value: socialNetwork,
                                  child: Text(socialNetwork,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0))))
                              .toList(),
                          onChanged: (val) {
                            widget.socialMediaNetwork = val;
                            print('The social media is: $val');
                          }
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}