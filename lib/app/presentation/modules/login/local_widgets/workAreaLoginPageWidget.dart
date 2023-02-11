import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../app/core/utils/responsiveUtil.dart';
import '../../../../../../app/core/utils/utilidadesUtil.dart';
import '../../../../../../app/core/values/app_images.dart';
import '../../../../../../app/core/values/app_colors.dart';
import '../../../../../../app/data/providers/providers_impl.dart';
import '../../../../../app/presentation/widgets/custom_app_widgets.dart';
import '../../../../core/app_config.dart';

class WorkAreaLoginPageWidget extends StatefulWidget {
  final RxBool peticionServer;
  final String title;
  final List<Widget> contenido;
  final bool btnAtras;
  final VoidCallback? pantallaIrAtras;
  final Widget? widgetBtnFinal;
  final EdgeInsetsGeometry? paddin;
  final FloatingActionButtonLocation ubicacionBtnFinal;
  final imgPerfil;
  final imgFondo;
  final double sizeTittle;
  final bool mostrarVersion;
  final bool eliminarSpaceTop;

  const WorkAreaLoginPageWidget({
    required this.peticionServer ,
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
    this.eliminarSpaceTop = false,
  });

  @override
  _WorkAreaLoginPageWidgetState createState() => _WorkAreaLoginPageWidgetState();
}

class _WorkAreaLoginPageWidgetState extends State<WorkAreaLoginPageWidget> {
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
        widget.imgFondo == null
            ? AppImages.imgFondoDefault
            : widget.imgFondo,
        fit: BoxFit.cover,
      ),
    );

    wgImgFondo=Container();

    Widget wgImgPerfil = Container(

      margin: EdgeInsets.only(
        top: responsive.altoP(2.0),
      ),
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(AppConfig.radioBordecajas),
          boxShadow: [
            BoxShadow(color: Colors.blue.withOpacity(0.1), blurRadius: 45)
          ]),
      child: Center(
        child: Column(
          children: <Widget>[
            imgPerfilRedonda(
              size: 22,
              img: widget.imgPerfil,
            ),


            Container(height: 1,color: Colors.white,),
            Container(height: 1,color: Colors.white,margin: EdgeInsets.only(top: 4),),
            widget.title != ''
                ? Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.sizeTittle == 0
                      ? responsive.anchoP(5)
                      : responsive.anchoP(widget.sizeTittle)),
            )
                : Container(),

            Container(height: 1,color: Colors.white,),
            Container(height: 1,color: Colors.white,margin: EdgeInsets.only(top: 4),),

            widget.mostrarVersion
                ? Text(
              'Versión 2: Build-' + version + ' ' + Host.getAmbiente(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.5)),
            )
                : Container(),

            Container(height: responsive.altoP(25),width: responsive.altoP(25),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(AppConfig.radioBordecajas),
                child: Image.asset(AppImages.imgLoginDesing, fit: BoxFit.cover,)),
            ),
            SizedBox(height: 10,),
            Container(height: 3,color: Colors.white,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.double_arrow,color: Colors.white),
              Text(
                "Sanciones - ASPD",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: widget.sizeTittle == 0
                        ? responsive.anchoP(5)
                        : responsive.anchoP(widget.sizeTittle)),
              ),
            ],),

            SizedBox(height: 4,),
            Container(height: 3,color: Colors.white,),

          ],
        ),
      ),
    );

    Color c=Color(0xFF154986);
    //azul
    int r=22,g=73,b=135;
   c=Color.fromRGBO(r, g, b, 100);



    return Scaffold(
        backgroundColor: AppColors.colorBackground,
        floatingActionButtonLocation: widget.ubicacionBtnFinal,
        floatingActionButton: widget.widgetBtnFinal,
        body: SafeArea(child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Stack(
              children: [
                wgImgFondo,
                Center(child:  SingleChildScrollView(

                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: <Widget>[
                        wgImgPerfil,
                        Column(
                          children: widget.contenido != null
                              ? widget.contenido
                              : [Container()],
                        ),

                        SizedBox(height:responsive.altoP(5),),

                      ],
                    )),),
                Obx(() => CargandoWidget(
                  mostrar: widget.peticionServer.value,
                ))
              ],
            )),));













    Widget wgBtnAtras = Container(
      width: responsive.ancho,
      height: responsive.isVertical()
          ? responsive.altoP(8.5)
          : responsive.altoP(20),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: responsive.anchoP(38),
              height: responsive.anchoP(38),
            ),
          ),
          widget.btnAtras
              ? BtnAtrasWidget(
            pantallaIrAtras: widget.pantallaIrAtras,
          )
              : Container(),
        ],
      ),
    );


    return Scaffold(
        floatingActionButtonLocation: widget.ubicacionBtnFinal,
        floatingActionButton: widget.widgetBtnFinal,
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
                      wgBtnAtras,
                      Expanded(
                        child: SingleChildScrollView(
                            padding: widget.paddin,
                            child: Container(

                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                                  wgImgPerfil,

                                  Column(
                                    children: widget.contenido != null
                                        ? widget.contenido
                                        : [Container()],
                                  )


                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ),
               Obx(()=> CargandoWidget(
                 mostrar: widget.peticionServer.value,
               ))
              ],
            )));
  }
}


