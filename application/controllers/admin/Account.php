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
		$page_config['perpage']=5;   //每页条数
		$page_config['part']=2;//当前页前后链接数量
		$page_config['url']='admin/Account/accountManage';//url
		$page_config['seg']=4;//参数取 index.php之后的段数，默认为3，即index.php/control/function/18 这种形式
		$page_config['nowindex']=$this->uri->segment($page_config['seg']) ? $this->uri->segment($page_config['seg']):1;//当前页
		$this->load->library('mypage_class');
		$count = $this->db->select('u.id,u.username,group.title,u.last_login_ip,u.status,u.last_login_time,u.mark,u.work_status')->from('user as u')->join('auth_group_access as access', 'u.id = access.uid')->join('auth_group as group','group.id = access.group_id')->where(array('group.role'=>'2'))->count_all_results();
		$page_config['total']= $count;
		$this->mypage_class->initialize($page_config);

		$data = $this->db->select('u.id,u.username,u.nickname,group.title,u.last_login_ip,u.status,u.last_login_time,u.mark,u.work_status')->from('user as u')->join('auth_group_access as access', 'u.id = access.uid')->join('auth_group as group','group.id = access.group_id')->where(array('group.role'=>'2'))->limit($page_config['perpage'],$page_config['perpage'] * ($page_config['nowindex'] - 1))->order_by('id','desc')->get()->result_array();
		
		foreach ($data as $key => $value) {
			$data[$key]['work_status'] = $value['work_status'] =='1' ? "在职" : "离职";
			$data[$key]['last_login_time'] = date('Y-m-d H:i:s',$value['last_login_time']);
		}
		$arr['data'] = $data;
		$this->load->view('admin/Account/accountManage.html',$arr);
	}

	/**
	 * 添加账号
	 */
	public function createAccount(){
		$this->load->view('admin/Account/createAccount.html');
	}

	/**
	 * 编辑账号
	 */
	public function editAccount(){
		$id = $this->uri->segment(4);
		$data = $this->db->get_where('userleverelation', array('uid'=>$id))->row_array();
		$arr = array();
		switch ($data['leve']) {
			case '1':
				$arr['largeDefult'] = $data['typeid'];
				$arr['managerDefult'] = '';
				$arr['storeDefult'] = '';
				$arr['cityDefault'] = '';
				$arr['provinceDefault'] = '';
				$arr['areaDefult'] = '';
				break;
			case '2':
				$arr['managerDefult'] = '';
				$arr['storeDefult'] = '';
				$arr['areaDefult'] = '';
				$city = $this->db->get_where('cities', array('cityid'=>$data['typeid']))->row_array();
				$provinces = $this->db->get_where('provinces', array('provinceid'=>$city['provinceid']))->row_array();
				$arr['cityDefault'] = $data['typeid'];
				$arr['provinceDefault'] = $city['provinceid'];
				$arr['largeDefult'] = $provinces['largeid'];
				break;
			case '3':
				//区域经理
				$arr['managerDefult'] = '';
				$arr['storeDefult'] = '';
				$arr['areaDefult'] = $data['typeid'];
				$custonArea = $this->db->get_where('custom_area', array('id'=>$arr['areaDefult']))->row_array();
				$arr['cityDefault'] = $custonArea['cityid'];
				$arr['provinceDefault'] = $custonArea['provinceid'];
				$arr['largeDefult'] = $custonArea['largeid'];
				break;
			case '4':
			case '5':
				//店经理
				$arr['storeDefult'] = $data['typeid'];
				$areaData = $this->db->get_where('store', array('id'=>$arr['storeDefult']))->row_array();
				$arr['areaDefult'] = $areaData['custom_area_id'];
				$custonArea = $this->db->get_where('custom_area', array('id'=>$arr['areaDefult']))->row_array();
				$arr['cityDefault'] = $custonArea['cityid'];
				$arr['provinceDefault'] = $custonArea['provinceid'];
				$arr['largeDefult'] = $custonArea['largeid'];
				$arr['managerDefult'] = '';
				break;
			case '6':
				//销售顾问
				$arr['managerDefult'] = $data['typeid'];
				$storeData = $this->db->get_where('userleverelation', array('uid'=>$data['typeid'],'leve'=>'5'))->row_array();
				$arr['storeDefult'] = $storeData['typeid'];
				$areaData = $this->db->get_where('store', array('id'=>$arr['storeDefult']))->row_array();
				$arr['areaDefult'] = $areaData['custom_area_id'];
				$custonArea = $this->db->get_where('custom_area', array('id'=>$arr['areaDefult']))->row_array();
				$arr['cityDefault'] = $custonArea['cityid'];
				$arr['provinceDefault'] = $custonArea['provinceid'];
				$arr['largeDefult'] = $custonArea['largeid'];
				break;
		}
		$arr['leve'] = $data['leve'];
		$arr['uid'] = $id;
		$this->load->view('admin/Account/editAccount.html',$arr);
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
			$typeid = "";
			$relationArr = array();
			switch ($groupid) {
				case 1://大区经理
					if(!isset($arr['large'])){
						$this->response_data('error','请选择大区');
					}
					$type = 'large';
					$typeid = $arr['large'];
					$largeData = $this->db->get_where('userleverelation', array('type'=>'large','typeid'=>$typeid))->row_array();
					if($largeData){
						$this->response_data('error','该大区经理角色已经存在');
					}
					break;
				case 2://城市经理
					if(!isset($arr['city'])){
						$this->response_data('error','请选择城市');
					}
					$type = 'city';
					$typeid = $arr['city'];
					$cityData = $this->db->get_where('userleverelation', array('type'=>'city','typeid'=>$typeid))->row_array();
					if($cityData){
						$this->response_data('error','该城市经理角色已经存在');
					}
					break;
				case 3://区域经理
					if(!isset($arr['area'])){
						$this->response_data('error','请选择区域');
					}
					$type = 'area';
					$typeid = $arr['area'];
					$cityData = $this->db->get_where('userleverelation', array('type'=>'area','typeid'=>$typeid))->row_array();
					if($cityData){
						$this->response_data('error','该区域经理角色已经存在');
					}
					break;
				case 4://店秘
					if(!isset($arr['store'])){
						$this->response_data('error','请选择门店');
					}
					$type = 'store';
					$typeid = $arr['store'];
					$storeSecretary = $this->db->get_where('userleverelation', array('type'=>'store','typeid'=>$typeid,'leve'=>'4'))->row_array();
					if($storeSecretary){
						$this->response_data('error','该店店秘角色已经存在');
					}
					break;
				case 5://店经理
					if(!isset($arr['store'])){
						$this->response_data('error','请选择门店');
					}
					$type = 'store';
					$typeid = $arr['store'];
					break;
				case 6://销售顾问
					if(!isset($arr['manager'])){
						$this->response_data('error','请选择门店经理');
					}

					$type = 'manager';
					$typeid = $arr['manager'];
					break;
			}

			if($this->db->get_where('user', array('username'=>$arr['phone']))->row_array()){
				$this->response_data('error','该手机号已经被注册');
			}

			$relationArr['type'] = $type;
			$relationArr['leve'] = $groupid;
			$relationArr['typeid'] = $typeid;

            $data['username'] = $arr['phone'];
            $data['password'] = md5(substr($arr['idcard'], -6));
            $data['last_login_time'] = time();      //创建时间
            $data['last_login_ip'] = '0.0.0.0';
            $data['idcard'] = $arr['idcard'];
            $data['idphoto'] = $arr['imagesList'];
            $data['phone'] = $arr['phone'];
            $data['nickname'] = $arr['nickname'];
            $data['work_status'] = $arr['work_status'];
            $data['mark'] = $arr['mark'];

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
	 * 编辑账号第一步
	 */
	public function createAccountStepEdit(){
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
			$typeid = "";
			$relationArr = array();
			switch ($groupid) {
				case 1://大区经理
					if(!isset($arr['large'])){
						$this->response_data('error','请选择大区');
					}
					$type = 'large';
					$typeid = $arr['large'];
					$largeData = $this->db->get_where('userleverelation', array('type'=>'large','typeid'=>$typeid,'uid !='=>$arr['uid']))->row_array();
					if($largeData){
						$this->response_data('error','该大区经理角色已经存在');
					}
					break;
				case 2://城市经理
					if(!isset($arr['city'])){
						$this->response_data('error','请选择城市');
					}
					$type = 'city';
					$typeid = $arr['city'];
					$cityData = $this->db->get_where('userleverelation', array('type'=>'city','typeid'=>$typeid,'uid !='=>$arr['uid']))->row_array();
					if($cityData){
						$this->response_data('error','该城市经理角色已经存在');
					}
					break;
				case 3://区域经理
					if(!isset($arr['area'])){
						$this->response_data('error','请选择区域');
					}
					$type = 'area';
					$typeid = $arr['area'];
					$cityData = $this->db->get_where('userleverelation', array('type'=>'area','typeid'=>$typeid,'uid !='=>$arr['uid']))->row_array();
					if($cityData){
						$this->response_data('error','该区域经理角色已经存在');
					}
					break;
				case 4://店秘
					if(!isset($arr['store'])){
						$this->response_data('error','请选择门店');
					}
					$type = 'store';
					$typeid = $arr['store'];
					$storeSecretary = $this->db->get_where('userleverelation', array('type'=>'store','typeid'=>$typeid,'leve'=>'4','uid !='=>$arr['uid']))->row_array();
					if($storeSecretary){
						$this->response_data('error','该店店秘角色已经存在');
					}
					break;
				case 5://店经理
					if(!isset($arr['store'])){
						$this->response_data('error','请选择门店');
					}
					$type = 'store';
					$typeid = $arr['store'];
					break;
				case 6://销售顾问
					if(!isset($arr['manager'])){
						$this->response_data('error','请选择门店经理');
					}

					$type = 'manager';
					$typeid = $arr['manager'];
					break;
			}

			if($this->db->get_where('user', array('username'=>$arr['phone'],'id !='=>$arr['uid']))->row_array()){
				$this->response_data('error','该手机号已经被注册');
			}

			$relationArr['type'] = $type;
			$relationArr['leve'] = $groupid;
			$relationArr['typeid'] = $typeid;

            $data['username'] = $arr['phone'];
            $data['password'] = md5(substr($arr['idcard'], -6));
            $data['last_login_time'] = time();      //创建时间
            $data['last_login_ip'] = '0.0.0.0';
            $data['idcard'] = $arr['idcard'];
            $data['idphoto'] = $arr['imagesList'];
            $data['phone'] = $arr['phone'];
            $data['nickname'] = $arr['nickname'];
            $data['work_status'] = $arr['work_status'];
            $data['mark'] = $arr['mark'];

            $this->db->trans_begin();//事务开始
            $this->db->update('user', $data,array('id'=>$arr['uid']));
            // $uid = $this->db->insert_id();
            $relationArr['uid'] = $arr['uid'];
            $this->db->update('userleverelation', $relationArr,array('uid'=>$arr['uid']));
            $group = $this->db->get_where('auth_group', array('leve'=>$relationArr['leve']))->row_array();//根据级别查询组
            $group_id = $group['id'];//得到权限组ID，注上面变量的 $groupid 为级别id
            $result['uid'] = $arr['uid'];
            $result['group_id'] = $group_id; //用户组ID
            $this->db->update('auth_group_access', $result,array('uid'=>$arr['uid']));
            if ($this->db->trans_status() === FALSE)
			{
			    $this->db->trans_rollback();
			    $this->response_data('error','账号编辑失败');
			}
			else
			{
			    $this->db->trans_commit();
			    $this->response_data('success','账号编辑成功');
			}



		}else{
			$arr = $this->input->get();
			$userData = $this->db->get_where('user', array('id'=>$arr['uid']))->row_array();
			$data['data'] = json_encode($arr);
			$data['userData'] = $userData;
			$this->load->view('admin/Account/createAccountStepEdit.html',$data);
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
		            $cityDefault = $citys ? $citys[0]['cityid']: '';
		            $array['cityDefault'] = array_key_exists('cityDefault',$arr) ? $arr['cityDefault'] : $cityDefault;
		            //这里如果没有传入大区，省份，城市。
					break;
				case '3':
					//区域经理
		            $provinces = $this->db->get_where('provinces', array('largeid'=>$array['largeDefult']))->result_array();
		            $array['provinces'] = $provinces;
		            $array['provinceDefault'] = array_key_exists('provinceDefault',$arr) ? $arr['provinceDefault'] : $provinces[0]['provinceid'];
		            $citys = $this->db->get_where('cities', array('provinceid'=>$array['provinceDefault']))->result_array();
		            $array['citys'] = $citys;
		            $cityDefault = $citys ? $citys[0]['cityid']: '';
		            $array['cityDefault'] = array_key_exists('cityDefault',$arr) ? $arr['cityDefault'] : $cityDefault;
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
		            $cityDefault = $citys ? $citys[0]['cityid']: '';
		            $array['cityDefault'] = array_key_exists('cityDefault',$arr) ? $arr['cityDefault'] : $cityDefault;
		            $areas = $this->db->get_where('custom_area', array('cityid'=>$array['cityDefault']))->result_array();
		            $array['areas'] = $areas;
		            $areaDefult = $areas ? $areas[0]['id'] : '';
		            $array['areaDefult'] = array_key_exists('areaDefult',$arr) ? $arr['areaDefult'] : $areaDefult;
		            $stores = $this->db->get_where('store', array('custom_area_id'=>$array['areaDefult']))->result_array();
		            $array['stores'] = $stores;
		            $storeDefult = $stores ? $stores[0]['id'] : '';
					$array['storeDefult'] = array_key_exists('storeDefult',$arr) ? $arr['storeDefult'] : $storeDefult;
					break;
				case '6':
					//销售顾问
		            $provinces = $this->db->get_where('provinces', array('largeid'=>$array['largeDefult']))->result_array();
		            $array['provinces'] = $provinces;
		            $array['provinceDefault'] = array_key_exists('provinceDefault',$arr) ? $arr['provinceDefault'] : $provinces[0]['provinceid'];
		            $citys = $this->db->get_where('cities', array('provinceid'=>$array['provinceDefault']))->result_array();
		            $array['citys'] = $citys;
		            $cityDefault = $citys ? $citys[0]['cityid']: '';
		            $array['cityDefault'] = array_key_exists('cityDefault',$arr) ? $arr['cityDefault'] : $cityDefault;
		            $areas = $this->db->get_where('custom_area', array('cityid'=>$array['cityDefault']))->result_array();
		            $array['areas'] = $areas;
		            $areaDefult = $areas ? $areas[0]['id'] : '';
		            $array['areaDefult'] = array_key_exists('areaDefult',$arr) ? $arr['areaDefult'] : $areaDefult;
		            $stores = $this->db->get_where('store', array('custom_area_id'=>$array['areaDefult']))->result_array();
		            $array['stores'] = $stores;
		            $storeDefult = $stores ? $stores[0]['id'] : '';
					$array['storeDefult'] = array_key_exists('storeDefult',$arr) ? $arr['storeDefult'] : $storeDefult;
					$managers = $this->db->select('u.id,u.nickname')->from('user as u')->join('userleverelation as relation', 'u.id = relation.uid')->where(array('relation.leve'=>'5','type'=>'store','typeid'=>$array['storeDefult']))->get()->result_array();
					$managerDefult = $managers ? $managers[0]['id'] : '';
					$array['managers'] = $managers;
					$array['managerDefult'] = array_key_exists('managerDefult',$arr) ? $arr['managerDefult'] : $storeDefult;
					break;
			}

			$this->response_data('success','获取成功',$array);
		}
	}

}
