import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageSelect extends StatefulWidget {
  final Function onSelectImage;

  ImageSelect(this.onSelectImage);

  @override
  _ImageSelectState createState() => _ImageSelectState();
}

class _ImageSelectState extends State<ImageSelect> {
  File? _storedImage;

  Future<void> _SelectPicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });
    // final appDir = await syspaths.getDownloadsDirectory();
    // final fileName = path.basename(imageFile.path);
    // final savedImage =
    //     await File(imageFile.path).copy('${appDir!.path}/$fileName');
    // widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: _storedImage != null
                  ? Image.file(
                      _storedImage!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : Text(
                      'No Image Taken',
                      textAlign: TextAlign.center,
                    ),
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: FlatButton.icon(
                icon: Icon(Icons.camera),
                label: Text('Select Picture'),
                textColor: Theme.of(context).primaryColor,
                onPressed: _SelectPicture,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
