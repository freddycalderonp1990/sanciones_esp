part of '../../../providers_impl.dart';

class Host {
  //se utiliza el onlyUrl para no incluir el segmento
  // api/v1/siipne-movil/




  static gethost({bool onlyUrl = false})  {
    String url = '';
    switch (AppConfig.AmbienteUrl) {
      case Ambiente.desarrollo:

        url="http://192.168.3.42:8000/";

        url=_setSegmentoApp(url,onlyUrl);
        break;
      case Ambiente.prueba:
        url="https://dancova.com/pagme_test/public/"; //Pruebas
        url=_setSegmentoApp(url,onlyUrl);
        break;
      case Ambiente.produccion:




        url="https://dancova.com/pagme_prod/public/";
        url="http://51.161.34.72/pagme_prod/public/";

        url=_setSegmentoApp(url,onlyUrl);
        break;
    }
    return url;
  }

  static getAmbiente() {
    String ambiente = '';
    switch (AppConfig.AmbienteUrl) {
      case Ambiente.desarrollo:
        ambiente = "Desc"; //Desarrollo

        break;
      case Ambiente.prueba:

        ambiente="Test";
        break;
      case Ambiente.produccion:
        ambiente = "Prod"; //Produccion

        break;
    }
    return ambiente;
  }

  static  _setSegmentoApp(String url, onlyUrl) {
    if (onlyUrl) {
      return url;
    }

    String segmento = 'api/v1/';

    return url + segmento;
  }


}
