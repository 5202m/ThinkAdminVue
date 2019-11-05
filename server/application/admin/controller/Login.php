<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Login extends Controller
{
    protected $param = [];

    public function initialize()
    {
        parent::initialize();
        $this->param = $this->request->param();
    }

    public function login()
    {
        $username = $this->param['username'];
        $password = $this->param['password'];
        $user = new \app\admin\model\AdminUser();
        $menu = new \app\admin\model\Menu();
        $data = [
            'username' => $username,
            'password' => md5($password.$username)
        ];
        $ret  = $user->getUserLogin($data);
        if ($ret) {

            //记录登录日志  ---begin
            $ip = $this->request->ip();
            $url='http://freeapi.ipip.net/'.$ip;
            $result = json_decode(curl_get($url), true);
            if ($result) {
                $res = [
                    'ip'        => $ip,
                    'country'   => $result[0],
                    'region'    => $result[1],
                    'city'      => $result[2],
                    'isp'       => $result[4],
                    'create_at' =>time(),
                ];
                $accessLogs = new \app\admin\model\AccessLogs();
                $accessLogs->saveLogs($res);
            }
            // ---end

            unset($ret['password']);
            $token = md5(microtime());

            if ($ret['id'] == 1) {
                $m = getLoginTree($menu->getMenus(['status'=>1]));
            } else {
                $rule = new \app\admin\model\Rule();
                $r = $rule->getRuleById($ret['r_id']);
                if ($r) {
                    $ids = explode(',', $r['rs']);
                    $ret['rules'] = getRules($menu->getMenuByIds($ids));
                    $m = getLoginTree($menu->getMenuByIds($ids));
                } else {
                    $m = [];
                }
            }
            cache($token, json_encode($ret), 3600);
            $data = [
                'token' => $token,
                'user'  => $ret,
                'menus' => $m
            ];
            $d['last_login_at'] = time();
            $ret = $user->updateUser($ret['id'], $d, false);
            return msg(200, $data);
        } else {
            return msg(100, null, $user->getError());
        }
    }

    public function logout()
    {
        $token = $this->request->header('x-requested-token');
        if ($token) {
            $user = json_decode(cache($token), true);
            cache($token, null);
            $d['last_logout_at'] = time();
            $adminUser = new \app\admin\model\AdminUser();
            $ret = $adminUser->updateUser($user['id'], $d, false);
            return msg(200, null, '操作成功');
        } else {
            return msg(100, null, '操作失败');
        }
    }
}
