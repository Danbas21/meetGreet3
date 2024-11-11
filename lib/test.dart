import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAJzv-hLObqzBOudBMgRrhVCznkFAWnjyE',
      authDomain: 'mancaveautographs-5397e.firebaseapp.com',
      projectId: 'mancaveautographs-5397e',
      storageBucket: 'mancaveautographs-5397e.appspot.com',
      messagingSenderId: '328241095450',
      appId: '1:328241095450:web:0c67fa5b7401d72e9d82a3',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Firebase Image')),
        body: Center(child: FirebaseImageWidget()),
      ),
    );
  }
}

class FirebaseImageWidget extends StatefulWidget {
  const FirebaseImageWidget({super.key});

  @override
  _FirebaseImageWidgetState createState() => _FirebaseImageWidgetState();
}

class _FirebaseImageWidgetState extends State<FirebaseImageWidget> {
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    try {
      // Asegúrate de reemplazar 'ruta/a/tu/imagen.jpg' con la ruta real de tu imagen en Firebase Storage
      String imageRef =
          'gs://mancaveautographs-5397e.appspot.com/Gallery/meet1.jpg';

      // Obtén una URL de descarga con token de acceso
      String downloadURL =
          await FirebaseStorage.instance.ref(imageRef).getDownloadURL();

      setState(() {
        _imageUrl = downloadURL;
      });
    } catch (e) {
      print('Error al cargar la imagen: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_imageUrl == null) {
      return const CircularProgressIndicator();
    } else {
      return Image.network(_imageUrl!);
    }
  }
}
