<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * 账号管理
 */
class Account extends Auth_Controller {
	public function __construct(){
		parent::__construct();
	}

	/**
	 * 账号列表
	 */
	public function accountManage(){
		$this->load->view('admin/Account/accountManage.html');
	}

	/**
	 * 添加账号
	 */
	public function createAccount(){
		$this->load->view('admin/Account/createAccount.html');
	}

	/**
	 * 根据i区域d获取门店
	 */
	public function getLinkAge(){
		if($this->input->is_ajax_request()){
			$arr = $this->input->post();
			$large = $this->db->get('large_area')->result_array();
			$array = array();
			$groupId = $arr['groupid'];
			$array['large'] = $large;
			switch ($groupId) {
				case '2':
					//城市经理
					
					break;
				
				default:

					break;
			}

			$this->response_data('success','获取成功',$array);
		}
	}

}
