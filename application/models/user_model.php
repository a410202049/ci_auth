<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 后台用户管理模型
 */
class User_model extends CI_Model{
	/**
	 * 查询后台用户数据
	 */
	public function getUser($username){
		$data = array();
		$data = $this->db->where(array('username'=>$username))->get('user')->row_array();
		return $data;
	}

	/**
	 * 根据uid查询用户
	 */
	public function getUid($uid){
		$data = $this->db->get_where('user', array('id'=>$uid))->row_array();
		return $data;
	}

	/**
	 * 修改密码
	 */
	public function change($uid, $data){
		$this->db->update('user', $data, array('uid'=>$uid));
	}

	
}