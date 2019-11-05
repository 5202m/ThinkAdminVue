<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/11/4
 * Time: 16:06
 */

namespace app\admin\behavior;


class CORS
{
    public function appInit($params)
    {
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Credentials: true');
        header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, sessionId, X-Requested-Token");
        if(request()->isOptions()){
            exit();
        }
    }
}