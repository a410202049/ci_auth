<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Base_Controller extends CI_Controller {


    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @name 错误跳转公共方法
     * @param string $message 错误提示信息
     * @param number $time 跳转时间
     * @param string $url 跳转的URL
     */
    public function error($message,$url = FALSE,$time = 3)
    {
        if( !$url ) {
            $data['url'] = 'javascript:history.back(-1);';
        } else {
            $data['url'] = $url;
        }
        $data['message'] = $message;
        $data['time'] = $time;
        die($this->load->view('public/error',$data,true));
    }

    /**
     * @name 成功跳转公共方法
     * @param string $message 成功提示信息
     * @param number $time 跳转时间
     * @param string $url 跳转的URL
     */
    public function success($message,$url = FALSE,$time = 3)
    {
        if( !$url ) {
            $data['url'] = 'javascript:history.back(-1);';
        } else {
            $data['url'] = $url;
        }
        $data['message'] = $message;
        $data['time'] = $time;
        die($this->load->view('public/success',$data,true));
    }

    /**
     * 判断管理员是否登录
     */
    public function isLogin()
    {
        return $this->session->userdata('aid');
    }

    /**
     * ajax返回
     */
    function response_data($status,$message = "",$data = array()){
        $this->output->set_header('Content-Type: application/json; charset=utf-8');
        $array= array(
            'status' =>$status,
            'message' => $message,
            'data' =>$data
        );
        echo json_encode($array);
        exit;
    }

}

class Auth_Controller extends Base_Controller{
    public $uid;
    public $groupid;
    public $pidArr;
    public function __construct()
    {
        parent::__construct();
        if(!$this->isLogin()){
            redirect('Admin/Index');
        }
        $this->load->library('auth');
        $this->uid = $this->isLogin();
        $this->groupid = $this->auth->getGroups($this->uid)[0]['group_id'];

        if(!$this->auth->check($this->router->fetch_class().'/'.$this->router->fetch_method(),$this->uid) && $this->uid !=1 && $this->groupid !=1){
            if($this->input->is_ajax_request()){
                $this->response_data('error','没有权限');
            }else{
                $this->error('没有权限','/admin/index');
            }
        }

        if(!$this->input->is_ajax_request()){
            $prefix = $this->db->dbprefix;
            $table = $prefix.'auth_rule';
            $field = 'id,name,title,icon';
            $where['pid'] = 0;    //顶级ID
            $where['isshow'] = 1; //显示状态
            $data = $this->db->select($field)->from($table)->where($where)->order_by('sort', 'asc')->get()->result_array();
            //没有权限的菜单不显示
            foreach ($data as $k=>$v){
                if(!$this->auth->check($v['name'], $this->uid) &&  $this->uid != 1 && $this->groupid !=1){
                    unset($data[$k]);
                }else{
                    $data[$k]['sub'] = $this->db->select($field)->from($table)->where(array('pid'=>$v['id'],'isshow'=>1))->order_by('sort', 'asc')->get()->result_array();
                    foreach ($data[$k]['sub'] as $k2 => $v2){
                        if(!$this->auth->check($v2['name'], $this->uid) && $this->uid != 1 && $this->groupid !=1){
                            unset($data[$k]['sub'][$k2]);
                        }
                    }
                }
            }

            $name = $this->router->fetch_class().'/'.$this->router->fetch_method();
            $ret = $this->db->from($table)->where(array('name'=>$name))->get()->row_array();
            $arr = $this->getCid($ret['id']);
            $cid = $arr[0]?$arr[0]:$ret['id'];
            $tid = isset($arr[1])?$arr[1]:$ret['id'];
            $arr['cid'] = $cid;
            $arr['tid'] = $tid;

            $this->load->model('user_model', 'user');
            $userData = $this->user->getUid($this->uid);
            $this->load->library('Location','location');
            $group = $this->auth->getGroups($this->uid);
            $userData['groupname'] = $group ? $group[0]['title'] :'没有用户组';
            $userData['address'] = $this->location->getlocation($userData['last_login_ip']);

            $arr['userinfo'] = $userData;
            $arr['dataMenu'] = $data;
            $this->load->view('admin/Common/header.html',$arr);
        }

    }

    /**
     * 1顶级，2二级以此类推
     */
    public function getCid($cid = 0){
        $i = 0;
        $rules = $this->db->get_where('auth_rule')->result_array();
        $arr = array();
        foreach ($rules as $key => $value) {
            $arr[$value['id']] = $value['pid'];
        }
        foreach ($arr as $k => $v) {
            if($cid == $k){
                if($v != 0){
                    $this->getCid($v);
                    $this->pidArr[] = $v;
                }
            }
        }
        return $this->pidArr;
    }



}


