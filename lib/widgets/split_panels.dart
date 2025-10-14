/*
    @auth     : karthick.d    06/10/2025
    @desc     : parent container for all the three panel
                split_panel - keep the list of BPWidgt which app
                  items_panel
                
*/
import 'dart:math';

import 'package:dashboard/appdata/page/page_global_constants.dart';
import 'package:dashboard/appstyles/global_colors.dart';
import 'package:dashboard/bloc/bpwidgetprops/bpwidget_props_bloc.dart';
import 'package:dashboard/bloc/bpwidgetprops/model/bpwidget_props.dart';
import 'package:dashboard/bloc/bpwidgets/bpwidget_bloc.dart';
import 'package:dashboard/bloc/bpwidgets/model/bpwidget.dart';
import 'package:dashboard/types/drag_drop_types.dart';
import 'package:dashboard/utils/math_utils.dart';
import 'package:dashboard/widgets/item_panel.dart';
import 'package:dashboard/widgets/my_drop_region.dart';
import 'package:dashboard/widgets/right_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplitPanel extends StatefulWidget {
  final int columns;
  final double itemSpacing;
  const SplitPanel({super.key, this.columns = 3, this.itemSpacing = 2.0});

  @override
  State<SplitPanel> createState() => _SplitPanelState();
}

class _SplitPanelState extends State<SplitPanel> {
  /// BPPageController named constructor BPPageController.loadNPages(5)
  ///  to create pages on the fly , the created pages will be loaded in
  ///  the left panel -> pages panel where user can select pages to configure
  /// BPWidgets
  ///
  BPPageController bpController = BPPageController.loadNPages(5);

  ///
  List<BPWidget> upper = [];
  final List<PlaceholderWidgets> _lower = [
    PlaceholderWidgets.Textfield,
    PlaceholderWidgets.Dropdown,
    PlaceholderWidgets.Checkbox,
    PlaceholderWidgets.Radio,
    PlaceholderWidgets.Button,
    PlaceholderWidgets.Label,
  ];

  final List<BPWidget> lower = [
    BPWidget(
      bpwidgetProps: BpwidgetProps(
        label: '',
        controlName: '',
        controlType: PlaceholderWidgets.Textfield.name,
      ),
      widgetType: PlaceholderWidgets.Textfield,
    ),
    BPWidget(
      bpwidgetProps: BpwidgetProps(
        label: '',
        controlName: '',
        controlType: PlaceholderWidgets.Dropdown.name,
      ),
      widgetType: PlaceholderWidgets.Dropdown,
    ),
    BPWidget(
      bpwidgetProps: BpwidgetProps(
        label: '',
        controlName: '',
        controlType: PlaceholderWidgets.Checkbox.name,
      ),
      widgetType: PlaceholderWidgets.Checkbox,
    ),
    BPWidget(
      bpwidgetProps: BpwidgetProps(
        label: '',
        controlName: '',
        controlType: PlaceholderWidgets.Radio.name,
      ),
      widgetType: PlaceholderWidgets.Radio,
    ),
    BPWidget(
      bpwidgetProps: BpwidgetProps(
        label: '',
        controlName: '',
        controlType: PlaceholderWidgets.Button.name,
      ),
      widgetType: PlaceholderWidgets.Button,
    ),
    BPWidget(
      bpwidgetProps: BpwidgetProps(
        label: '',
        controlName: '',
        controlType: PlaceholderWidgets.Label.name,
      ),
      widgetType: PlaceholderWidgets.Label,
    ),
    BPWidget(
      bpwidgetProps: BpwidgetProps(
        label: '',
        controlName: '',
        controlType: PlaceholderWidgets.Currency.name,
      ),
      widgetType: PlaceholderWidgets.Currency,
    ),
  ];

  PanelLocation dragStart = (-1, Panel.lower);
  PanelLocation? dropPreview;

  BPWidget? hoveringData;
  BpwidgetProps selectedWidget = BpwidgetProps(
    label: '',
    controlName: '',
    controlType: '',
  );

  /// this method is called when the itemplaceholder is dragged
  /// it's set  the state -> dragStart and data state properties
  ///
  void onItemDragStart(PanelLocation start) {
    final data = switch (start.$2) {
      Panel.upper => upper[start.$1],
      Panel.lower => lower[start.$1],
    };

    setState(() {
      dragStart = start;
      hoveringData = data;
    });
  }

  void updateDropPreview(PanelLocation update) => setState(() {
    dropPreview = update;
  });

  /// this function invoked when the formcontrol widget dragged and dropped to
  /// central panel , unique id is assigned to id property of BPWidgetProps
  ///
  void drop() {
    setState(() {
      if (dropPreview!.$2 == Panel.upper) {
        final uniqueID = MathUtils.generateUniqueID();
        // print('onDrop => ${lower[dropPreview!.$1].bpwidgetProps}');
        print('hoveringData!.widgetType => ${hoveringData!.widgetType!.name}');
        hoveringData = BPWidget(
          widgetType: hoveringData!.widgetType,
          id: uniqueID,
          bpwidgetProps: BpwidgetProps(
            label: '',
            controlName:
                '${bpController.pagesRegistry.entries.first.value.pageName}_',
            controlType: hoveringData!.widgetType!.name,
            id: uniqueID,
          ),
        );

        print('hoveringData => ${hoveringData!.id}');
        upper.insert(max(dropPreview!.$1, upper.length), hoveringData!);
      }
    });
  }

