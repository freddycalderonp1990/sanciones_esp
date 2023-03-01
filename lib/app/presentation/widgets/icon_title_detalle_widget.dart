part of 'custom_app_widgets.dart';

class IconTitleDetalleWidget extends StatelessWidget {
  final String title;
  final String detalle;
  final MainAxisAlignment mainAxisAlignment;
  final double sizeText;
  final bool todoElAncho;
  final Color colorTexto;
  final IconData? icon;

  const IconTitleDetalleWidget(
      {Key? key,
      required this.detalle,
      required this.title,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.sizeText = AppConfig.tamTexto,
      this.icon,
      this.todoElAncho = false,
      this.colorTexto = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget wg = Row(mainAxisAlignment: mainAxisAlignment, children: [
      this.icon != null
          ? Icon(
              this.icon,
              color: AppColors.colorAzulSecond,
            )
          : Container(),
      TituloTextWidget(
        colorTitulo: AppColors.colorAzul,
        title: title,
      ),
      Expanded(
        child: DetalleTextWidget(
          colorDetalle: Colors.black.withOpacity(0.8),
          todoElAncho: todoElAncho,
          sizeText: sizeText,
          detalle: detalle,
        ),
      )
    ]);

    return wg;
  }
}
