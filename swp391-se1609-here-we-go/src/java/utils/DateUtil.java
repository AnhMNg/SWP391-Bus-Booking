/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author baolo
 */
public class DateUtil {

    public static String convertDateFormat(String dateString) throws ParseException {
        String[] split = dateString.split("\\.");
        String rs = null;
        String dateTmp = split[0];
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm:ss  E, dd-MM-yyyy");

        Date date = formatter.parse(dateTmp);
        rs = formatter2.format(date);

        return rs;
    }

    
    public static Date addDays(Date date, int days)
    {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, days); //minus number would decrement the days
        return cal.getTime();
    }
}
