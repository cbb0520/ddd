package com.huguigu.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class UserInfo {
    private int id;
    private String name;
    private String sex;
    private int age;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date shengri;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Date getShengri() {
        return shengri;
    }

    public void setShengri(Date shengri) {
        this.shengri = shengri;
    }

    public UserInfo(int id, String name, String sex, int age, Date shengri) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.shengri = shengri;
    }

    public UserInfo() {
        super();
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", shengri=" + shengri +
                '}';
    }
}
