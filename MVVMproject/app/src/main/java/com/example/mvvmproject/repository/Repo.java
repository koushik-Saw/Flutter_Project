package com.example.mvvmproject.repository;

import android.content.Context;
import android.util.Log;

import androidx.lifecycle.MutableLiveData;

import com.example.mvvmproject.model.ModelClass;
import com.example.mvvmproject.model.Result;
import com.example.mvvmproject.network.ApiServices;
import com.example.mvvmproject.network.RetrofitImageTrans;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class Repo {
  static Repo repo;
  static Context context;
   List<Result> results;
    public static Repo getRepo(Context context) {
        if(repo == null){
            repo = new Repo();
            context = context;
        }
        return repo;
    }
    ModelClass modelClass;

    public MutableLiveData<List<Result>> hoga(){
        MutableLiveData mutableLiveData = new MutableLiveData();
        ApiServices apiServices = RetrofitImageTrans.getRetrofitInstance().create(ApiServices.class);

       Call<ModelClass> call = apiServices.getTopmovies();
        call.enqueue(new Callback() {
            @Override
            public void onResponse(Call call, Response response) {
                if (response.isSuccessful()){
                    modelClass = (ModelClass) response.body();
                   results = modelClass.getResults();
                   mutableLiveData.setValue(results);
                }
            }

            @Override
            public void onFailure(Call call, Throwable t) {
                Log.e("Hoga", "onFailure: "+ t.getLocalizedMessage());
                mutableLiveData.setValue(t.getLocalizedMessage());
            }
        });
        return mutableLiveData;
    }
}

