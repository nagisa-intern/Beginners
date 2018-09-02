package com.example.ikedatomoki.myapplication;

public class Data {

    public String title;
    public String author;
    public String summary;


    public Data(String title, String author, String summary) {
        super();
        this.title = title;
        this.author = author;
        this.summary = summary;

    }

    public String getTitle() {
        return title;
    }

    public String getAuthor() {
        return author;
    }

    public String getSummary() {
        return summary;
    }

}
