// ignore_for_file: constant_identifier_names

class BarcodeType {
  final int id;

  const BarcodeType(this.id);

  static const int _BARCODE_CODE11 = 1;
  static const int _BARCODE_C25MATRIX = 2;
  static const int _BARCODE_C25INTER = 3;
  static const int _BARCODE_C25IATA = 4;
  static const int _BARCODE_C25LOGIC = 6;
  static const int _BARCODE_C25IND = 7;
  static const int _BARCODE_CODE39 = 8;
  static const int _BARCODE_EXCODE39 = 9;
  static const int _BARCODE_EANX = 13;
  static const int _BARCODE_EAN128 = 16;
  static const int _BARCODE_CODABAR = 18;
  static const int _BARCODE_CODE128 = 20;
  static const int _BARCODE_DPLEIT = 21;
  static const int _BARCODE_DPIDENT = 22;
  static const int _BARCODE_CODE16K = 23;
  static const int _BARCODE_CODE49 = 24;
  static const int _BARCODE_CODE93 = 25;
  static const int _BARCODE_FLAT = 28;
  static const int _BARCODE_RSS14 = 29;
  static const int _BARCODE_RSS_LTD = 30;
  static const int _BARCODE_RSS_EXP = 31;
  static const int _BARCODE_TELEPEN = 32;
  static const int _BARCODE_UPCA = 34;
  static const int _BARCODE_UPCE = 37;
  static const int _BARCODE_POSTNET = 40;
  static const int _BARCODE_MSI_PLESSEY = 47;
  static const int _BARCODE_FIM = 49;
  static const int _BARCODE_LOGMARS = 50;
  static const int _BARCODE_PHARMA = 51;
  static const int _BARCODE_PZN = 52;
  static const int _BARCODE_PHARMA_TWO = 53;
  static const int _BARCODE_PDF417 = 55;
  static const int _BARCODE_PDF417TRUNC = 56;
  static const int _BARCODE_MAXICODE = 57;
  static const int _BARCODE_QRCODE = 58;
  static const int _BARCODE_CODE128B = 60;
  static const int _BARCODE_AUSPOST = 63;
  static const int _BARCODE_AUSREPLY = 66;
  static const int _BARCODE_AUSROUTE = 67;
  static const int _BARCODE_AUSREDIRECT = 68;
  static const int _BARCODE_ISBNX = 69;
  static const int _BARCODE_RM4SCC = 70;
  static const int _BARCODE_DATAMATRIX = 71;
  static const int _BARCODE_EAN14 = 72;
  static const int _BARCODE_CODABLOCKF = 74;
  static const int _BARCODE_NVE18 = 75;
  static const int _BARCODE_JAPANPOST = 76;
  static const int _BARCODE_KOREAPOST = 77;
  static const int _BARCODE_RSS14STACK = 79;
  static const int _BARCODE_RSS14STACK_OMNI = 80;
  static const int _BARCODE_RSS_EXPSTACK = 81;
  static const int _BARCODE_PLANET = 82;
  static const int _BARCODE_MICROPDF417 = 84;
  static const int _BARCODE_ONECODE = 85;
  static const int _BARCODE_PLESSEY = 86;
  static const int _BARCODE_AZTEC = 92;

