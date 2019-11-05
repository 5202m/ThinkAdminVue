<?php

namespace app\http\middleware;

class Auth
{
    public function handle($request, \Closure $next)
    {
        //print_r($request);die;
        //先判断是否登录
        $token = $request->header('x-requested-token');
        //echo $token;die;
        $user = json_decode(cache($token), true);
        if (!$user || $user == 1) {
            exit(json_encode(['code'=>101, 'error'=>'请重新登录']));
        }
        //每次访问自动续命
        cache($token, json_encode($user), 3600);
        $request->user = $user;

        return $next($request);
    }
}
