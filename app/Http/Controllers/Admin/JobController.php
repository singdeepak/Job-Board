<?php

namespace App\Http\Controllers\Admin;

use App\Models\Job;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\JobValidationRequest;

class JobController extends Controller
{
    public function dashboard()
    {
        $totalJobs = \App\Models\Job::count();
        $latestJobs = \App\Models\Job::latest()->take(5)->get();
        return view('dashboard', compact('totalJobs', 'latestJobs'));
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $allJobs = Job::latest()->get();
        return view('admin.job.index', compact('allJobs'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.job.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(JobValidationRequest $request)
    {
        $newJob = $request->validated();

        if ($request->hasFile('logo')) {
            $data['logo'] = $request->file('logo')->store('logos', 'public');
        }

        Job::create($newJob);
        return redirect()->route('job.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $singleJob = Job::findOrFail($id);
        return view('admin.job.show', compact('singleJob'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $singleJob = Job::findOrFail($id);
        return view('admin.job.edit', compact('singleJob'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(JobValidationRequest $request, string $id)
    {
        $singleJob = Job::findOrFail($id);
        $updateJob = $request->validated();

        if ($request->hasFile('logo')) {
            if ($singleJob->logo && Storage::disk('public')->exists($singleJob->logo)) {
                Storage::disk('public')->delete($singleJob->logo);
            }

            $updateJob['logo'] = $request->file('logo')->store('logos', 'public');
        }

        $singleJob->update($updateJob);

        return redirect()->route('job.index')->with('success', 'Job updated successfully!');
    }



    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $singleJob = Job::findOrFail($id);
        $singleJob->destroy($id);
        return redirect()->back();
    }
}
