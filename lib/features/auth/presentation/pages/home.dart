import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 10, 10, 10),
        body: SafeArea(
          child: Center(
            child: CardWidget(),
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatefulWidget {
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  File? _image;
  bool _showQR = false;

ImageProvider<Object>? _imageProvider;

Future<void> _pickImage() async {
  final picker = ImagePicker();
  final pickedImage = await picker.getImage(source: ImageSource.gallery);

  setState(() {
    if (pickedImage != null) {
      _imageProvider = FileImage(File(pickedImage.path));
      _showQR = false;
    } else {
      print('No image selected.');
    }
  });
}

  void _toggleQR() {
    setState(() {
      _showQR = !_showQR;
    });
  }


 @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _toggleQR();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 300,
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        transform: Matrix4.translationValues(0, 0, 0),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_showQR)
                    Container(
                      width: 150,
                      height: 150,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Text(
                        'QR Code',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    )
else if (_imageProvider != null) CircleAvatar(
  radius: 50.0,
  backgroundImage: _imageProvider,
)
else CircleAvatar(
  radius: 50.0,
  backgroundImage: AssetImage('assets/images/uv.png'),
),

                  Text(
                    _showQR ? 'Oziel Alejandres\nNavarro' : 'Oziel Alejandres\nNavarro',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  if (_showQR)
                    SizedBox(height: 20.0),
                  Text(
                    'Ing. de Software',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                      letterSpacing: 2.5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Divider(color: Colors.white),
                  ListTile(
                    leading: Icon(
                      Icons.confirmation_number_outlined,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'S20006758',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Source Sans Pro',
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.business_outlined,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'Ixtaczoquitlan',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Source Sans Pro',
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.date_range_outlined,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'Agosto 2023 - Enero 2024',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Source Sans Pro',
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Text(
                          'Mostrar QR del estudiante',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
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