  static const BARCODE_CODE11 = BarcodeType(_BARCODE_CODE11);
  static const BARCODE_C25MATRIX = BarcodeType(_BARCODE_C25MATRIX);
  static const BARCODE_C25INTER = BarcodeType(_BARCODE_C25INTER);
  static const BARCODE_C25IATA = BarcodeType(_BARCODE_C25IATA);
  static const BARCODE_C25LOGIC = BarcodeType(_BARCODE_C25LOGIC);
  static const BARCODE_C25IND = BarcodeType(_BARCODE_C25IND);
  static const BARCODE_CODE39 = BarcodeType(_BARCODE_CODE39);
  static const BARCODE_EXCODE39 = BarcodeType(_BARCODE_EXCODE39);
  static const BARCODE_EANX = BarcodeType(_BARCODE_EANX);
  static const BARCODE_EAN128 = BarcodeType(_BARCODE_EAN128);
  static const BARCODE_CODABAR = BarcodeType(_BARCODE_CODABAR);
  static const BARCODE_CODE128 = BarcodeType(_BARCODE_CODE128);
  static const BARCODE_DPLEIT = BarcodeType(_BARCODE_DPLEIT);
  static const BARCODE_DPIDENT = BarcodeType(_BARCODE_DPIDENT);
  static const BARCODE_CODE16K = BarcodeType(_BARCODE_CODE16K);
  static const BARCODE_CODE49 = BarcodeType(_BARCODE_CODE49);
  static const BARCODE_CODE93 = BarcodeType(_BARCODE_CODE93);
  static const BARCODE_FLAT = BarcodeType(_BARCODE_FLAT);
  static const BARCODE_RSS14 = BarcodeType(_BARCODE_RSS14);
  static const BARCODE_RSS_LTD = BarcodeType(_BARCODE_RSS_LTD);
  static const BARCODE_RSS_EXP = BarcodeType(_BARCODE_RSS_EXP);
  static const BARCODE_TELEPEN = BarcodeType(_BARCODE_TELEPEN);
  static const BARCODE_UPCA = BarcodeType(_BARCODE_UPCA);
  static const BARCODE_UPCE = BarcodeType(_BARCODE_UPCE);
  static const BARCODE_POSTNET = BarcodeType(_BARCODE_POSTNET);
  static const BARCODE_MSI_PLESSEY = BarcodeType(_BARCODE_MSI_PLESSEY);
  static const BARCODE_FIM = BarcodeType(_BARCODE_FIM);
  static const BARCODE_LOGMARS = BarcodeType(_BARCODE_LOGMARS);
  static const BARCODE_PHARMA = BarcodeType(_BARCODE_PHARMA);
  static const BARCODE_PZN = BarcodeType(_BARCODE_PZN);
  static const BARCODE_PHARMA_TWO = BarcodeType(_BARCODE_PHARMA_TWO);
  static const BARCODE_PDF417 = BarcodeType(_BARCODE_PDF417);
  static const BARCODE_PDF417TRUNC = BarcodeType(_BARCODE_PDF417TRUNC);
  static const BARCODE_MAXICODE = BarcodeType(_BARCODE_MAXICODE);
  static const BARCODE_QRCODE = BarcodeType(_BARCODE_QRCODE);
  static const BARCODE_CODE128B = BarcodeType(_BARCODE_CODE128B);
  static const BARCODE_AUSPOST = BarcodeType(_BARCODE_AUSPOST);
  static const BARCODE_AUSREPLY = BarcodeType(_BARCODE_AUSREPLY);
  static const BARCODE_AUSROUTE = BarcodeType(_BARCODE_AUSROUTE);
  static const BARCODE_AUSREDIRECT = BarcodeType(_BARCODE_AUSREDIRECT);
  static const BARCODE_ISBNX = BarcodeType(_BARCODE_ISBNX);
  static const BARCODE_RM4SCC = BarcodeType(_BARCODE_RM4SCC);
  static const BARCODE_DATAMATRIX = BarcodeType(_BARCODE_DATAMATRIX);
  static const BARCODE_EAN14 = BarcodeType(_BARCODE_EAN14);
  static const BARCODE_CODABLOCKF = BarcodeType(_BARCODE_CODABLOCKF);
  static const BARCODE_NVE18 = BarcodeType(_BARCODE_NVE18);
  static const BARCODE_JAPANPOST = BarcodeType(_BARCODE_JAPANPOST);
  static const BARCODE_KOREAPOST = BarcodeType(_BARCODE_KOREAPOST);
  static const BARCODE_RSS14STACK = BarcodeType(_BARCODE_RSS14STACK);
  static const BARCODE_RSS14STACK_OMNI = BarcodeType(_BARCODE_RSS14STACK_OMNI);
  static const BARCODE_RSS_EXPSTACK = BarcodeType(_BARCODE_RSS_EXPSTACK);
  static const BARCODE_PLANET = BarcodeType(_BARCODE_PLANET);
  static const BARCODE_MICROPDF417 = BarcodeType(_BARCODE_MICROPDF417);
  static const BARCODE_ONECODE = BarcodeType(_BARCODE_ONECODE);
  static const BARCODE_PLESSEY = BarcodeType(_BARCODE_PLESSEY);
  static const BARCODE_AZTEC = BarcodeType(_BARCODE_AZTEC);

  static const values = [
    BARCODE_CODE11,
    BARCODE_C25MATRIX,
    BARCODE_C25INTER,
    BARCODE_C25IATA,
    BARCODE_C25LOGIC,
    BARCODE_C25IND,
    BARCODE_CODE39,
    BARCODE_EXCODE39,
    BARCODE_EANX,
    BARCODE_EAN128,
    BARCODE_CODABAR,
    BARCODE_CODE128,
    BARCODE_DPLEIT,
    BARCODE_DPIDENT,
    BARCODE_CODE16K,
    BARCODE_CODE49,
    BARCODE_CODE93,
    BARCODE_FLAT,
    BARCODE_RSS14,
    BARCODE_RSS_LTD,
    BARCODE_RSS_EXP,
    BARCODE_TELEPEN,
    BARCODE_UPCA,
    BARCODE_UPCE,
    BARCODE_POSTNET,
    BARCODE_MSI_PLESSEY,
    BARCODE_FIM,
    BARCODE_LOGMARS,
    BARCODE_PHARMA,
    BARCODE_PZN,
    BARCODE_PHARMA_TWO,
    BARCODE_PDF417,
    BARCODE_PDF417TRUNC,
    BARCODE_MAXICODE,
    BARCODE_QRCODE,
    BARCODE_CODE128B,
    BARCODE_AUSPOST,
    BARCODE_AUSREPLY,
    BARCODE_AUSROUTE,
    BARCODE_AUSREDIRECT,
    BARCODE_ISBNX,
    BARCODE_RM4SCC,
    BARCODE_DATAMATRIX,
    BARCODE_EAN14,
    BARCODE_CODABLOCKF,
    BARCODE_NVE18,
    BARCODE_JAPANPOST,
    BARCODE_KOREAPOST,
    BARCODE_RSS14STACK,
    BARCODE_RSS14STACK_OMNI,
    BARCODE_RSS_EXPSTACK,
    BARCODE_PLANET,
    BARCODE_MICROPDF417,
    BARCODE_ONECODE,
    BARCODE_PLESSEY,
    BARCODE_AZTEC,
  ];
}
