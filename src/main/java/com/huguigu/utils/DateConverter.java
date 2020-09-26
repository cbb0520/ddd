package com.huguigu.utils;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期转换工具类
 */
public class DateConverter implements Converter<String, Date> {

    private String[] patterns;

    public void setPatterns(String[] patterns) {
        this.patterns = patterns;
    }

    @Override
    public Date convert(String s) {
        if(StringUtils.isNotBlank(s)){
            //转换
            Date dt =null;

            try {
                dt =DateUtils.parseDate(s,patterns);
                return dt;
            } catch (ParseException e) {
                return null;
            }
        }
        return null;
    }
}
