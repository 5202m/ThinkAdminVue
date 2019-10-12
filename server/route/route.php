<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

Route::get('think', function () {
    return 'hello,ThinkPHP5!';
});

Route::get('hello/:name', 'index/hello');

//资源路由
Route::resource('menu','admin/menu');
Route::resource('position','admin/position');
Route::resource('department','admin/department');
Route::resource('user','admin/adminUser');
Route::resource('rule','admin/rule');
Route::resource('category','admin/category');
Route::resource('good', 'admin/goods');
Route::resource('goodType', 'admin/goodsType');
Route::resource('attr', 'admin/attribute');

Route::get('base/index', 'admin/base/index');
Route::post('base/login', 'admin/base/login');
Route::post('comm/logout', 'admin/comm/logout');

Route::post('files/index', 'admin/files/index');

Route::post('user/enable', 'admin/adminUser/enable');
Route::post('user/changePass', 'admin/adminUser/changePass');
Route::post('user/setUserInfo', 'admin/adminUser/setUserInfo');
Route::post('rule/enable', 'admin/rule/enable');
Route::post('position/enable', 'admin/position/enable');
Route::post('department/enable', 'admin/department/enable');
Route::post('menu/enable', 'admin/menu/enable');
Route::post('category/enable', 'admin/category/enable');

Route::get('goodType/list', 'admin/goodsType/goodsTypes');
Route::get('attr/list', 'admin/attribute/attrList');

Route::miss('admin/base/index');

return [
    // 定义资源路由
    /*'__rest__'=>[
        // menu
        'menu'      =>  'admin/menu',
        'position'  =>  'admin/position',
        'department'=>  'admin/department',
        'user'      =>  'admin/adminUser',
        'rule'      =>  'admin/rule',
        'category'  =>  'admin/category',
    ],
    '[base]'      => [
        'index'   => ['admin/base/index', ['method' => 'get']],
        'login'   => ['admin/base/login', ['method' => 'post']],
    ],
    '[comm]'      => [
        'logout'  => ['admin/comm/logout', ['method' => 'post']],
    ],
    '[files]'     => [
        'index'   => ['admin/files/index', ['method' => 'post']],
    ],
    'user/enable'       => ['admin/adminUser/enable', ['method' => 'post']],
    'user/changePass'   => ['admin/adminUser/changePass', ['method' => 'post']],
    'user/setUserInfo'  => ['admin/adminUser/setUserInfo', ['method' => 'post']],
    'rule/enable'       => ['admin/rule/enable', ['method' => 'post']],
    'position/enable'   => ['admin/position/enable', ['method' => 'post']],
    'department/enable' => ['admin/department/enable', ['method' => 'post']],
    'menu/enable'       => ['admin/menu/enable', ['method' => 'post']],
    'category/enable'       => ['admin/category/enable', ['method' => 'post']],*/
    // MISS路由
    //'__miss__'    => 'admin/base/index',
];
