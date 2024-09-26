import 'package:flutter/material.dart';
import 'dart:io';
import 'package:project_web/Screens/dashboard.dart';
import 'package:project_web/Screens/profile.dart';
import 'package:project_web/Widgets/click_image_input.dart';
import 'package:project_web/Widgets/select_image.dart';

class ImageDialogBox extends StatelessWidget {
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        content: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              right: -40.0,
              top: -40.0,
              child: IconButton(
                onPressed: Navigator.of(context).pop,
                icon: Icon(Icons.close),
              ),
            ),
            Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    ImageInput(_selectImage))));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        height: 50,
                        width: 700,
                        child: const Center(
                            child: Text(
                          'Take a Photo',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  ImageSelect(_selectImage))));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        width: 700,
                        height: 50,
                        child: const Center(
                            child: Text(
                          'Choose From gallery',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Dashboard())));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        width: 700,
                        height: 50,
                        child: const Center(
                            child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      width: 700,
                      height: 50,
                      child: const Center(
                          child: Text(
                        'Remove image',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: Navigator.of(context).pop,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        width: 700,
                        height: 50,
                        child: const Center(
                            child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
