import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // for picking file image
import 'package:path/path.dart' as path; //  creates path
import 'package:path_provider/path_provider.dart'
    as syspath; // finds path in file system
import 'dart:io'; // for FileStorage
// Why stateful - because it manages preview

class ImageInput extends StatefulWidget {
  final Function _onSelectImage;
  ImageInput(this._onSelectImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  dynamic _pickImageError;
  final picker = ImagePicker();

  //! method - gallery / camera
  Future<void> _getImage(ImageSource source, BuildContext ctx) async {
    PickedFile pickedFile =
        await picker.getImage(source: source, maxWidth: 600);
    try {
      setState(() {
        if (pickedFile != null) _storedImage = File(pickedFile.path);
      });
      final Directory appDocDir =
          await syspath.getApplicationDocumentsDirectory();
      final fileName = path.basename(pickedFile.path);
      final savedImage = await _storedImage.copy('${appDocDir.path}/$fileName');
      widget._onSelectImage(savedImage); 

      Navigator.pop(ctx);
    } catch (error) {
      setState(() {
        _pickImageError = error;
        throw Exception(_pickImageError.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Row(children: [
      // image preview
      Container(
        width: deviceSize.width * .250,
        height: deviceSize.height * .125,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: _storedImage == null
            ? const Text(
                ' No image chosen ',
                textAlign: TextAlign.center,
              )
            : Image.file(_storedImage,
                fit: BoxFit.contain, width: double.infinity),
      ),
      SizedBox(height: 10),
      Expanded(
        child: TextButton.icon(
          icon: const Icon(Icons.camera_alt),
          label: const Text('Take picture'),
          style: TextButton.styleFrom(
            primary: Theme.of(context).accentColor,
          ),
          onPressed: () async {
            // do something
            await showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                      title: Text('Choose an Image'),
                      content: Text(
                          "Choose the image either from gallery or snap the photo"),
                      actions: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextButton(
                              onPressed: () {
                                _getImage(ImageSource.gallery, ctx);
                              },
                              child: Text('Gallery')),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextButton(
                              onPressed: () {
                                _getImage(ImageSource.camera, ctx);
                              },
                              child: Text('Camera')),
                        ),
                      ],
                    ));
          },
        ),
      ),
    ]);
  }
}
