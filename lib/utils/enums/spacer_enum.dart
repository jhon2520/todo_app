import 'package:task_app/config/layout/app_layout.dart';

enum SpacerEnum{
  spacingS(AppLayout.spacingS),
  spacingM(AppLayout.spacingM),
  spacingX(AppLayout.spacingX),
  spacingXL(AppLayout.spacingXL);

  final double size;
  const SpacerEnum(this.size);




}