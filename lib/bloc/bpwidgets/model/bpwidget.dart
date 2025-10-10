// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dashboard/bloc/bpwidgetprops/model/bpwidget_props.dart';
import 'package:dashboard/types/drag_drop_types.dart';

class BPWidget {
  final PlaceholderWidgets widgetType;
  final String? id;
  BpwidgetProps? bpwidgetProps;
  BPWidget({required this.widgetType, this.id, this.bpwidgetProps});

  BPWidget copyWith({
    PlaceholderWidgets? widgetType,
    String? id,
    BpwidgetProps? bpwidgetProps,
  }) {
    return BPWidget(
      widgetType: widgetType ?? this.widgetType,
      id: id ?? this.id,
      bpwidgetProps: bpwidgetProps ?? this.bpwidgetProps,
    );
  }
}
