/*
  @author     :   karthick.d  13/10/2025
  @desc       :   Dataset requird for simple navigation like going from page1 to page2 
                  so when running the navigation job  , the corresponding task will 
                  consume 
                  
*/

import 'package:dashboard/bloc/bpwidgetaction/model/dataprovider/bpwidget_tasks_dataprovider.dart';

class NavigationTaskDataProvider extends BPTaskDataprovider {
  NavigationTaskDataProvider({required super.url});
}

class NavigationWithDataTaskProvider extends BPTaskDataprovider {
  final String url;
  final Map<String, dynamic> data;
  NavigationWithDataTaskProvider({required this.url, required this.data})
    : super(url: url, data: data);
}
