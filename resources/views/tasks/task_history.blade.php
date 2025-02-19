@extends('layouts.layout_admin')

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card mt-n4 mx-n4">
                <div class="bg-warning-subtle">
                    <div class="card-body pb-0 px-4">
                        <div class="row mb-3">
                            <div class="col-md">
                                <div class="row align-items-center g-3">
                                    @if(empty(@$task_details))
                                        <h5>No History Available</h5>
                                    @else
                                        <div class="col-md">
                                        @php
                                            $sts = "Inprogress";
                                            $color = "primary";
                                            if (@$task_details[0]->status == "P") {
                                                $sts = "Pending";
                                                $color = "secondary";
                                            } elseif (@$task_details[0]->status == "C") {
                                                $sts = "Completed";
                                                $color = "success";
                                            }
                                        @endphp
                                        <div>
                                            <h4 class="fw-bold">{{ @$task_details[0]->title }}</h4>
                                            <div class="hstack gap-3 flex-wrap">
                                                <div>
                                                    <i class="ri-building-line align-bottom me-1"></i>Departments:<br>
                                                    @foreach (explode(',', @$task_details[0]->department_eng) as $val)
                                                        {{ $loop->index + 1 }}. {{ $val }}<br>
                                                    @endforeach
                                                </div>
                                                <div class="vr"></div>
                                                <div><i class="ri-calendar-todo-line align-bottom me-1"></i> Task Entry
                                                    Date: <span
                                                        class="fw-medium">{{ date('d M, Y', strtotime(@$task_details[0]->entry_date)) }}</span>
                                                </div>
                                                <div class="vr"></div>
                                                <div><i class="ri-calendar-todo-line align-bottom me-1"></i> Task Due
                                                    Date: <span
                                                        class="fw-medium">{{ date('d M, Y', strtotime(@$task_details[0]->due_date)) }}</span>
                                                </div>
                                                <div class="vr"></div>
                                                <div title="Current Status"
                                                     class="badge rounded-pill bg-{{ $color }} fs-12">{{ $sts }}</div>
                                                <div title="Priority"
                                                     class="badge rounded-pill bg-{{ @$task_details[0]->fk_task_priority_id == 1 ? 'success' : 'danger' }} fs-12">{{ @$task_history[0]->priority }}</div>
                                            </div>
                                        </div>
                                    </div>
                                    @endif
                                </div>
                            </div>
                           {{-- <div class="col-md-auto">
                                <div class="hstack gap-1 flex-wrap">
                                    <button type="button" id="close"
                                            title="At least one comment/reply before close the task"
                                            class="btn btn-sm btn-primary">Close
                                    </button>
                                    <a href="{{ route('task-history', ['task_id' => urlencode(base64_encode(@$task_history[0]->task_id))]) }}">
                                        <button type="button" id="history" class="btn btn-sm btn-warning">History
                                        </button>
                                    </a>
                                </div>
                            </div>--}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- Historical Data Section --}}
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Task History Timeline</h4>
                </div>
                <div class="card-body">
                    @php
                        $groupedHistory = collect($task_history)->groupBy(function ($item) {
                            return date('d M, Y', strtotime($item->log_creation));
                        });
                    @endphp
                    @if(empty($groupedHistory))
                        <h6>No History Available</h6>
                    @else
                    @foreach ($groupedHistory as $date => $records)
                        <ul class="list-group mb-4">
                            @foreach ($records as $record)
                                <h5 class="fw-bold mb-3">{{ $record->log_creation }}</h5>
                                <li class="list-group-item">
                                    <h6 class="mb-2">Title: {{ $record->title }}</h6>
                                    <p class="mb-1">Description: {{ $record->description }}</p>
                                    <p class="mb-1">Priority: {{ $record->priority }}</p>
                                    <p class="mb-1">Category: {{ $record->category }}</p>
                                    <p class="mb-1">Entry Date: {{ $record->entry_date }}</p>
                                    <p class="mb-1">Due Date: {{ $record->due_date }}</p>
                                    <p class="mb-1">Department: {{ $record->department_eng }}</p>
                                    @if(!empty($record->name_en))
                                    <p class="mb-1">Section: {{ $record->name_en }}</p>
                                    @endif

                                    <div class="d-flex justify-content-between">
                                        <span>

                                            File:   @if (!empty($record->file) && !empty($record->file_id))
                                                <span> <a
                                                        href="{{ asset('uploads/'.$record->file) }}" target="_blank"
                                                        class="btn btn-primary btn-sm">
                                                View File
                                            </a></span>
                                            @else
                                                <span class="badge bg-warning">No file available.</span>
                                            @endif
                                        </span>
                                        <span>Status: <span
                                                class="badge bg-{{ $record->status == 'C' ? 'success' : ($record->status == 'P' ? 'secondary' : 'primary') }}">{{ $record->status == 'C' ? 'Completed' : ($record->status == 'P' ? 'Pending' : 'In Progress') }}</span></span>
                                        <span>Priority: <span
                                                class="badge bg-{{ $record->fk_task_priority_id == 1 ? 'success' : 'danger' }}">{{ $record->priority }}</span></span>
                                    </div>
                                </li>
                            @endforeach
                        </ul>
                    @endforeach
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection
