@extends('admin.shared.master')
@include('admin.shared.header')
@include('admin.shared.sidebar')
@section('content')
<section id="main-content">
    <section class="wrapper site-min-height">
        <!-- page start-->
        <section class="panel">
            <header class="panel-heading">
                List User
            </header>
            <div class="panel-body">
                <div class="adv-table editable-table ">
                    <div class="clearfix" style="margin-bottom: 10px;">
                        <div class="btn-group">
                            <button id="editable-sample_new" class="btn green">
                                <a href="{{ route('addAmin') }}">Add New <i class="fa fa-plus"></i></a>
                            </button>
                        </div>
                    </div>
                    <div class="space15"></div>
                    <table class="table table-striped table-hover table-bordered" id="editable-sample">
                        <thead>
                        <tr>
                            <th>Username</th>
                            <th>Full Name</th>
                            <th>Password</th>
                            <th>Role</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($list_admin as $item)
                        <tr class="">
                            <td>{{ $item['user_name'] }}</td>
                            <td>{{ $item['full_name'] }}</td>
                            <td>**********</td>
                            <td class="center">
                                <select class="role-admin" name="role-admin" style="width: 100%;" data-id="{{ $item['admin_id'] }}">
                                    <option value="manager" {{ ($item['role_admin'] == 'manager') ? 'selected' : '' }}>Manager</option>
                                    <option value="editer" {{ ($item['role_admin'] == 'editer') ? 'selected' : '' }}>Editer</option>
                                </select>
                            </td>
                            <td><a class="delete" href="{{ route('getDeleteAdmin', $item['admin_id']) }}">Delete</a></td>
                        </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="col-md-12" style="text-align: center;">
                    {{ $list_admin->links() }}
                </div>       
            </div>
        </section>
        <!-- page end-->
    </section>
</section>
<footer class="site-footer">
    <div class="text-center">
        2013 &copy; FlatLab by VectorLab.
        <a href="#" class="go-top">
            <i class="fa fa-angle-up"></i>
        </a>
    </div>
</footer>
@endsection