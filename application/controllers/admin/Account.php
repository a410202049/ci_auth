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
			$array['largeDefult'] = array_key_exists('largeDefult',$arr) ? $arr['largeDefult'] : $large[0]['id'];
			switch ($groupId) {
				case '2':
					//城市经理
		            $provinces = $this->db->get_where('provinces', array('largeid'=>$array['largeDefult']))->result_array();
		            $array['provinces'] = $provinces;
		            $array['provinceDefault'] = array_key_exists('provincesDefault',$arr) ? $arr['provincesDefault'] : $provinces[0]['provinceid'];
		            $citys = $this->db->get_where('cities', array('provinceid'=>$array['provinceDefault']))->result_array();
		            $array['citys'] = $citys;
		            $array['cityDefault'] = array_key_exists('cityDefault',$arr) ? $arr['cityDefault'] : $citys[0]['cityid'];
		            //这里如果没有传入大区，省份，城市。
					break;
				case '3':
					//区域经理
		            $provinces = $this->db->get_where('provinces', array('largeid'=>$array['largeDefult']))->result_array();
		            $array['provinces'] = $provinces;
		            $array['provinceDefault'] = array_key_exists('provincesDefault',$arr) ? $arr['provincesDefault'] : $provinces[0]['provinceid'];
		            $citys = $this->db->get_where('cities', array('provinceid'=>$array['provinceDefault']))->result_array();
		            $array['citys'] = $citys;
		            $array['cityDefault'] = array_key_exists('cityDefault',$arr) ? $arr['cityDefault'] : $citys[0]['cityid'];
		            $areas = $this->db->get_where('custom_area', array('cityid'=>$array['cityDefault']))->result_array();
		            $array['areas'] = $areas;
		            $areaDefult = $areas ? $areas[0]['id'] : '';
		            $array['areasDefault'] = array_key_exists('areasDefault',$arr) ? $arr['areasDefault'] : $areaDefult;
		            break;
		        case '4':
		        case '5':
					//店秘和店经理
		            $provinces = $this->db->get_where('provinces', array('largeid'=>$array['largeDefult']))->result_array();
		            $array['provinces'] = $provinces;
		            $array['provinceDefault'] = array_key_exists('provincesDefault',$arr) ? $arr['provincesDefault'] : $provinces[0]['provinceid'];
		            $citys = $this->db->get_where('cities', array('provinceid'=>$array['provinceDefault']))->result_array();
		            $array['citys'] = $citys;
		            $array['cityDefault'] = array_key_exists('cityDefault',$arr) ? $arr['cityDefault'] : $citys[0]['cityid'];
		            $areas = $this->db->get_where('custom_area', array('cityid'=>$array['cityDefault']))->result_array();
		            $array['areas'] = $areas;
		            $areaDefult = $areas ? $areas[0]['id'] : '';
		            $array['areasDefault'] = array_key_exists('areasDefault',$arr) ? $arr['areasDefault'] : $areaDefult;
		            $stores = $this->db->get_where('store', array('custom_area_id'=>$array['areasDefault']))->result_array();
		            $array['stores'] = $stores;
		            $storeDefult = $stores ? $stores[0]['id'] : '';
					$array['storeDefult'] = array_key_exists('storeDefult',$arr) ? $arr['storeDefult'] : $storeDefult;
					break;
				default:

					break;
			}

			$this->response_data('success','获取成功',$array);
		}
	}

}
