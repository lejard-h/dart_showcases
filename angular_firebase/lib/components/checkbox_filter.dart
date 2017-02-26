import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';
import 'package:angular_firebase/services/checkbox_filter.dart';

@Component(selector: 'checkbox-filter', templateUrl: 'checkbox_filter.html', directives: const [MaterialCheckboxComponent])
class CheckboxFilter {

  CheckboxFilterService service;

  CheckboxFilter(this.service);


}
