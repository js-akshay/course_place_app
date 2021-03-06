import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  ImageInput(this.onSelectImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('no image taken'),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextButton.icon(
          icon: Icon(Icons.camera),
          label: Text('Take picture'),
          onPressed: () async {
            final imageFile = await _picker.getImage(
              source: ImageSource.camera,
              maxWidth: 600,
            );
            if (imageFile == null) {
              return;
            }
            setState(() {
              _storedImage = File(imageFile.path);
            });
            final appDir = await syspaths.getApplicationDocumentsDirectory();
            final fileName = path.basename(imageFile.path);
            final savedImage =
                await File(imageFile.path).copy('${appDir.path}/$fileName');
            widget.onSelectImage(savedImage);
          },
        ))
      ],
    );
  }
}
