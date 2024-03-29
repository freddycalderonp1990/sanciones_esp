part of 'custom_app_widgets.dart';

class BtnIconWidget extends StatelessWidget {
  final IconData? icon;
  final Color colorIcon;
  final Color colorBtn;
  final VoidCallback? onPressed;
final String? titulo;

  const BtnIconWidget(
      {super.key,
       this.icon,
      this.colorIcon = AppColors.colorAzul,
      this.colorBtn = Colors.white38,
      this.onPressed, this.titulo});

  @override
  Widget build(BuildContext context) {
    double radius = 10.0;
    final responsive = ResponsiveUtil();
    Widget wg = Container();

    Widget btn=Icon(
      icon,
      color: colorIcon,
      size: responsive.isVertical()
          ? responsive.altoP(3)
          : responsive.anchoP(3),
    );

    Widget wgDesing=btn;

    if(titulo!=null) {
      wgDesing = Row(children: [
        Text(titulo!),
        btn
      ],);
    }


    wg = CupertinoButton(
      minSize:
          responsive.isVertical() ? responsive.altoP(5) : responsive.anchoP(5),
      padding: EdgeInsets.all(3),
      borderRadius: BorderRadius.circular(30),
      color: colorBtn,
      onPressed: onPressed,
      //volver atras
      child: wgDesing,
    );

    return wg;
  }
}
