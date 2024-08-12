import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CassavaDiseaseDetection extends StatefulWidget {
  const CassavaDiseaseDetection({super.key});

  static String id = "CassavaDiseaseDetection";

  @override
  State<CassavaDiseaseDetection> createState() =>
      _CassavaDiseaseDetectionState();
}

class _CassavaDiseaseDetectionState extends State<CassavaDiseaseDetection> {
  int counter = 0;
  File? image;
  late ImagePicker imagePicker;
  late ImageLabeler imageLabeler;
  String result = '';

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    // final ImageLabelerOptions options =
    //     ImageLabelerOptions(confidenceThreshold: 0.5);
    // imageLabeler = ImageLabeler(options: options);
    loadModel();
  }

  // Load my custom model
  loadModel() async {
    final modelPath = await getModelPath('assets/ml/cass_tm_unquant.tflite');
    final options = LocalLabelerOptions(
      confidenceThreshold: 0.05,
      modelPath: modelPath,
    );
    // then create our imagelaber with the options of the custom model
    imageLabeler = ImageLabeler(options: options);
  }

  chooseImage() async {
    XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      image = File(selectedImage.path);
      performImageLabeling();
      setState(() {
        image;
      });
    }
  }

  captureImage() async {
    XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (selectedImage != null) {
      image = File(selectedImage.path);
      performImageLabeling();
      setState(() {
        image;
      });
    }
  }

  performImageLabeling() async {
    result = ""; // clear the previous result
    InputImage inputImage = InputImage.fromFile(image!);
    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

    for (ImageLabel label in labels) {
      final String text = label.label;
      final int index = label.index;
      final double confidence = label.confidence;
      // print(text);
      result += "$text:  ${confidence.toStringAsFixed(2)}\n";
    }
    setState(() {
      result;
    });
  }

  // Because of ImageLaber with my custom model
  Future<String> getModelPath(String asset) async {
    final path = '${(await getApplicationSupportDirectory()).path}/$asset';
    await Directory(dirname(path)).create(recursive: true);
    final file = File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(asset);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "CassavaDiseaseDetection",
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                "The Photo appears Here",
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Card(
                margin: const EdgeInsets.all(10),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 200,
                  child: image == null
                      ? const Icon(
                          Icons.image_outlined,
                          size: 120,
                        )
                      : Image.file(image!),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Insert/Capture",
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Card(
                margin: const EdgeInsets.all(10),
                color: Theme.of(context).colorScheme.primaryContainer,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: const Icon(
                          Icons.image,
                          size: 50,
                        ),
                        onTap: () {
                          chooseImage();
                        },
                      ),
                      const Divider(),
                      InkWell(
                        child: const Icon(
                          Icons.camera,
                          size: 50,
                        ),
                        onTap: () {
                          captureImage();
                        },
                      )
                    ],
                  ),
                ),
              ),
              const Text(
                "Results",
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                margin: const EdgeInsets.all(10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    result,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
