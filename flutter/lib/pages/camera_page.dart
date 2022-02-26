import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../service/api_service.dart';

class CameraApp extends StatefulWidget {
  const CameraApp({Key? key}) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}

List<CameraDescription> cameras = List.empty();

class _CameraAppState extends State<CameraApp> {
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    initializeController();
  }

  Future<void> initializeController() async {
    if (cameras.isEmpty) {
      cameras = await availableCameras();
    }
    controller = CameraController(cameras[0], ResolutionPreset.max);
    await controller?.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!(controller?.value.isInitialized ?? false)) {
      return Container();
    }

    return CameraWidget(controller: controller);
  }
}

class CameraWidget extends StatelessWidget {
  const CameraWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CameraController? controller;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
        SizedBox(
          width: 400,
          height: 600,
          child: CameraPreview(controller!),
        ),
        Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
              onPressed: () async =>
                  {api.images.uploadImage(await controller!.takePicture())},
              child: const Text('Take Picture')),
          TextButton(
              onPressed: () => {
                    controller
                        ?.setFlashMode(FlashMode.off)
                        .then((value) => null),
                  },
              child: const Text('flash off')),
          TextButton(
              onPressed: () => {
                    controller
                        ?.setFlashMode(FlashMode.torch)
                        .then((value) => null),
                  },
              child: const Text('flash on')),
        ])),
      ],
    ));
  }
}
