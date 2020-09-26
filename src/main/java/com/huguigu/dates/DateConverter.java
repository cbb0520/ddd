package com.huguigu.dates;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.core.convert.converter.Converter;


import java.text.ParseException;
import java.util.Date;

public class DateConverter implements Converter<String, Date> {
    private String[] patterns;

    public void setPatterns(String[] patterns) {
        this.patterns = patterns;
    }

    @Override
    public Date convert(String s) {
        Date da = null;
        if (StringUtils.isNotBlank(s)) {
            try {
                da = DateUtils.parseDate(s, patterns);
            } catch (ParseException e) {
                return da;
            }
        }
        return da;
    }
}
