part of 'custom_app_widgets.dart';

class PeriodoWidget extends StatefulWidget {
  const PeriodoWidget({Key? key, required this.onSelectedDate})
      : super(key: key);

  final ValueChanged<ModelFechaDesdeHasta> onSelectedDate;

  @override
  State<PeriodoWidget> createState() => _PeriodoWidgetState();
}

class _PeriodoWidgetState extends State<PeriodoWidget> {
  DateTime hoy = DateTime.now();
  DateTime ayer = DateTime.now();

  DateTime desde = DateTime.now();
  DateTime hasta = DateTime.now();

  String fechaHoy = '';
  String fechaAyer = '';

  String fechaDesde = '';
  String fechaHasta = '';
  bool mostrarFechas = false;
  List<ModelDataCombo> datos = [
    ModelDataCombo(id: 1, titulo: 'Hoy'),
    ModelDataCombo(id: 2, titulo: 'Ayer'),
    ModelDataCombo(id: 3, titulo: 'Por Fecha'),
    ModelDataCombo(id: 4, titulo: 'Todos'),
  ];

  List<String> datosString = [
    'Hoy',
    'Ayer','Por Fecha', 'Todos'
  ];
  String value = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fechaDesde = DateFormat(AppConfig.formatoFecha).format(desde);
    fechaHasta = DateFormat(AppConfig.formatoFecha).format(hasta);
    ayer = DateTime.now().add(Duration(days: -1));

    fechaHoy = DateFormat(AppConfig.formatoFecha).format(hoy);
    fechaAyer = DateFormat(AppConfig.formatoFecha).format(ayer);
    value = datos[0].titulo;
  }

  @override
  Widget build(BuildContext context) {
    return periodo();
  }

  Widget periodo() {
    Widget fechas = ContenedorDesingWidget(
        margin: EdgeInsets.only(top: 5),
        paddin: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: BtnIconWidget(
                    colorBtn: Colors.transparent,
                    icon: Icons.date_range_sharp,
                    titulo: "Desde: " + fechaDesde,
                    onPressed: () {
                      showDialogoFechaHoraWidget(
                        Get.context!,
                        mostrarHora: false,
                        initialDate: desde,
                        onSelectedDate: (selectedDate) {
                          desde = selectedDate;
                          //se verifica que la fecha desde no sea mayor a la de hasta
                          bool valDate = hasta.isBefore(desde);
                          //si desde es mayor se le suma asigna la misma fecha a hasta
                          if (valDate) {
                            hasta = desde;
                          }
                          fechaDesde =
                              DateFormat(AppConfig.formatoFecha).format(desde);
                          fechaHasta =
                              DateFormat(AppConfig.formatoFecha).format(hasta);
                          widget.onSelectedDate(ModelFechaDesdeHasta(
                              fechaDesde: fechaDesde, fechaHasta: fechaHasta));
                          setState(() {});
                        },
                      );
                    })),
            Flexible(
                child: BtnIconWidget(
                    colorBtn: Colors.transparent,
                    icon: Icons.date_range_sharp,
                    titulo: "Hasta: " + fechaHasta,
                    onPressed: () {
                      showDialogoFechaHoraWidget(
                        Get.context!,
                        mostrarHora: false,
                        initialDate: hasta,
                        onSelectedDate: (selectedDate) {
                          hasta = selectedDate;

                          //se verifica que la fecha hasta no sea menor a la de desde
                          bool valDate = hasta.isBefore(desde);
                          //si desde es menor se le suma asigna la misma fecha
                          if (valDate) {
                            desde = hasta;
                          }
                          fechaDesde =
                              DateFormat(AppConfig.formatoFecha).format(desde);
                          fechaHasta =
                              DateFormat(AppConfig.formatoFecha).format(hasta);

                          widget.onSelectedDate(ModelFechaDesdeHasta(
                              fechaDesde: fechaDesde, fechaHasta: fechaHasta));
                          setState(() {});
                        },
                      );
                    })),
          ],
        ));

    return Column(
      children: [comboNormal(), mostrarFechas ? fechas : SizedBox()],
    );
  }

  Widget comboBusqueda() {
    return ComboConBusqueda(
      data: datos,
      complete: (ModelDataCombo dato) {
        switch (dato.titulo) {
          case "Hoy":
            widget.onSelectedDate(ModelFechaDesdeHasta(
                fechaDesde: fechaHoy, fechaHasta: fechaHoy));
            mostrarFechas = false;
            break;

          case "Ayer":
            widget.onSelectedDate(ModelFechaDesdeHasta(
                fechaDesde: fechaAyer, fechaHasta: fechaAyer));
            mostrarFechas = false;
            break;

          case "Todos":
            widget.onSelectedDate(
                ModelFechaDesdeHasta(fechaDesde: 'todos', fechaHasta: 'todos'));
            mostrarFechas = false;
            break;

          case "Por Fecha":
            mostrarFechas = true;
            widget.onSelectedDate(ModelFechaDesdeHasta(
                fechaDesde: fechaDesde, fechaHasta: fechaHasta));
            break;

          default:
            mostrarFechas = false;
        }

        setState(() {});
      },
      title: "Periodo",
      titleSelecioneEl: "Seleccione el periodo",
    );
  }

  Widget comboNormal() {
    Widget combo1 = ComboNormal(
        nameStringImg: AppImages.iconBuscar,
        titulo: "Seleccione el Periodo",
        value: value,
        onChanged: (String? dato) {
          value = dato!;
          switch (dato) {
            case "Hoy":
              widget.onSelectedDate(ModelFechaDesdeHasta(
                  fechaDesde: fechaHoy, fechaHasta: fechaHoy));
              mostrarFechas = false;
              break;

            case "Ayer":
              widget.onSelectedDate(ModelFechaDesdeHasta(
                  fechaDesde: fechaAyer, fechaHasta: fechaAyer));
              mostrarFechas = false;
              break;

            case "Todos":
              widget.onSelectedDate(ModelFechaDesdeHasta(
                  fechaDesde: '1900-01-01', fechaHasta: '3000-01-01'));
              mostrarFechas = false;
              break;

            case "Por Fecha":
              mostrarFechas = true;
              widget.onSelectedDate(ModelFechaDesdeHasta(
                  fechaDesde: fechaDesde, fechaHasta: fechaHasta));
              break;

            default:
              mostrarFechas = false;
          }

          setState(() {});
        },
        items: datosString);

    return combo1;
  }
}

class ModelFechaDesdeHasta {
  final String fechaDesde;
  final String fechaHasta;

  ModelFechaDesdeHasta({required this.fechaDesde, required this.fechaHasta});
}
