import 'dart:io';
import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const route = '/AddPlaceScreen';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _textTitleController = TextEditingController();
  File _pickedImage;
  bool _validate = true;

  // storing image
  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  // save data
  void _save() {
    if (_textTitleController.text.isEmpty) {
      setState(() {
        _validate = false;
      });
      return;
    }
    if (_pickedImage == null) return;
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(title: _textTitleController.text, image: _pickedImage);
    Navigator.pop(context); 
  }

  @override
  void dispose() {
    _textTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add new Place'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                      hintText: 'Enter your name ',
                      errorText: !_validate ? 'Please enter title ' : null,
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 10),
                  ImageInput(_selectImage),
                ],
              ),
            ),
          )),
          Container(
            height: 60,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Add place'),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Theme.of(context).accentColor,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
        ]));
  }
}
