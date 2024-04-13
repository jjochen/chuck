import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension MaterialAppTester on WidgetTester {
  Future<void> pumpMaterialApp(Widget widget) async {
    await pumpWidget(
      DefaultAssetBundle(
        bundle: FakeAssetBundle(),
        child: MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(),
            child: Material(
              child: widget,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pumpScaffold(Widget widget) async {
    await pumpWidget(
      DefaultAssetBundle(
        bundle: FakeAssetBundle(),
        child: MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(),
            child: Scaffold(
              body: widget,
            ),
          ),
        ),
      ),
    );
  }
}

class FakeAssetBundle extends Fake implements AssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    return _svgStr;
  }

  @override
  Future<ByteData> load(String key) async {
    return Uint8List.fromList(utf8.encode(_svgStr)).buffer.asByteData();
  }
}

const String _svgStr = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M6 12L10 16L18 8" stroke="#005461" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
''';
