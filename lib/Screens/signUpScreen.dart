import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:login/CommonClasses/commonClasses.dart';
import 'package:login/CustomeWidget/textFormField.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

// ignore: camel_case_types
class signUpScreen extends StatefulWidget {
  //const signUpScreen({Key key}) : super(key: key);

  //Creating Variables
  @override
  _signUpScreenState createState() => _signUpScreenState();
}

// ignore: camel_case_types
class _signUpScreenState extends State<signUpScreen> {
  ///Creating Variables

  TextEditingController fNameController = TextEditingController();
  Color tcColor = Colors.transparent;
  bool isTapped = false;
  static const gender = <String>['male', 'female', 'other'];
  File _imageFile;
  String urlNo = 'tel:+9192385187736767';
  DateTime selectDate = DateTime.now();

  // picking Date from DatePicker
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2025));
    if (pickedDate != null && pickedDate != selectDate) {
      setState(() {
        selectDate = pickedDate;
      });
    }
  }

  // DropDown Gender Buttn Function
  final List<DropdownMenuItem<String>> _dropDowngender = gender
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();
  String selectd = 'male';
  Color enableColor = Colors.white;

  // Picking up Image from GALLERY function
  Future<Null> _pickImageFromGallery() async {
    final File imageFile =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this._imageFile = imageFile;
    });
  }

  // Picking up Image from CAMERA function
  Future<Null> _pickImageFromCamera() async {
    final File imageFile =
        await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      this._imageFile = imageFile;
    });
  }

  // Call function
  Future<void> callNow() async {
    if (await canLaunch(urlNo)) {
      await launch(urlNo);
    } else {
      throw 'call not possible';
    }
  }

//  NAvigate to full Screen Image

  void _showFullScreenPage(BuildContext context, File _imageFile) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Scaffold(
              body: Center(
                child: InteractiveViewer(
                  panEnabled: true,
                  boundaryMargin: EdgeInsets.all(10),
                  minScale: 0.5,
                  maxScale: 10,
                  child: Hero(
                      tag: "my_hero_tag_animation",
                      child: Image.file(_imageFile)),
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
                //fit: StackFit.expand,
                children: [
                  Container(
                    height: size.height * 0.77,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(50),
                            bottomStart: Radius.circular(50))),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 200, left: 30),
                    // height: size.height * 0.70,
                    decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(50),
                            bottomStart: Radius.circular(50))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("First name"),
                        SizedBox(
                          height: 4,
                        ),
                        customeTextFormField(
                          //controller: _emailCotroller,
                          fontWeight: FontWeight.bold,
                          hintText: "Ex: Alexa",
                          obscuretext: false, textColor: Colors.white70,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Last name"),
                        SizedBox(
                          height: 4,
                        ),
                        customeTextFormField(
                          // controller: _passwordController,
                          hintText: "Ex. Bliss",
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white70,
                          obscuretext: false,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text("Gendner"),
                            SizedBox(
                              width: 30,
                            ),
                            DropdownButton<String>(
                              iconSize: 15.0,
                              autofocus: true,
                              dropdownColor: Colors.red,
                              icon: Icon(Icons.person),
                              //elevation: 10,
                              focusColor: Colors.transparent,
                              isDense: true,
                              iconEnabledColor: enableColor,
                              //iconDisabledColor: Colors.pink,
                              items: this._dropDowngender,
                              value: selectd,
                              onChanged: (String newValue) {
                                setState(() {
                                  selectd = newValue;
                                  if (selectd == 'male') {
                                    return enableColor = Colors.white;
                                  } else if (selectd == 'female') {
                                    return enableColor = Colors.yellowAccent;
                                  } else if (selectd == 'other') {
                                    return enableColor = Colors.black;
                                  }
                                });
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Enter your email"),
                        SizedBox(
                          height: 4,
                        ),
                        customeTextFormField(
                          // controller: _passwordController,
                          hintText: "Ex.someone@example.com",
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white70,
                          obscuretext: false,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Enter your password"),
                        SizedBox(
                          height: 4,
                        ),
                        customeTextFormField(
                          // controller: _passwordController,
                          hintText: "********",
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white70,
                          obscuretext: true,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Reenter your password"),
                        SizedBox(
                          height: 4,
                        ),
                        customeTextFormField(
                          // controller: _passwordController,
                          hintText: "********",
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white70,
                          obscuretext: true,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Date of birth"),
                        Container(
                          //color: Colors.black,
                          height: 30,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            textBaseline: TextBaseline.ideographic,
                            children: [
                              Text("${selectDate.toLocal()}".split(' ')[0],
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  icon: Icon(Icons.calendar_today_outlined,
                                      color: Colors.white, size: 15),
                                  onPressed: () => _selectDate(context))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 03.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                child: isTapped
                                    ? Icon(Icons.check_box_outlined,
                                        color: Colors.black)
                                    : Icon(Icons.check_box_outline_blank,
                                        color: Colors.black),
                                onTap: () {
                                  setState(() {
                                    isTapped = !isTapped;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "I agree all Terms and Conditions",
                                style: TextStyle(
                                    color: isTapped
                                        ? Colors.white
                                        : Colors.transparent,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 110, left: 100),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: Colors.white,
                            ),
                            color: Colors.black,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(30.0),
                                right: Radius.circular(30.0)),
                          ),
                          clipBehavior: Clip.hardEdge,
                          width: 150,
                          child: FlatButton(
                            child: Text(
                              "SIGNUP",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            textColor: Colors.white,
                            //elevation: 05.0,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 200,
                    right: 30,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          child: Container(
                            //margin: EdgeInsets.only(top: 200),
                            height: 160,
                            width: 160,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.white38,
                                )),
                            child: _imageFile == null
                                ? Icon(
                                    Icons.person,
                                    size: 120,
                                    color: Colors.white70,
                                  )
                                : Image.file(_imageFile, fit: BoxFit.cover),
                          ),
                          onTap: () => _imageFile == null
                              ? CircularProgressIndicator()
                              : _showFullScreenPage(context, _imageFile),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          child: Container(
                              height: 50,
                              width: 100,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(50),
                                      right: Radius.circular(50)),
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Icon(
                                Icons.file_present,
                              )),
                          onTap: () async => await _pickImageFromGallery(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Container(
                              height: 50,
                              width: 100,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(50),
                                      right: Radius.circular(50)),
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Icon(
                                Icons.camera,
                              )),
                          onTap: () async => await _pickImageFromCamera(),
                        )
                      ],
                    ),
                  ),
                ]),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              width: 50,
              child: Icon(
                Icons.emoji_emotions,
                color: Colors.red,
                size: 50,
              ),
            ),
            SizedBox(height: 15),
            Text("Tahanks for Registering with us",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("for any help",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 10,
                        fontWeight: FontWeight.normal)),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  child: Text("Contact us 9238518773",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 10,
                          fontWeight: FontWeight.bold)),
                  onTap: () async => await callNow(),
                ),
              ],
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You can contact us on whatsapp by",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 10,
                        fontWeight: FontWeight.normal)),
                SizedBox(
                  width: 2,
                ),
                InkWell(
                  child: Text("8455947722",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 10,
                          fontWeight: FontWeight.bold)),
                  onTap: () {
                    FlutterOpenWhatsapp.sendSingleMessage(
                        "918455947722", "we are also happy to have you");
                  },
                ),
              ],
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text(
                  "alredy have an account!",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    setState(() {
                      //Navigator.pop(context);
                      Navigator.of(context).pushNamed("/myLoginPage");
                    });
                    //print("go to formalities page to create new account");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
