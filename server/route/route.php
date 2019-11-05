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

Route::post('login/login', 'admin/Login/login');
Route::post('login/logout', 'admin/Login/logout');

//资源路由
Route::resource('menu','admin/menu')->middleware(['Auth', 'CheckRule']);
Route::resource('position','admin/position')->middleware(['Auth', 'CheckRule']);
Route::resource('department','admin/department')->middleware(['Auth', 'CheckRule']);
Route::resource('user','admin/adminUser')->middleware(['Auth', 'CheckRule']);
Route::resource('rule','admin/rule')->middleware(['Auth', 'CheckRule']);
Route::resource('category','admin/category')->middleware(['Auth', 'CheckRule']);
Route::resource('good', 'admin/goods')->middleware(['Auth', 'CheckRule']);
Route::resource('goodType', 'admin/goodsType')->middleware(['Auth', 'CheckRule']);
Route::resource('attr', 'admin/attribute')->middleware(['Auth', 'CheckRule']);

//Route::get('base/index', 'admin/base/index');
//Route::post('base/login', 'admin/base/login');
//Route::post('comm/logout', 'admin/comm/logout');

Route::post('files/index', 'admin/files/index')->middleware('Auth');

Route::post('user/enable', 'admin/adminUser/enable')->middleware(['Auth', 'CheckRule']);
Route::post('user/changePass', 'admin/adminUser/changePass')->middleware(['Auth', 'CheckRule']);
Route::post('user/setUserInfo', 'admin/adminUser/setUserInfo')->middleware(['Auth', 'CheckRule']);
Route::post('rule/enable', 'admin/rule/enable')->middleware(['Auth', 'CheckRule']);
Route::post('position/enable', 'admin/position/enable')->middleware(['Auth', 'CheckRule']);
Route::post('department/enable', 'admin/department/enable')->middleware(['Auth', 'CheckRule']);
Route::post('menu/enable', 'admin/menu/enable')->middleware(['Auth', 'CheckRule']);
Route::post('category/enable', 'admin/category/enable')->middleware(['Auth', 'CheckRule']);
Route::post('good/enable', 'admin/goods/enable')->middleware(['Auth', 'CheckRule']);

Route::get('goodType/list', 'admin/goodsType/goodsTypes')->middleware(['Auth', 'CheckRule']);
Route::get('attr/list', 'admin/attribute/attrList')->middleware(['Auth', 'CheckRule']);

//Route::miss('admin/base/index');

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
