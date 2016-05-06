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
		$userData = $this->user->getUser($username,1);

		if(!$userData || $userData['password'] != md5($password)) $this->session->set_flashdata('error', "用户名或者密码不正确");
		if($this->session->flashdata('error')){
			redirect(base_url('admin/Index'));
		}
		$this->session->set_userdata('aid',$userData['id']);
		
		// $this->load->library('auth');
		// $this->load->library('Location','location');
  //       $group = $this->auth->getGroups($userData['id']);
  //       $userData['groupname'] = $group ? $group[0]['title'] :'没有用户组';
  //       $userData['address'] = $this->location->getlocation($userData['last_login_ip']);
		// $this->session->set_userdata('userinfo',$userData);

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
}
