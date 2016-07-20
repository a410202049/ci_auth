<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class SystemSeting extends Auth_Controller {
	public function __construct(){
		parent::__construct();
	}

	/**
	 * [siteSeting 站点设置]
	 */
	public function siteSeting(){
        $data = $this->db->get('site_seting')->row_array();
		$this->load->view('admin/SystemSeting/siteSeting.html',$data);
	}

	/**
	 * [saveSeting 保存设置]
	 */
	public function saveSeting(){
        if($this->input->is_ajax_request()){
        	$arr = $this->input->post();
        	$this->db->update('site_seting', $arr);
        	$this->response_data('success','保存站点设置成功');
        }
	}

	/**
	 * [menu 自定义菜单列表]
	 * @return [type] [description]
	 */
	public function menus(){
		$rules = $this->db->order_by('sort', 'asc')->get('menus')->result_array();
        foreach ($rules as $key => $value) {
            $rules[$key]['order'] = $value['sort'];
        	$rules[$key]['parentid']= $value['pid'];
        	$rules[$key]['name'] = $value['title'];
        	$rules[$key]['title'] = $value['url'];
            $rules[$key]['route_url'] = $value['route_url'];
        	$rules[$key]['ischain'] = $value['is_chain']?'是':'否';
        	$rules[$key]['create_time'] = date('Y-m-d H:i:s', $value['create_time']);
        }
        $this->load->library('tree');
        $this->tree->icon = array('&nbsp;&nbsp;&nbsp;','&nbsp;&nbsp;&nbsp;├─ ','&nbsp;&nbsp;&nbsp;└─ ');
        $this->tree->nbsp = '&nbsp;&nbsp;&nbsp;';
        $this->tree->init($rules);
        $str = "<option value=\$id >\$spacer\$name</option>";
        $menus = $this->tree->get_tree(0,$str,1);
        $tdStr = "<tr>
                    <td width='60px'><input type='text' class='form-control' name='order[\$id]' value='\$order'></td>
                    <td>\$id</td>
                    <td>\$spacer\$name</td>
                    <td>\$title</td>
                    <td>\$route_url</td>
                    <td>\$ischain</td>
                    <td>\$create_time</td>
                    <td><a class='option edit-menu' data-val='\$id'>编辑</a>|<a class='option del-menu' data-val='\$id'>删除</a></td>
                </tr>";
        $this->tree->init($rules);
        $tr = $this->tree->get_tree(0, $tdStr);
        $arr['menus'] = $menus;
        $arr['tr'] = $tr;
		$this->load->view('admin/SystemSeting/menus.html',$arr);
	}


    /**
     * 获取不包含本身菜单的层级
     */
    public function ajaxGetMenu(){
        if($this->input->is_ajax_request()){
           $mid = trim($this->input->post('id'));
            $rules = $this->db->select('title,url,pid,id,create_time,is_chain,sort')->order_by('sort', 'asc')->get_where('menus',array('id!='=>$mid))->result_array();
            foreach ($rules as $key => $value) {
                $rules[$key]['order'] = $value['sort'];
                $rules[$key]['parentid']= $value['pid'];
                $rules[$key]['name'] = $value['title'];
                $rules[$key]['title'] = $value['url'];
                $rules[$key]['is_chain'] = $value['is_chain']?'是':'否';
                $rules[$key]['create_time'] = date('Y-m-d H:i:s', $value['create_time']);
            }
            $this->load->library('tree');
            $this->tree->icon = array('&nbsp;&nbsp;&nbsp;','&nbsp;&nbsp;&nbsp;├─ ','&nbsp;&nbsp;&nbsp;└─ ');
            $this->tree->nbsp = '&nbsp;&nbsp;&nbsp;';
            $this->tree->init($rules);
            $str = "<option value=\$id >\$spacer\$name</option>";
            $menus = $this->tree->get_tree(0,$str,1);
            $arr['menus'] = '<option value="0">--顶级菜单--</option>'.$menus;
            $info = $this->db->select('id,pid,is_chain,title')->get_where('menus',array('id='=>$mid))->row_array();
            $arr['info'] = $info;
            $this->response_data('success','获取成功',$arr);
        }
    }

    /**
     * [addMenu 添加菜单]
     */
    public function addMenu(){
        if($this->input->is_ajax_request()){
            $title = trim($this->input->post('title'));
            $pid = $this->input->post('pid');
            if(!$title){
                $this->response_data('error','菜单名称不能为空');
            }
            $data = $this->db->get_where('menus', array('title'=>$title,'pid'=>$pid))->row_array();
            if($data){
                $this->response_data('error','菜单名称已经存在');
            }
            $arr = $this->input->post();
            $arr['create_time'] = time();
            $status = $this->db->insert('menus', $arr);
            if($status){
                $this->response_data('success','菜单添加成功');
            }
        }
    }

    /**
     * [delMenu 删除菜单]
     * @return [type] [description]
     */
    public function delMenu(){
        if($this->input->is_ajax_request()){
            $id = $this->input->post('id');
            $data = $this->db->get_where('menus', array('pid'=>$id))->result_array();
            if($data){
                $this->response_data('error','当前菜单下，存在子菜单');
            }else{
                $this->db->delete('menus', array('id'=>$id));
                $this->response_data('success','删除成功');
            }
        }
    }


    /**
     * 编辑保存菜单
     */

    public function saveMenu(){
        if($this->input->is_ajax_request()){
            $id = $this->input->post('id');
            $is_chain = $this->input->post('is_chain');
            $pid = $this->input->post('pid');
            $menu_title = $this->input->post('menu_title');
            if(empty($menu_title)){
                $this->response_data('error','菜单名称不能为空');
            }
            $this->db->update('menus', array('title'=>$menu_title,'is_chain'=>$is_chain,'pid'=>$pid), array('id'=>$id));
            $this->response_data('success','菜单编辑成功');
        }
    }

    public function order(){
        $orders = $this->input->post('order');
        foreach ($orders as $key => $value) {
            $this->db->update('menus', array('sort'=>$value), array('id'=>$key));
        }
        $this->response_data('success','排序成功');
    }

}
