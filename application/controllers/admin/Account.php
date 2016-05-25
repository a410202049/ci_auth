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
	 * 添加账号第一步
	 */
	public function createAccountStep(){
		if($this->input->is_ajax_request()){
			$arr = $this->input->post();
			if(!isset($arr['imagesList'])){
				$this->response_data('error','请上传照片');
			}
			if(!isset($arr['groupid'])){
				$this->response_data('error','参数不正确');
			}
			$groupid = intval($arr['groupid']);
			$type = "";
			$tyepId = "";
			$relationArr = array();
			switch ($groupid) {
				case 1://大区经理
					if(!isset($arr['large'])){
						$this->response_data('error','请选择大区');
					}
					$type = 'large';
					$tyepId = $arr['large'];
					break;
				case 2://城市经理
					if(!isset($arr['city'])){
						$this->response_data('error','请选择城市');
					}
					$type = 'city';
					$tyepId = $arr['city'];
					break;
				case 3://区域经理
					if(!isset($arr['area'])){
						$this->response_data('error','请选择区域');
					}
					$type = 'area';
					$tyepId = $arr['area'];
					break;
				case 4://店秘
				case 5://店经理
					if(!isset($arr['store'])){
						$this->response_data('error','请选择门店');
					}
					$type = 'store';
					$tyepId = $arr['store'];
					break;
				case 6://销售顾问
					$type = 'manager';
					break;
			}

			if($this->db->get_where('user', array('username'=>$arr['phone']))->row_array()){
				$this->response_data('error','该手机号已经被注册');
			}

			$relationArr['type'] = $type;
			$relationArr['leve'] = $groupid;
			$relationArr['tyepid'] = $tyepId;

            $data['username'] = $arr['phone'];
            $data['password'] = md5(substr($arr['idcard'], -6));
            $data['last_login_time'] = time();      //创建时间
            $data['last_login_ip'] = '0.0.0.0';
            $data['idcard'] = $arr['idcard'];
            $data['avatar'] = $arr['imagesList'];
            $data['phone'] = $arr['phone'];
            $data['nickname'] = $arr['nickname'];

            $this->db->trans_begin();//事务开始
            $this->db->insert('user', $data);
            $uid = $this->db->insert_id();
            $relationArr['uid'] = $uid;
            $this->db->insert('userleverelation', $relationArr);
            $group = $this->db->get_where('auth_group', array('leve'=>$relationArr['leve']))->row_array();//根据级别查询组
            $group_id = $group['id'];//得到权限组ID，注上面变量的 $groupid 为级别id
            $result['uid'] = $uid;
            $result['group_id'] = $group_id; //用户组ID
            $this->db->insert('auth_group_access', $result);
            if ($this->db->trans_status() === FALSE)
			{
			    $this->db->trans_rollback();
			    $this->response_data('error','账号添加失败');
			}
			else
			{
			    $this->db->trans_commit();
			    $this->response_data('success','账号添加成功');
			}

			//此处需要判断每个角色只能存在一个 除销售人员外


		}else{
			$arr = $this->input->get();
			$data['data'] = json_encode($arr);
			$this->load->view('admin/Account/createAccountStep.html',$data);
		}
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
		            $array['provinceDefault'] = array_key_exists('provinceDefault',$arr) ? $arr['provinceDefault'] : $provinces[0]['provinceid'];
		            $citys = $this->db->get_where('cities', array('provinceid'=>$array['provinceDefault']))->result_array();
		            $array['citys'] = $citys;
		            $array['cityDefault'] = array_key_exists('cityDefault',$arr) ? $arr['cityDefault'] : $citys[0]['cityid'];
		            //这里如果没有传入大区，省份，城市。
					break;
				case '3':
					//区域经理
		            $provinces = $this->db->get_where('provinces', array('largeid'=>$array['largeDefult']))->result_array();
		            $array['provinces'] = $provinces;
		            $array['provinceDefault'] = array_key_exists('provinceDefault',$arr) ? $arr['provinceDefault'] : $provinces[0]['provinceid'];
		            $citys = $this->db->get_where('cities', array('provinceid'=>$array['provinceDefault']))->result_array();
		            $array['citys'] = $citys;
		            $array['cityDefault'] = array_key_exists('cityDefault',$arr) ? $arr['cityDefault'] : $citys[0]['cityid'];
		            $areas = $this->db->get_where('custom_area', array('cityid'=>$array['cityDefault']))->result_array();
		            $array['areas'] = $areas;
		            $areaDefult = $areas ? $areas[0]['id'] : '';
		            $array['areaDefult'] = array_key_exists('areaDefult',$arr) ? $arr['areaDefult'] : $areaDefult;
		            break;
		        case '4':
		        case '5':
					//店秘和店经理
		            $provinces = $this->db->get_where('provinces', array('largeid'=>$array['largeDefult']))->result_array();
		            $array['provinces'] = $provinces;
		            $array['provinceDefault'] = array_key_exists('provinceDefault',$arr) ? $arr['provinceDefault'] : $provinces[0]['provinceid'];
		            $citys = $this->db->get_where('cities', array('provinceid'=>$array['provinceDefault']))->result_array();
		            $array['citys'] = $citys;
		            $array['cityDefault'] = array_key_exists('cityDefault',$arr) ? $arr['cityDefault'] : $citys[0]['cityid'];
		            $areas = $this->db->get_where('custom_area', array('cityid'=>$array['cityDefault']))->result_array();
		            $array['areas'] = $areas;
		            $areaDefult = $areas ? $areas[0]['id'] : '';
		            $array['areaDefult'] = array_key_exists('areaDefult',$arr) ? $arr['areaDefult'] : $areaDefult;
		            $stores = $this->db->get_where('store', array('custom_area_id'=>$array['areaDefult']))->result_array();
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
