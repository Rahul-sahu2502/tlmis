<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PerformanceController extends Controller
{
    public function count_tasks()
    {
        $data['title'] = 'Count Task';
        $data['page_title'] = 'count_task';
        return view('performance.count_task',$data);
    }
    public function rating()
    {
        $data['title'] = 'Performnace Ratings';
        $data['page_title'] = 'Performance Ratings';
        return view('performance.rating', $data);
    }
    public function delay()
    {
        $data['title'] = 'Performance Delay';
        $data['page_title'] = 'Performance Delay';
        return view('performance.delay', $data);
    }
}
