part of 'custom_app_widgets.dart';

class WorkAreaPageAppWidget extends StatefulWidget {
  final RxBool peticionServer;
  final String title;
  final String name;

  final Widget contenido;
  final bool btnAtras;
  final VoidCallback? pantallaIrAtras;
  final Widget? widgetBtnFinal;
  final EdgeInsetsGeometry? paddin;
  final FloatingActionButtonLocation ubicacionBtnFinal;
  final imgPerfil;
  final imgFondo;
  final double sizeTittle;
  final bool mostrarVersion;

  const WorkAreaPageAppWidget({
    required this.peticionServer,
    this.title = '',
    required this.contenido,
    this.btnAtras = false,
    this.widgetBtnFinal,
    this.paddin,
    this.ubicacionBtnFinal = FloatingActionButtonLocation.centerFloat,
    this.imgPerfil = null,
    this.imgFondo,
    this.sizeTittle = 0,
    this.mostrarVersion = false,
    this.pantallaIrAtras,
    this.name = '',
  });

  @override
  _WorkAreaPageAppWidgetState createState() => _WorkAreaPageAppWidgetState();
}

class _WorkAreaPageAppWidgetState extends State<WorkAreaPageAppWidget> {
  String version = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadVersion();
  }

  _loadVersion() async {
    String _version = await UtilidadesUtil.getVersionCodeNameApp();
    setState(() {
      version = _version;
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil();

    Widget wgImgFondo = Container(
      height: responsive.alto,
      width: responsive.ancho,
      child: Image.asset(
        widget.imgFondo == null ? AppImages.imgFondoDefault : widget.imgFondo,
        fit: BoxFit.cover,
      ),
    );

    /*  wgImgFondo = Container(
      height: responsive.alto,
      width: responsive.ancho,
      color: AppColors.colorBackground,
    );*/

    Widget desingCabecera = Center(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              SizedBox(
                width: 2,
              ),
              widget.btnAtras
                  ? BtnIconWidget(
                      onPressed: () => Get.back(), icon: Icons.arrow_back)
                  : Container(),
              Expanded(
                child: Text(
                  'ESCUELA SUPERIOR DE POLICÍA \n«GRAL. ALBERTO ENRRÍQUEZ GALLO»',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: widget.sizeTittle == 0
                          ? responsive.anchoP(5)
                          : responsive.anchoP(widget.sizeTittle)),
                ),
              ),
              BtnIconWidget(
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.SPLASH);
                  },
                  icon: Icons.power_settings_new),
              SizedBox(
                width: 2,
              ),
            ],
          ),
          Container(
            height: 1,
            color: Colors.transparent,
          ),
          Container(
            height: 1,
            color: Colors.transparent,
            margin: EdgeInsets.only(top: 4),
          ),
          widget.name != '' ? getDesingName(widget.name) : Container(),
          widget.title != ''
              ? Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '“El policía de corazón hace únicamente lo que dice la norma.”',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              responsive.diagonalP(AppConfig.tamTextoTitulo)),
                    )
                  ],
                )
              : Container(),
          widget.mostrarVersion
              ? Text(
                  'Versión 2: ' + version + ' ' + "UrlApi.ambiente",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5)),
                )
              : Container(),
        ],
      ),
    );

    desingCabecera = Container(
      margin: EdgeInsets.only(
        top: responsive.altoP(1.0),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConfig.radioBordecajas),
          boxShadow: [
            BoxShadow(color: Colors.blue.withOpacity(0.1), blurRadius: 45)
          ]),
      child: Stack(
        children: [desingCabecera],
      ),
    );

    return Scaffold(
        backgroundColor: AppColors.colorBackground,

        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Stack(
              children: [
                wgImgFondo,
                SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            desingCabecera,
                            Expanded(
                                child: Container(
                              child: widget.contenido != null
                                  ? Container(
                                      padding: EdgeInsets.all(5),
                                      child: widget.contenido)
                                  : Container(),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Obx(() => CargandoWidget(
                      mostrar: widget.peticionServer.value,
                    ))
              ],
            )));
  }

  getDesingName(String name) {
    final responsive = ResponsiveUtil();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 5,
        ),
        imgPerfilRedonda(
          size: 20,
          img: widget.imgPerfil,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.colorAzulSecond_20,
              fontWeight: FontWeight.bold,
              fontSize: responsive.diagonalP(AppConfig.tamTextoTitulo)),
        ),
        Container(
          height: responsive.diagonalP(15),
          child: Image.asset(AppImages.img_bandera_escudo_esp),
        ),
      ],
    );
  }


}

class imgPerfilRedonda extends StatefulWidget {
  final double size;

  final img;

  const imgPerfilRedonda({Key? key, this.size = 22, this.img})
      : super(key: key);

  @override
  _imgPerfilRedondaState createState() => _imgPerfilRedondaState();
}

class _imgPerfilRedondaState extends State<imgPerfilRedonda> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil();
    var imgMemory = null;
    if (widget.img != null) {
      imgMemory = PhotoHelper.convertStringToUint8List(widget.img);
    }

    return widget.img != null
        ? Container(
            width: responsive.isVertical()
                ? responsive.anchoP(widget.size)
                : responsive.anchoP(widget.size - 8),
            height: responsive.isVertical()
                ? responsive.anchoP(widget.size)
                : responsive.anchoP(widget.size - 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                style: BorderStyle.solid,
                width: 2.5,
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: imgMemory != null
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: Image.memory(imgMemory).image,
                          fit: BoxFit.fill),
                    ),
                  )
                : ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                    child: Image.asset(
                      AppImages.iconHuella,
                    ),
                  ),
          )
        : Container();
  }
}
