package com.example.ikedatomoki.myapplication;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final TextView text_title=(TextView)findViewById(R.id.text_title);
        final TextView text_author=(TextView)findViewById(R.id.text_author);
        final TextView text_summary=(TextView)findViewById(R.id.text_summary);

        Retrofit retro = new Retrofit.Builder()
                .baseUrl("https://api.zaif.jp")
                .addConverterFactory(GsonConverterFactory.create())
                .build();

        API_Interface service = retro.create(API_Interface.class);

        Call<Data> btc = service.API("red");

        btc.enqueue(new Callback<Data>() {
            @Override
            public void onResponse(Call<Data> call, Response<Data> response) {
                Data ticker = response.body();
                text_title.setText("タイトル:"+ticker.getTitle());
                text_author.setText("著者:"+ticker.getAuthor());
                text_summary.setText("あらすじ:"+ticker.getSummary());

            }

            @Override
            public void onFailure(Call<Data> call, Throwable t) {
            }
        });
    }
}


