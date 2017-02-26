// Copyright (c) 2017, lejard_h. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:angular2/platform/browser.dart';

import 'package:angular_firebase/app_component.dart';
import 'package:angular_firebase/firebase.dart';

Future main() async {
  Firebase fb = await initFirebase();
  bootstrap(AppComponent, [provide(Firebase, useValue: fb)]);
}