  void onItemClickRef(BPWidget widget) {
    print('onItemClickRef => ${widget}');
    selectedWidget = widget.bpwidgetProps!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BpwidgetBloc, BpwidgetState>(
      /// listener method will be invoked when ever the BPWidgetState objet
      /// changes . in our case whenever we are adding the Bpwidgets in
      /// List<BpWidgets>
      listener: (context, state) {
        print(
          'inside splitpanel builder method => ${state.bpWidgetsList?.length} ${state.bpWidgetsList![0].bpwidgetProps}',
        );

        final upperFiltered = upper.where((u) {
          return u.id == state.bpWidgetsList![0].bpwidgetProps!.id;
        });
        final indexOfSelectedBpWidget = upper.indexOf(upperFiltered.first);
        if (indexOfSelectedBpWidget != -1) {
          BPWidget _upper = upperFiltered.first;

          _upper.bpwidgetProps = _upper.bpwidgetProps!.copyWith(
            controlName: state.bpWidgetsList![0].bpwidgetProps!.controlName,
            label: state.bpWidgetsList![0].bpwidgetProps!.label,
            controlType: state.bpWidgetsList![0].bpwidgetProps!.controlType,
            isRequired: state.bpWidgetsList![0].bpwidgetProps!.isRequired,
            isVerificationRequired:
                state.bpWidgetsList![0].bpwidgetProps!.isVerificationRequired,
            max: state.bpWidgetsList![0].bpwidgetProps!.max,
            min: state.bpWidgetsList![0].bpwidgetProps!.min,
            validationPatterns:
                state.bpWidgetsList![0].bpwidgetProps!.validationPatterns,
            id: state.bpWidgetsList![0].bpwidgetProps!.id,
          );
          print(_upper.bpwidgetProps!.label);
          // _upper.copyWith(bpwidgetProps: state.bpWidgetsList![0].bpwidgetProps);
          upper[indexOfSelectedBpWidget] = _upper;
          print(upper[0].bpwidgetProps!.label);
        }
      },
      builder: (context, state) {
        print(
          'total pages => ${bpController.pagesRegistry.entries.first.value.pageName}',
        );

        return Scaffold(
          appBar: AppBar(title: Text('BuildPerfect'), elevation: 2),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final gutter = widget.columns + 1;
              final spaceForColumns =
                  constraints.maxWidth - (widget.itemSpacing * gutter);
              final columnWidth = spaceForColumns / widget.columns;
              final itemSize = Size(columnWidth, columnWidth);
              final leftPanelWidth = constraints.maxWidth / 4;
              final centerPanelWidth = constraints.maxWidth / 2;
              final rightPanelWidth =
                  constraints.maxWidth -
                  (leftPanelWidth + centerPanelWidth) +
                  80;
              return Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Stack(
                  children: [
                    Positioned(
                      // for draggable component
                      width: leftPanelWidth - 100,
                      height: constraints.maxHeight,
                      left: 0,
                      child: MyDropRegion(
                        onDrop: drop,
                        updateDropPreview: updateDropPreview,
                        childSize: itemSize,
                        columns: widget.columns,
                        panel: Panel.lower,

                        child: ItemPanel(
                          crossAxisCount: widget.columns,
                          spacing: widget.itemSpacing,
                          items: lower,
                          onDragStart: onItemDragStart,
                          panel: Panel.lower,
                          dragStart: dragStart,
                          dropPreview: dropPreview,
                          hoveringData: hoveringData,
                        ),
                      ),
                    ),
                    Positioned(
                      width: 2,
                      height: constraints.maxHeight,
                      left: leftPanelWidth,
                      child: ColoredBox(color: GlobalColors.centerPanelBGColor),
                    ),
                    Positioned(
                      // centerpanel for dragtarget
                      width: centerPanelWidth,
                      height: constraints.maxHeight,
                      left: leftPanelWidth,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: GlobalColors.centerPanelBGColor,
                        ),
                        child: MyDropRegion(
                          onDrop: drop,
                          updateDropPreview: updateDropPreview,
                          childSize: itemSize,
                          columns: widget.columns,
                          panel: Panel.upper,
                          child: ItemPanel(
                            crossAxisCount: widget.columns,
                            spacing: widget.itemSpacing,
                            items: upper,
                            onDragStart: onItemDragStart,
                            panel: Panel.upper,
                            dragStart: dragStart,
                            dropPreview: dropPreview,
                            hoveringData: hoveringData,
                            onItemClicked: onItemClickRef,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      width: rightPanelWidth,
                      height: constraints.maxHeight,
                      right: 0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.pink.shade100),

                        /// RightPanel - is parent model for props , action and
                        /// datasource panel
                        child: RightPanel(
                          width: rightPanelWidth,
                          height: constraints.maxHeight,
                          props: selectedWidget,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
