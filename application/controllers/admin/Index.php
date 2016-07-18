<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Index extends Base_Controller {
	public function __construct(){
		parent::__construct();
	}

	public function index(){
		if($this->isLogin()){
			redirect(base_url('admin/Main'));
		}
		$this->load->view('admin/login.html');
	}

	/**
	 * 登陆
	 */
	public function do_login(){
		if(!isset($_SESSION)){
			session_start();
		}
		$code = $this->input->post('code');
		if(strtoupper($code) != $_SESSION['code']){
			$this->session->set_flashdata('error', "验证码错误");
		}
		$username = $this->input->post('username');
		$password = $this->input->post('password');
		$this->load->model('user_model', 'user');
		$userData = $this->user->getUser($username);
		if($userData['work_status'] =='0'){
			$this->session->set_flashdata('error', "您已经离职，不能继续使用该系统");
		}
		if(!$userData || $userData['password'] != md5($password)) $this->session->set_flashdata('error', "用户名或者密码不正确");

		$this->load->library('auth');
		$group = $this->auth->getGroups($userData['id']);
		if(!$group) $this->session->set_flashdata('error', "用户名或者密码不正确");//此处判断是否为系统管理员或业务员
		if($this->session->flashdata('error')){
			redirect(base_url('admin/Index'));
		}
		$this->session->set_userdata('aid',$userData['id']);
		$this->db->update('user', array('last_login_time'=>time(),'last_login_ip'=>$this->input->ip_address()), array('id'=>$userData['id']));
		redirect(base_url('admin/Main'));
	}


	/**
	 * 验证码
	 */
	public function code(){
		$config = array(
			'width'	=>	80,
			'height'=>	25,
			'codeLen'=>	4,
			'fontSize'=>16
			);
		$this->load->library('code', $config);
		$this->code->show();
	}

	/**
	 * 退出登陆
	 */
	public function logout(){
		$this->session->sess_destroy();
		$this->success('退出成功','/admin/index');
	}

	/**
	 * 上传图片
	 */
   public function do_upload()
    {	
    	$filepath = $this->input->get('filepath');
    	if(!empty($filepath)){
    		$config['upload_path']      = './public/uploads/'.$filepath;
            if(!file_exists($config['upload_path'])){
                mkdir($config['upload_path'],0777,true);//如果不存在就创建
            }
            $filepath = $filepath.'/';
    	}else{
        	$config['upload_path']      = './public/uploads/';
        	$filepath = '';
    	}
        $config['allowed_types']    = 'gif|jpg|png';
        $config['file_name']  = time(); //文件名不使用原始名
        // $config['max_size']     = 100;
        // $config['max_width']        = 1024;
        // $config['max_height']       = 768;
        $this->load->library('upload', $config);
        if ( ! $this->upload->do_upload('file'))
        {	
            $this->response_data('error', strip_tags($this->upload->display_errors()));
        }
        else
        {
            $data =$this->upload->data();
            $arr['file_name'] = $filepath.$data['file_name'];
            $this->response_data('success','上传成功',$arr);
        }
    }

}
