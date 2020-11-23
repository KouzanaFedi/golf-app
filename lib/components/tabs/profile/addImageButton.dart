import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddImageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imagePicker = ImagePicker();
    final userProvider = Provider.of<UserProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 35),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[2],
        shape: BoxShape.circle,
      ),
      child: FlatButton(
        splashColor: Colors.greenAccent,
        color: theme.primaryColor,
        shape: CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext bc) {
                return SafeArea(
                  child: Container(
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                            leading: Icon(Icons.photo_library),
                            title: Text('Galerie'),
                            onTap: () async {
                              PickedFile image = await imagePicker.getImage(
                                  source: ImageSource.gallery,
                                  imageQuality: 50);
                              if (image != null) {
                                await userProvider.updateImage(image);
                                userProvider.refreshUser();
                              }
                              Navigator.of(context).pop();
                            }),
                        ListTile(
                          leading: Icon(Icons.photo_camera),
                          title: Text('Appareil photo'),
                          onTap: () async {
                            PickedFile image = await imagePicker.getImage(
                                source: ImageSource.camera, imageQuality: 50);
                            if (image != null) {
                              await userProvider.updateImage(image);
                              userProvider.refreshUser();
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        padding: EdgeInsets.all(5),
        child: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
    );
  }
}
