package com.example.mvvmproject.view;

import androidx.appcompat.app.AppCompatActivity;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModel;
import androidx.lifecycle.ViewModelProvider;

import android.os.Bundle;
import android.util.Log;

import com.example.mvvmproject.R;
import com.example.mvvmproject.model.Result;
import com.example.mvvmproject.viewmodel.MovieViewModel;

import java.util.List;

public class MainActivity extends AppCompatActivity {
    MovieViewModel viewModel;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //https://api.themoviedb.org/3/movie/top_rated?api_key=19c1c2d504f8ac3c45453893ebb0e54d
        viewModel = new ViewModelProvider(this).get(MovieViewModel.class);
        viewModel.hoga2().observe(this, new Observer<List<Result>>() {
            @Override
            public void onChanged(List<Result> results) {
                Log.e("voda", "onChanged: "+results.size());
            }
        });
    }
}