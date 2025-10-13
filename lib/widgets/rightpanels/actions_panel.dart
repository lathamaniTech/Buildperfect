import 'package:dashboard/appdata/forms/bpwidget_forms.dart';
import 'package:dashboard/widgets/customcontrols/key_value_dropdown.dart';
import 'package:dashboard/widgets/customcontrols/key_value_reactive_dropdown.dart';
import 'package:dashboard/widgets/rightpanels/panel_header.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ActionsPanel extends StatefulWidget {
  final double width;
  final double height;

  const ActionsPanel({super.key, required this.width, required this.height});

  @override
  State<ActionsPanel> createState() => _ActionsPanelState();
}

class _ActionsPanelState extends State<ActionsPanel> {
  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: BpwidgetForms.get_bpwidgetaction_forms(),
      child: Card(
        color: Colors.white,
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: Column(
            children: [
              PanelHeader(
                panelWidth: widget.width,
                title: 'Configure Formcontrol Actions',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      child: KeyValueReactiveDropdown(
                        width: widget.width / 2,
                        labeltext: 'Event',
                        dropdownEntries: ['onclick'],
                        formControlName: 'event',
                      ),
                    ),
                    SizedBox(
                      child: KeyValueReactiveDropdown(
                        width: widget.width / 2,
                        labeltext: 'Action',
                        dropdownEntries: ['Go', 'Go+Data', 'Save&Go'],
                        formControlName: 'action',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
