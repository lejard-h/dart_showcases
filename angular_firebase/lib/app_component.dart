// Copyright (c) 2017, lejard_h. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';
import 'services/todo.dart';
import 'services/checkbox_filter.dart';
import 'components/todo_list.dart';
import 'components/app_bar.dart';
import 'components/checkbox_filter.dart';
import 'components/todo_dialog.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    directives: const [materialDirectives, TodoList, AppBar, CheckboxFilter, TodoDialog],
    providers: const [materialProviders, CheckboxFilterService, TodoService])
class AppComponent {
}
