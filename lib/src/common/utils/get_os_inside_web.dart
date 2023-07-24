// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:nft_brand_scanner/src/common/constans/web_platform.dart';

WebPlatform getOSInsideWeb() {
  final userAgent = window.navigator.userAgent.toString().toLowerCase();
  if (userAgent.contains("iphone")) return WebPlatform.ios;
  if (userAgent.contains("ipad")) return WebPlatform.ios;
  if (userAgent.contains("android")) return WebPlatform.android;
  return WebPlatform.web;
}