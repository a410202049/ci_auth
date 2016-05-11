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

		}else{
			$this->load->view('admin/StoreManage/addStore.html');
		}
	}

	/**
	 * 门店列表
	 */
	public function storeList(){
		$this->load->view('admin/StoreManage/storeList.html');
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
