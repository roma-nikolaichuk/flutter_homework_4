import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _platformBrand = 'Unknown';
  String _platformModel = 'Unknown';
  String _platformDevice = 'Unknown';
  String _platformDisplay = 'Unknown';

  final _deviceInfoPlugin = DeviceInfo();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    String platformBrand;
    String platformModel;
    String platformDevice;
    String platformDisplay;

    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _deviceInfoPlugin.getPlatformVersion() ??
          'Unknown platform version';

      platformBrand = await _deviceInfoPlugin.getPlatformBrand() ??
          'Unknown platform brand';

      platformModel = await _deviceInfoPlugin.getPlatformModel() ??
          'Unknown platform model';

      platformDevice = await _deviceInfoPlugin.getPlatformDevice() ??
          'Unknown platform device';

      platformDisplay = await _deviceInfoPlugin.getPlatformDisplay() ??
          'Unknown platform display';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      platformBrand = 'Failed to get platform brand.';
      platformModel = 'Failed to get platform model.';
      platformDevice = 'Failed to get platform device.';
      platformDisplay = 'Failed to get platform display.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _platformBrand = platformBrand;
      _platformModel = platformModel;
      _platformDevice = platformDevice;
      _platformDisplay = platformDisplay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin device info'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'
              'Model: $_platformModel\n'
              'Brand: $_platformBrand\n'
              'Device: $_platformDevice\n'
              'Display: $_platformDisplay\n'
              ''),
        ),
      ),
    );
  }
}
