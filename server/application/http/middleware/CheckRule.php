<?php

namespace app\http\middleware;

class CheckRule
{
    public function handle($request, \Closure $next)
    {
        $user = $request->param('user');
        //print_r($user);die;
        //判断是否有操作权限
        $module = $request->module();
        $controller = $request->controller();
        $action = $request->action();
        $rule = $module.'-'.$controller.'-'.$action;
        if (isset($user['id']) && $user['id']!=1) {
            if (!isset($user['rules']) || !in_array($rule, $user['rules'])) {
                exit(json_encode(['code'=>102, 'error'=>'您没有权限操作']));
            }
        }

        return $next($request);
    }
}
