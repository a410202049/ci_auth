<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Main extends Auth_Controller {
	public function __construct(){
		parent::__construct();
	}

	public function index(){
		$this->load->view('admin/Main/index.html');
	}

	public function changePassword(){
		$arr = $this->input->post();
		if($this->input->is_ajax_request()){
			  $data = $this->db->get_where('user', array('id'=>$this->uid))->row_array();
		      if($data['password']!= md5($arr['oldpassword'])){
		        $this->response_data('error','旧密码不正确');
		      }
		      $this->db->update('user', array('password'=>md5($arr['password'])), array('id'=>$this->uid));
		      $this->response_data('success','密码修改成功');
		}else{
			$this->load->view('admin/Main/changePassword.html');
		}
	}

	/**
	 * 修改头像
	 */
	public function changeAvatar(){
		$this->load->view('admin/Main/changeAvatar.html');
	}

	/**
	 * 头像上传
	 */
	public function shearPhoto(){
		 require($_SERVER['DOCUMENT_ROOT'].'/public/shearphoto_common/php/shearphoto.php');
		 $avatar = $result ? $result[0]['ImgName'] : '';
		 $this->db->update('user', array('avatar'=>$avatar), array('id'=>$this->uid));
		 exit;
	}

}
