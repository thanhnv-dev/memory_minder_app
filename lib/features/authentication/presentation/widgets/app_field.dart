import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:memory_minder_app/constant/app_assets.dart';

class AppField extends ConsumerStatefulWidget {
  const AppField({
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.formBuilderValidators,
    this.fieldKey,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.name,
    this.obscureText = false,
    super.key,
  });

  final String labelText;
  final String? name;
  final String hintText;
  final Widget prefixIcon;
  final List<String? Function(String?)> formBuilderValidators;
  final GlobalKey<FormBuilderFieldState>? fieldKey;
  final AutovalidateMode? autovalidateMode;
  final bool obscureText;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppFieldState();
}

class _AppFieldState extends ConsumerState<AppField> {
  bool obscureState = true;

  void changeObscureState() {
    setState(() {
      obscureState = !obscureState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      key: widget.fieldKey,
      name: widget.name ?? widget.labelText,
      textAlignVertical: TextAlignVertical.center,
      autovalidateMode: widget.autovalidateMode,
      obscureText: widget.obscureText ? obscureState : false,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 3),
        ),
        hintText: widget.hintText,
        // helperText: 'Helper Text',
        // counterText: '0 characters',
        prefixIcon: Container(
          width: 22,
          height: 22,
          padding: const EdgeInsets.all(15),
          child: widget.prefixIcon,
        ),
        suffixIcon: widget.obscureText
            ? FilledButton.tonal(
                onPressed: changeObscureState,
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize: const Size(22, 22),
                  backgroundColor: Colors.transparent,
                ),
                child: SvgPicture.asset(
                  obscureState ? AppSvgIcons.eyeShow : AppSvgIcons.eyeHide,
                  fit: BoxFit.contain,
                ),
              )
            : null,
      ),
      validator: FormBuilderValidators.compose(widget.formBuilderValidators),
    );
  }
}
