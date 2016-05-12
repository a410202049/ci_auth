<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class StoreManage extends Auth_Controller {
	public function __construct(){
		parent::__construct();
	}



	/**
	 * 自定义区域管理
	 */
	public function areaManage(){
        $largearea = $this->db->get('large_area')->result_array();
        $areas = $this->db->get('custom_area')->result_array();
        foreach ($areas as $key => $value) {
	        $large = $this->db->get_where('large_area', array('id'=>$value['largeid']))->row_array();
	        $province = $this->db->get_where('provinces', array('provinceid'=>$value['provinceid']))->row_array();
	        $city = $this->db->get_where('cities', array('cityid'=>$value['cityid']))->row_array();
	        $areas[$key]['large'] = $large['name'];
	        $areas[$key]['province'] = $province['province'];
	        $areas[$key]['city'] = $city['city'];
        }
     	$arr['areas'] = $areas;
        $arr['largearea'] = $largearea;
		$this->load->view('admin/StoreManage/areaManage.html',$arr);
	}

	/**
	 * 根据id获取区域
	 */
	public function getArea(){
		if($this->input->is_ajax_request()){
			$id = $this->input->post('id');
			$data = $this->db->get_where('custom_area', array('id'=>$id))->row_array();
			$this->response_data('success','获取成功',$data);
		}
	}

	/**
	 * 添加区域
	 */
	public function addAreaManage(){
        if($this->input->is_ajax_request()){
            $name = $this->input->post('name');
            if(!$name){
                $this->response_data('error','区域名不能为空');
            }
            $data = $this->db->get_where('custom_area', array('name'=>$name))->row_array();
            if($data){
                $this->response_data('error','区域已经存在');
            }
            $arr = $this->input->post();
            $arr['cityid'] = $arr['city'];
            $arr['provinceid'] = $arr['province'];
            $arr['largeid'] = $arr['large'];
            unset($arr['city']); 
            unset($arr['province']); 
            unset($arr['large']); 
            $status = $this->db->insert('custom_area', $arr);
            if($status){
                $this->response_data('success','区域添加成功');
            }
        }
	}

	/**
	 * 编辑区域
	 */
	public function editAreaManage(){
        if($this->input->is_ajax_request()){
            $name = $this->input->post('name');
            $mark = $this->input->post('mark');
            if(!$name){
                $this->response_data('error','区域名不能为空');
            }
            $data = $this->db->get_where('custom_area', array('name'=>$name,'id !='=>$this->input->post('id')))->row_array();
            if($data){
                $this->response_data('error','区域已经存在');
            }
            $arr = $this->input->post();
            $this->db->update('custom_area', array('name'=>$name,'mark'=>$mark,'largeid'=>$arr['large'],'provinceid'=>$arr['province'],'cityid'=>$arr['city']), array('id'=>$this->input->post('id')));
            $this->response_data('success','区域编辑成功');
        }
	}

	/**
	 * 删除区域
	 */
	public function delAreaManage(){
		if($this->input->is_ajax_request()){
			$id = $this->input->post('id');
			$this->db->delete('custom_area', array('id'=>$id));
			$this->response_data('success','删除区域成功');
		}
	}



	/**
	 * 返回地区JSON
	 */
	public function areaJson(){
		if($this->input->is_ajax_request()){
			$data = $this->db->get_where('large_area')->result_array();
			foreach ($data as $key => $value) {
				$result = $this->db->get_where('provinces', array('largeid'=>$value['id']))->result_array();
				foreach ($result as $k => $v) {
					$result[$k]['id'] = $v['provinceid'];
					$result[$k]['name'] = $v['province'];
					unset($result[$k]['largeid']);
					unset($result[$k]['province']);
					unset($result[$k]['provinceid']);
					$child = $this->db->get_where('cities', array('provinceid'=>$v['provinceid']))->result_array();
					foreach ($child as $ck => $cv) {
						$child[$ck]['id'] = $cv['cityid'];
						$child[$ck]['name'] = $cv['city'];
						unset($child[$ck]['city']);
						unset($child[$ck]['cityid']);
						unset($child[$ck]['provinceid']);
					}
					$result[$k]['sub'] = $child;
				}
				$data[$key]['sub'] = $result;
			}
			$this->response_data('success','获取成功',$data);
		}
	}

	/**
	 * 添加门店
	 */
	public function addStore(){
		if($this->input->is_ajax_request()){
			$arr = $this->input->post();
			if(!$arr['longitude']||!$arr['latitude']){
				$this->response_data('error','请输入正确的联系地址，否则获取不到经纬度');
			}
			if(!isset($arr['imagesList'])){
				$this->response_data('error','请上传门店图片，至少一张');
			}
			if(!isset($arr['custom_area_id'])){
				$this->response_data('error','请选择区域，没有则自行创建');
			}
			$data = $this->db->get_where('esc_store', array('address'=>$arr['address']))->row_array();
			if($data){
				$this->response_data('error','门店相同不能重复添加');
			}
			$arr['opentime'] = strtotime($arr['opentime']);
			$arr['imagesList'] = serialize($arr['imagesList']);
			$arr['createtime'] = time();
			$status = $this->db->insert('esc_store', $arr);
			$this->response_data('success','门店添加成功');
		}else{

			$this->load->view('admin/StoreManage/addStore.html');
		}
	}

	/**
	 * 编辑门店
	 */
	public function editStore(){
		$arr = $this->input->post();			
		if($this->input->is_ajax_request()){
		
		}else{
			$id = $this->uri->segment(4);
			$store = $this->db->get_where('store', array('id'=>$id))->row_array();
			$store['opentime'] = date('Y-m-d',$store['opentime']);
			$store['imagesList'] = unserialize($store['imagesList']);
			$areas = $this->db->get_where('custom_area', array('id'=>$store['custom_area_id']))->row_array();

			$arr['areas'] = $areas;
			$arr['store'] = $store;
			$this->load->view('admin/StoreManage/editStore.html',$arr);
		}
	}


	/**
	 * 门店列表
	 */
	public function storeList(){
		$page_config['perpage']=5;   //每页条数
		$page_config['part']=2;//当前页前后链接数量
		$page_config['url']='admin/StoreManage/storeList';//url
		$page_config['seg']=4;//参数取 index.php之后的段数，默认为3，即index.php/control/function/18 这种形式
		$page_config['nowindex']=$this->uri->segment($page_config['seg']) ? $this->uri->segment($page_config['seg']):1;//当前页
		$this->load->library('mypage_class');
		$page_config['total']=$this->db->count_all_results('store');
		$this->mypage_class->initialize($page_config);
		$this->db->limit($page_config['perpage'],$page_config['perpage'] * ($page_config['nowindex'] - 1));
		$data = $this->db->order_by('id','desc')->get('store')->result_array();
		foreach ($data as $key => $value) {
			$areas = $this->db->get_where('custom_area', array('id'=>$value['custom_area_id']))->row_array();
			$lagrename = $this->db->get_where('large_area', array('id'=>$areas['largeid']))->row_array()['name'];
			$provincename = $this->db->get_where('provinces', array('provinceid'=>$areas['provinceid']))->row_array()['province'];
			$cityname = $this->db->get_where('cities', array('cityid'=>$areas['cityid']))->row_array()['city'];
			$data[$key]['lagrename'] = $lagrename;
			$data[$key]['provincename'] = $provincename;
			$data[$key]['cityname'] = $cityname;
		}
		$arr['data'] = $data;
		$this->load->view('admin/StoreManage/storeList.html',$arr);
	}

	/**
	 * 根据相应ID获取自定义区域
	*/

	public function getCustomArea(){
		if($this->input->is_ajax_request()){
			$id = $this->input->post('id');
			$type = $this->input->post('type');
			$field = "";
			switch ($type) {
				case 'large':
					$field = 'largeid';
					break;
				case 'province':
					$field = 'provinceid';
					break;
				case 'city':
					$field = 'cityid';
					break;
			}
			$data = $this->db->get_where('custom_area', array($field=>$id))->result_array();
			$this->response_data('success','获取成功',$data);
		}
	}


}
