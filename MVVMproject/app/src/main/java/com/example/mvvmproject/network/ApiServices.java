package com.example.mvvmproject.network;

import com.example.mvvmproject.model.ModelClass;

import retrofit2.Call;
import retrofit2.http.GET;

public interface ApiServices {
    @GET("3/movie/top_rated?api_key=19c1c2d504f8ac3c45453893ebb0e54d")
    Call<ModelClass> getTopmovies();
}
