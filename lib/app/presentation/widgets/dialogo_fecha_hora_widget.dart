part of 'custom_app_widgets.dart';


//import 'package:intl/intl.dart';


Future<TimeOfDay?> _selectTime(BuildContext context,
    {required DateTime initialDate}) {
  final now = DateTime.now();

  return showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: initialDate.hour, minute: initialDate.minute),
  );
}

Future<DateTime?> _selectDateTime(BuildContext context,
    {required DateTime initialDate}) {
  final now = DateTime.now();
  final newestDate = initialDate.isAfter(now) ? initialDate : now;

  return showDatePicker(


    context: context,
    initialDate: newestDate.add(Duration(seconds: 1)),
    //firstDate: now,  si solo pueda selecionar la fecha desde la actual asta adelante
    firstDate: DateTime(2018),
    lastDate: DateTime(2100),
  );
}

Dialog? showDialogoFechaHoraWidget(
  BuildContext context, {
  required ValueChanged<DateTime> onSelectedDate,
  required DateTime initialDate,
  bool mostrarHora=true,
}) {
  final dialog = Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: AppColors.colorAzul, blurRadius: 5)
          ]),
      child: DialogoFechaHoraWidget(
        mostrarHora: mostrarHora,
          onSelectedDate: onSelectedDate, initialDate: initialDate),
    ),
  );

  showDialog(context: context, builder: (BuildContext context) => dialog);
}

class DialogoFechaHoraWidget extends StatefulWidget {
  final ValueChanged<DateTime> onSelectedDate;
  final DateTime initialDate;
  final bool mostrarHora;

  const DialogoFechaHoraWidget({
    required this.onSelectedDate,
    required this.initialDate,
    Key? key, this.mostrarHora=true,
  }) : super(key: key);

  @override
  _DialogoFechaHoraWidgetState createState() => _DialogoFechaHoraWidgetState();
}

class _DialogoFechaHoraWidgetState extends State<DialogoFechaHoraWidget> {
 late DateTime selectedDate;

  @override
  void initState() {
    super.initState();

    selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Seleccione la Fecha',
            style:TextStyle(fontWeight: FontWeight.bold,color: AppColors.prymary),

          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                borderRadius: BorderRadius.circular(5),
                elevation: 2,
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () async {
                    final date = await _selectDateTime(context,
                        initialDate: selectedDate);

                    if (date == null) return;

                    setState(() {
                      selectedDate = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        selectedDate.hour,
                        selectedDate.minute,
                      );
                    });

                    widget.onSelectedDate(selectedDate);
                  },
                  // handle your onTap here
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[


                        BtnIconWidget(icon:Icons.date_range,),

                        Text(DateFormat(AppConfig.formatoFecha)
                            .format(selectedDate),style: Theme.of(context).textTheme.titleMedium,)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
             widget.mostrarHora? Material(
                borderRadius: BorderRadius.circular(5),
                elevation: 2,
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () async {
                    final time =
                        await _selectTime(context, initialDate: selectedDate);
                    if (time == null) return;

                    setState(() {
                      selectedDate = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        time.hour,
                        time.minute,
                      );
                    });

                    widget.onSelectedDate(selectedDate);
                  },
                  // handle your onTap here
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[


                        BtnIconWidget(icon:Icons.update,),


                        Text(DateFormat(AppConfig.formatoHora)
                            .format(selectedDate))
                      ],
                    ),
                  ),
                ),
              ):Container()
            ],
          ),
          const SizedBox(height: 40),


          BotonesWidget(
            title: "ACEPTAR",
            iconData: Icons.check,

            onPressed: (){
            widget.onSelectedDate(selectedDate);
            Navigator.of(context).pop();
          },),




        ],
      ),
    );
  }
}
