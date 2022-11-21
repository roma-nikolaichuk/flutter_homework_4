import 'device_info_platform_interface.dart';

class DeviceInfo {
  Future<String?> getPlatformVersion() {
    return DeviceInfoPlatform.instance.getPlatformVersion();
  }

  Future<String?> getPlatformBrand() {
    return DeviceInfoPlatform.instance.getPlatformBrand();
  }

  Future<String?> getPlatformModel() {
    return DeviceInfoPlatform.instance.getPlatformModel();
  }

  Future<String?> getPlatformDevice() {
    return DeviceInfoPlatform.instance.getPlatformDevice();
  }

  Future<String?> getPlatformDisplay() {
    return DeviceInfoPlatform.instance.getPlatformDisplay();
  }
}
