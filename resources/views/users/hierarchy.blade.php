@extends('layouts.layout_admin')
@section('styles')
<style>
    .departments>li:first-child{
        border-bottom: none;
    }
    .department{
        width: 14.25%;
    }
    .sitemap-horizontal ul a{
        flex-direction: column;
    }
    .department ul li a{
        height: auto;
    }
    .department ul li{
        margin-bottom: 60px;
    }
    .departments::after{
        top: 30px;
    }
    .administration .subdirector::after{
        height: 30px;
    }
    .departments>li:first-child{
        padding: 0;
        height: 0;
        margin:0 auto 54px auto;
    }
    .text-muted{
        font-weight: normal;
        font-size: .9em;
    }
    .sitemap-horizontal ul a span{
        text-align: center;
    }
</style>
@endsection
@section('content')
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <div class="sitemap-content">
                    @php
                        $groupedUsers = $users->groupBy(function($user) {
                            return optional($user->userMaps->first())->department->department_eng ?? 'Unknown Deptartment';
                        })->sortKeys();
                        if ($groupedUsers->has('Unknown Deptartment')) {
                            $unknownLevelUsers = $groupedUsers->pull('Unknown Deptartment');
                            $groupedUsers->put('Unknown Deptartment', $unknownLevelUsers);
                        }
                    @endphp
                    <figure class="sitemap-horizontal">
                        <ul class="administration">
                            <li>
                                <ul class="director">
                                    <li>
                                        <a href="javascript:void(0);" class="fw-semibold"><span>Application User Hierarchy</span></a>
                                        <ul class="subdirector"></ul>
                                        <ul class="departments">
                                            <li></li>
                                            @foreach ($groupedUsers as $dept => $usersIndept)
                                            <li class="department">
                                                <a href="javascript:void(0);" class="fw-semibold"><span>{{$dept}}</span></a>
                                                <ul>
                                                @foreach ($usersIndept as $user)
                                                    <li><a href="javascript:void(0);"><strong>{{$user->userMaps->first()->level->level}}</strong> <span>{{ $user->full_name }}</span>
                                                        @if ($user->userMaps->where('is_active', 1)->count() > 0)
                                                        <dd>
                                                            @foreach ($user->userMaps as $map)
                                                                <dt class="text-muted">{{ optional($map->designation)->designation ?? 'No Designation' }}</dt>
                                                            @endforeach
                                                        </dd>
                                                        @endif
                                                        </a>
                                                    </li>
                                                @endforeach
                                                </ul>
                                            </li>
                                            @endforeach
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </figure>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('scripts')
@endsection
