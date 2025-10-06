import 'package:dashboard/bloc/bpwidgetprops/bpwidget_props_bloc.dart';
import 'package:dashboard/widgets/customcontrols/key_value_textbox.dart';
import 'package:dashboard/widgets/rightpanels/panel_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropsPanel extends StatefulWidget {
  final double width;
  final double height;
  const PropsPanel({super.key, required this.width, required this.height});

  @override
  State<PropsPanel> createState() => _PropsPanelState();
}

class _PropsPanelState extends State<PropsPanel> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BpwidgetPropsBloc, BpwidgetPropsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Card(
          color: Colors.white,
          child: SizedBox(
            width: widget.width,
            height: widget.height,

            child: Column(
              children: [
                PanelHeader(
                  panelWidth: widget.width,
                  title: 'Configure Formcontrol Properties',
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: KeyValueTextbox(
                    labeltext: 'Label Text',
                    width: widget.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: KeyValueTextbox(
                    labeltext: 'Control Name',
                    width: widget.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: KeyValueTextbox(
                    width: widget.width,
                    labeltext: 'Control Type',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: KeyValueTextbox(
                    width: widget.width,
                    labeltext: 'Required ?',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: KeyValueTextbox(
                    width: widget.width,
                    labeltext: 'Verification Required?',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: KeyValueTextbox(
                    width: widget.width,
                    labeltext: 'Validations',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
