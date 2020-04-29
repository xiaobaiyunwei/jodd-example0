package jodd.example.test;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */
import java.text.SimpleDateFormat;
import java.util.*;
import java.io.*;

public class LogManager {
  String logpath = "logs/";
  public static SimpleDateFormat logformat = new SimpleDateFormat(
      "yyyyMMdd", Locale.ENGLISH);
  public static SimpleDateFormat logdate = new SimpleDateFormat("HH:mm:ss");
  static {
    logformat.setTimeZone(java.util.TimeZone.getTimeZone("GMT+8"));
    logdate.setTimeZone(java.util.TimeZone.getTimeZone("GMT+8"));
  }

  boolean debugFlag = false;
  public LogManager(String path, boolean db) {
    logpath = path;
    debugFlag = db;
    try {
      File f = new File(logpath);
      if (!f.exists()) {
        f.mkdirs();
      }
    }
    catch (Exception ex) {
      System.out.println("初始化日志目录[" + path + "]出错: " + ex.toString());
    }
  }

  public void log(String msg, boolean dbLevel) {
    if (debugFlag) {
      System.out.println(msg);
      log(msg);
    }
    else {
      if (!dbLevel) {
        log(msg);
      }
    }

  }

  public void logerror(String msg, boolean dbLevel) {
    if (debugFlag) {
      System.out.println(msg);
      logError(msg);
    }
    else {
      if (!dbLevel) {
        logError(msg);
      }
    }

  }

  public static String formatFilename(String path, String pix) {
    Date d = new Date();
    return path + '/' + logformat.format(d) + pix;
  }

  private  synchronized void logError(String msg) {
    if (msg == null || msg.equals("")) {
      return;
    }
    Date d = new Date();
    String filename = logpath + logformat.format(d) + ".err";
    File file = new File(filename);
    RandomAccessFile rf = null;
    try {
      long filelen = file.exists() ? file.length() : 0;
      rf = new RandomAccessFile(file, "rw");
      rf.seek(filelen);
      String m = logdate.format(d) + "\t" + msg + "\r\n";
      //System.out.println(m);
      rf.write(m.getBytes("GB2312"));
    }
    catch (Exception ex) {
      System.out.println("写日志错误�?");
    }
    finally {
      if (rf != null) {
        try {
          rf.close();
        }
        catch (Exception ex) {}
      }
    }

  }

  private  synchronized void log(String msg) {

    if (msg == null || msg.equals("")) {
      return;
    }
    Date d = new Date();
    String filename = logpath + logformat.format(d) + ".log";
    File file = new File(filename);
    RandomAccessFile rf = null;
    try {
      long filelen = file.exists() ? file.length() : 0;
      rf = new RandomAccessFile(file, "rw");
      rf.seek(filelen);
      String m = logdate.format(d) + "\t" + msg + "\r\n";
      //System.out.println(m);
      rf.write(m.getBytes("utf-8"));
    }
    catch (Exception ex) {
      System.out.println("写日志错误�?");
    }
    finally {
      if (rf != null) {
        try {
          rf.close();
        }
        catch (Exception ex) {}
      }
    }

  }

  public static void main(String args[]) {
    LogManager lmng = new LogManager("d:\\temp\\logs\\", true);
    lmng.log("是不是这样的");
  }
}