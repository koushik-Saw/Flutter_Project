package com.example.mvvmproject.viewmodel;

import android.app.Application;

import androidx.annotation.NonNull;
import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;

import com.example.mvvmproject.model.Result;
import com.example.mvvmproject.repository.Repo;

import java.util.List;

public class MovieViewModel extends AndroidViewModel {
    Repo repo ;
    LiveData mutableLiveData2;
    public MovieViewModel(@NonNull Application application) {
        super(application);
        repo = Repo.getRepo(application);
    }

    public LiveData<List<Result>> hoga2(){
        return repo.hoga();
    }
}
