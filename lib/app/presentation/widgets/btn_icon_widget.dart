part of 'custom_app_widgets.dart';

class BtnIconWidget extends StatelessWidget {
  final String titulo;
  final String stringImg;
  final bool select;
  final VoidCallback? onPressed;
  final bool showLinea;

  const BtnIconWidget(
      {Key? key,
      this.titulo = '',
      this.stringImg = '',
      this.select = false,
        this.showLinea=true,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 10.0;
    final responsive = ResponsiveUtil();
    Widget wg = Container();

    wg = Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextButton.icon(
        label: Text(titulo,
            style: TextStyle(
                color: Colors.white, fontSize: responsive.diagonalP(2))),
        icon: Container(
          height: responsive.diagonalP(3),
          child:stringImg.length==0?Container(): Image.asset(stringImg),
        ),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(color:showLinea? Colors.white.withOpacity(0.5):Colors.transparent)),
        ),
        onPressed: onPressed,
      ),
    );
    if (select) {
      wg = Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: TextButton.icon(
          label: Text(titulo,
              style: TextStyle(
                  color: Colors.white, fontSize: responsive.diagonalP(2))),
          icon: Container(
            height: responsive.diagonalP(3),
            child: stringImg.length==0?Container(): Image.asset(stringImg),
          ),
          style: TextButton.styleFrom(
            side: BorderSide(width: 2, color: Colors.white),
            backgroundColor:Colors.white.withOpacity(0.4),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(color:showLinea? Colors.white.withOpacity(0.5):Colors.transparent)),
          ),
          onPressed: onPressed,
        ),
      );
    }

    return wg;

    return Expanded(
      child: wg,
    );
  }
}
