<?php

namespace app\admin\controller;

use think\App;

class Files extends Comm
{
    public function initialize()
    {
        parent::initialize();
        $this->model = new \app\admin\model\Files();
    }

    public function index()
    {
        $path = sprintf('uploads/%s/', date('Ymd'));
        $file = request()->file('file');
        $type = isset($this->param['type']) ? $this->param['type'] : 'avatar';
        if (!$file) {
            return msg(100, null, '请选择上传文件');
        }
        $rule = [
          'size'=> 2*1024*1024,
        ];
        $f = $this->model->getFileByHash($file->hash());
        if ($f) {
            return msg(100, $f, '您上传的文件已存在');
        }
        $arr = pathinfo($file->getInfo('name'));
        $data = [
          'u_id' => $this->user['id'],
          'ext'  => $arr['extension'],
          'hash' => $file->hash(),
          'path' => $path,
          'create_at' => time(),
          'type' => $type
        ];
        $info = $file->validate($rule)->move($this->app->getRootPath() . DIRECTORY_SEPARATOR . 'public/uploads');
        if (strstr($info->getSaveName(), DIRECTORY_SEPARATOR)) {
            $array = explode(DIRECTORY_SEPARATOR, $info->getSaveName());
            $data['name'] = $array[count($array) - 1];
        } else {
            $data['name'] = $info->getSaveName();
        }
        $res = $this->model->saveFile($data);
        if (!$res) {
            return msg(100, null, $this->model->getError());
        }
        return msg(200, $data, '上传成功');
    }
}
