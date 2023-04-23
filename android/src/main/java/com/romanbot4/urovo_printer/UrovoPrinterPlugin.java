package com.romanbot4.urovo_printer;

import android.device.DeviceManager;
import android.device.PrinterManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Environment;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** UrovoPrinterPlugin */
public class UrovoPrinterPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private PrinterManager printerManager;
  private DeviceManager deviceManager;

  private void initPrinter() {
    if(printerManager != null) return;
    printerManager = new PrinterManager();
  }

  private  void initDevice() {
    if(deviceManager != null) return;
    deviceManager = new DeviceManager();
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "urovo_printer");
    channel.setMethodCallHandler(this);
    initDevice();
    initPrinter();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
      return;
    }

    if(call.method.equals("getDeviceId")) {
      result.success(deviceManager.getDeviceId());
      return;
    }

    if(call.method.equals("printPage")) {
      final int page =  call.argument("page");
      result.success(printerManager.printPage(page));
      return;
    }

    if(call.method.equals("forwardPaper")) {
      final int len =  call.argument("len");
      printerManager.prn_paperForWard(len);
      result.success(0);
      return;
    }

    if(call.method.equals("paperFeed")) {
      final int len =  call.argument("len");
      printerManager.paperFeed(len);
      result.success(0);
      return;
    }

    if(call.method.equals("getTIDSN")) {
      result.success(deviceManager.getTIDSN());
      return;
    }

    //getStatus
    if(call.method.equals("getStatus")) {
      result.success(printerManager.getStatus());
      return;
    }

    //clearPage
    if(call.method.equals("clearPage")) {
      result.success(printerManager.clearPage());
      return;
    }

    //close
    if(call.method.equals("close")) {
      result.success(printerManager.close());
      return;
    }

    //getTemp
    if(call.method.equals("getTemp")) {
      result.success(printerManager.getTemp());
      return;
    }

    if(call.method.equals("open")) {
      result.success(printerManager.open());
      return;
    }

    if(call.method.equals("printCachedPage")) {
      result.success(printerManager.printCachedPage());
      return;
    }

    if(call.method.equals("drawBarcode")) {
      drawBarcode(call,result);
      return;
    }

    if(call.method.equals("drawText")) {
      drawText(call,result);
      return;
    }

    if(call.method.equals("drawTextEx")) {
      drawTextEx(call,result);
      return;
    }

    if(call.method.equals("drawLine")) {
      drawLine(call,result);
      return;
    }

    if(call.method.equals("drawBitmap")) {
      drawBitmap(call,result);
      return;
    }

    if(call.method.equals("drawBitmapEx")) {
      drawBitmapEx(call,result);
      return;
    }

    if(call.method.equals("setGreyLevel")) {
      setGreyLevel(call,result);
      return;
    }

    if(call.method.equals("setupPage")) {
      setupPage(call,result);
      return;
    }

    if(call.method.equals("setSpeedLevel")) {
      setSpeedLevel(call,result);
      return;
    }

    result.notImplemented();
  }

  private void setGreyLevel(@NonNull MethodCall call, @NonNull Result result) {
    int level = call.argument("level");
    printerManager.setGrayLevel(level);
    System.out.println(String.format("Printer Manager: Grey Leve %d",level));
    result.success(0);
  }

  private void setupPage(@NonNull MethodCall call,@NonNull Result result) {
    int width = call.argument("width");
    int height = call.argument("height");
    final int value = printerManager.setupPage(width,height);
    System.out.println(String.format("Printer Manager: Page Size %dx%d",width, height));
    result.success(value);
  }

  private void setSpeedLevel(@NonNull MethodCall call,@NonNull Result result) {
    int level = call.argument("level");
    printerManager.setSpeedLevel(level);
    System.out.println(String.format("Printer Manager: Speed %d",level));
    result.success(0);
  }

  private void drawBarcode(@NonNull MethodCall call, @NonNull Result result) {
    String data = call.argument("data");
    int x = call.argument("x");
    int y = call.argument("y");
    int barcodeType = call.argument("barcodetype");
    int width = call.argument("width");
    int height = call.argument("height");
    int rotate = call.argument("rotate");
    final int value = printerManager.drawBarcode(data,x,y,barcodeType,width,height,rotate);
    result.success(value);
  }

  private void drawText(@NonNull MethodCall call, @NonNull Result result) {
    String data = call.argument("data");
    int x = call.argument("x");
    int y = call.argument("y");
//    String fontPath = Environment.getExternalStorageDirectory() + "/zawgyi-one.ttf";
//    System.out.println(fontPath);
    String fontName = call.argument("fontname");
    int fontSize = call.argument("fontsize");
    boolean bold = call.argument("bold");
    boolean italic = call.argument("italic");
    int rotate = call.argument("rotate");
    final int value = printerManager.drawText(data,x,y,fontName,fontSize,bold,italic,rotate);
    result.success(value);
  }

  private void drawTextEx(@NonNull MethodCall call, @NonNull Result result) {
    String data = call.argument("data");
    int x = call.argument("x");
    int y = call.argument("y");
    int width = call.argument("width");
    int height = call.argument("height");
    String fontName = call.argument("fontname");
    int fontSize = call.argument("fontsize");
    int style = call.argument("style");
    int rotate = call.argument("format");
    int format = call.argument("rotate");
    final int value = printerManager.drawTextEx(data,x,y,width,height,fontName,fontSize,rotate,style,format);
    result.success(value);
  }

  private void drawLine(@NonNull MethodCall call, @NonNull Result result) {
    int x0 = call.argument("x0");
    int y0 = call.argument("y0");
    int x1 = call.argument("x1");
    int y1 = call.argument("y1");
    int lineWidth = call.argument("lineWidth");
    final int value =  printerManager.drawLine(x0,y0,x1,y1,lineWidth);
    result.success(value);
  }

  private void drawBitmap(@NonNull MethodCall call, @NonNull Result result) {
    byte[] bytes = call.argument("bytes");
    Bitmap bmp = BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
    int xDest = call.argument("xDest");
    int yDest = call.argument("yDest");
    final int value = printerManager.drawBitmap(bmp,xDest,yDest);
    result.success(value);
  }

  private void drawBitmapEx(@NonNull MethodCall call, @NonNull Result result) {
    byte[] pbmp = call.argument("bytes");
    int xDest = call.argument("xDest");
    int yDest = call.argument("yDest");
    int widthDest = call.argument("widthDest");
    int heightDest = call.argument("heightDest");
    final int value = printerManager.drawBitmapEx(pbmp,xDest,yDest,widthDest,heightDest);
    result.success(value);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
