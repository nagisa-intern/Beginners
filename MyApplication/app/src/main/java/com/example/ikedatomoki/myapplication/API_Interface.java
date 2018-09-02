package com.example.ikedatomoki.myapplication;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;

public interface API_Interface {

    @GET("/api/1/ticker/{comic_color}")
    Call<Data> API(@Path("comic_color") String comic_color);

}
