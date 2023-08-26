import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:message_app/database/auth.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;

Future<String> uploadImageToStorage(Uint8List file )async{
  String fileName = Auth().currentUser!.uid.toString();
  Reference ref = _storage.ref().child("profileImages/$fileName");
  UploadTask uploadTask = ref.putData(file);
  TaskSnapshot taskSnapshot = await uploadTask;
  String downloadUrl =  await taskSnapshot.ref.getDownloadURL();
  return downloadUrl;
}

void selectImage()async{
  Uint8List img = await pickImage(ImageSource.gallery);
  try{
    await uploadImageToStorage(img).then((value) => Auth().updateData({
      "profileurl": value
    }));
  }catch(e){
    print(e.toString());
  }
}

pickImage(ImageSource source)async{
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);

  if(_file!=null){
    return await _file.readAsBytes();
  }
}