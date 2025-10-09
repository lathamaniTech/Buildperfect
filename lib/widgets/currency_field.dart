import 'package:dashboard/appstyles/global_styles.dart';
import 'package:dashboard/widgets/rupeeformatter.dart';
import 'package:flutter/material.dart';

class CurrencyField extends StatefulWidget {
  final bool? enabled;
  final String? hintText;
  final String? lable;
  final TextEditingController? controller;
  final int index;
  final int selectedIndex;

  const CurrencyField({
    super.key,
    this.enabled,
    this.lable,
    this.hintText,
    this.controller,
    required this.index,
    required this.selectedIndex,
  });

  @override
  State<CurrencyField> createState() => _CurrencyFieldState();
}

class _CurrencyFieldState extends State<CurrencyField> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      enabled: widget.enabled,
      keyboardType: TextInputType.number,
      inputFormatters: [Rupeeformatter()],
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        // labelText: widget.lable,
        hintText: widget.hintText,
        prefixText: '₹ ',
        disabledBorder:
            widget.selectedIndex == widget.index
                ? OutlineInputBorder(
                  borderSide: GlobalStyles.selectedBorderStyle,
                )
                : OutlineInputBorder(
                  borderSide: GlobalStyles.unselectedBorderStyle,
                ),
      ),
    );
  }
}
