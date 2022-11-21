import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_info_platform_interface.dart';

/// An implementation of [DeviceInfoPlatform] that uses method channels.
class MethodChannelDeviceInfo extends DeviceInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_info');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  Future<String?> getPlatformBrand() async {
    final brand = await methodChannel.invokeMethod<String>('getPlatformBrand');
    return brand;
  }

  Future<String?> getPlatformModel() async {
    final model = await methodChannel.invokeMethod<String>('getPlatformModel');
    return model;
  }

  Future<String?> getPlatformDevice() async {
    final device =
        await methodChannel.invokeMethod<String>('getPlatformDevice');
    return device;
  }

  Future<String?> getPlatformDisplay() async {
    final display =
        await methodChannel.invokeMethod<String>('getPlatformDisplay');
    return display;
  }
}
