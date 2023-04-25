

part of '../custom_app_widgets.dart';
class ComboNormal extends StatefulWidget {
  final String titulo;
  final String? value;
  final ValueChanged<String?>? onChanged;
  final List<String> items;
  final String nameStringImg;

  const ComboNormal(
      {Key? key,
        required this.titulo,
        this.value,
        this.onChanged,
        required this.items,
        this.nameStringImg = AppImages.iconMenu})
      : super(key: key);

  @override
  _ComboNormalState createState() => _ComboNormalState();
}

class _ComboNormalState extends State<ComboNormal> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return comboNormal(
        titulo: widget.titulo,
        items: widget.items,
        onChanged: widget.onChanged,
        value: widget.value);
  }

  Widget comboNormal(
      {required String titulo,
        String? value,
        ValueChanged<String?>? onChanged,
        required List<String> items}) {
    final responsive = ResponsiveUtil();
    Widget combo = DropdownButton<String>(
        isExpanded: true,
        value: value,
        style: TextStyle(
            color: Colors.black,
            fontSize: responsive.diagonalP(AppConfig.tamTextoTitulo)),
        elevation: 16,
        underline: Container(
          height: 2,
          color: Colors.transparent,
        ),
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Row(
              children: [
                Expanded(
                  child: IconDetalleWidget(
                      nameStringImg: widget.nameStringImg, detalle: value),
                )
              ],
            ),
          );
        }).toList());

    return ContenedorDesingWidget(
        paddin: EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(flex: 1,child:  TituloTextWidget(
              title: titulo,
            ),),
            SizedBox(
              width: responsive.altoP(1),
            ),
            Flexible(flex: 2,
              child: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  margin: const EdgeInsets.only(
                      left: 10, bottom: 2, top: 2, right: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.colorAzulSecond),
                    borderRadius: BorderRadius.circular(AppConfig.radioBotones),
                  ),
                  child: combo),
            ),
          ],
        ));
  }
}
