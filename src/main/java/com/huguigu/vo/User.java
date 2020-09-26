package com.huguigu.vo;

import java.util.Arrays;

public class User {
    private int id;
    private String uname;
    private String parss;
    private byte[] image;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getParss() {
        return parss;
    }

    public void setParss(String parss) {
        this.parss = parss;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public User() {
        super();
    }

    public User(int id, String uname, String parss, byte[] image) {
        this.id = id;
        this.uname = uname;
        this.parss = parss;
        this.image = image;
    }


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", uname='" + uname + '\'' +
                ", parss='" + parss + '\'' +
                ", image=" + Arrays.toString(image) +
                '}';
    }
}
