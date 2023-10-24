import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

Future<Uint8List?> getImage() async {
  try {
    Uint8List? byte;
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    byte = await pickedFile!.readAsBytes();
    return byte;
  } catch (e) {
    print(e);
    return null;
  }
}
