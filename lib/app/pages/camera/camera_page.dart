import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  int cameraIndice = 0;

  var cameras;
  void initCamera() async {
    cameras = await availableCameras();
    print("Cameras $cameras");


    setState(() {
      _controller = CameraController(
        cameras[cameraIndice],
        ResolutionPreset.ultraHigh,
      );
      _initializeControllerFuture = _controller.initialize();
    });
  }

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  void _toggleCamera() {
    setState(() {
      if (cameraIndice == 0) {
        cameraIndice = 1;
      } else {
        cameraIndice = 0;
      }
      _controller = CameraController(
        cameras[cameraIndice],
        ResolutionPreset.high,
      );
      _initializeControllerFuture = _controller.initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the Future is complete, display the preview.
              return GestureDetector(
                onDoubleTap: _toggleCamera,
                child: CameraPreview(_controller),
              );
            } else {
              // Otherwise, display a loading indicator.
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        Positioned(
          right: 10,
          top: 40,
          child: GestureDetector(
            onTap: _toggleCamera,
            child: Container(
              width: 40,
              child: Image.asset("assets/camera.png"),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          width: 100,
          height: 100,
          right: MediaQuery.of(context).size.width / 2 - 50,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
        Positioned(
          bottom: 65,
          width: 70,
          height: 70,
          right: MediaQuery.of(context).size.width / 2 - 35,
          child: Container(
            width: 35,
            height: 35,
            child: FloatingActionButton(
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}
