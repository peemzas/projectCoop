package com.springapp.mvc.util;

import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Phuthikorn_T on 16-Sep-15.
 */
@Component
public class DateUtil {

//    public static Timestamp getDateWithRemoveTime(String date){
//        String newFormateDate =  convertStringDate(date);
//        Timestamp maxTimeDate = Timestamp.valueOf(newFormateDate+" "+"00:00:00.000");
//
//        return maxTimeDate;
//    }
//    private static String convertStringDate(String dateString1){
//        String newDate ="";
//        try{
//            Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dateString1);
//            SimpleDateFormat newformat = new SimpleDateFormat("yyyy-MM-dd");
//            newDate = newformat.format(date);
//        }
//        catch(Exception e){
//            e.printStackTrace();
//        }
//
//        return newDate;
//    }

    public static Date getCurrentDateWithRemovedTime(){
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        return calendar.getTime();
    }

    public static Date removeTime(Date date){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        return calendar.getTime();
    }

}
