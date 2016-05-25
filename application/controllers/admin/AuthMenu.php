<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class AuthMenu extends Auth_Controller {
	public function __construct(){
		parent::__construct();
	}

	public function index(){
		$rules = $this->db->select('title,name,pid,id,create_time,isshow,sort')->order_by('sort', 'asc')->get('auth_rule')->result_array();
        foreach ($rules as $key => $value) {
            $rules[$key]['order'] = $value['sort'];
        	$rules[$key]['parentid']= $value['pid'];
        	$rules[$key]['name'] = $value['title'];
        	$rules[$key]['title'] = $value['name'];
        	$rules[$key]['isshow'] = $value['isshow']?'√':'×';
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
                    <td><font color='red'>\$isshow</font></td>
                    <td>\$create_time</td>
                    <td><a class='option del-menu' data-val='\$id'>删除</a></td>
                </tr>";
        $this->tree->init($rules);
        $tr = $this->tree->get_tree(0, $tdStr);
        $arr['menus'] = $menus;
        $arr['tr'] = $tr;
		$this->load->view('admin/AuthMenu/index.html',$arr);
	}


    public function addMenu(){
        if($this->input->is_ajax_request()){
            $title = $this->input->post('title');
            if(!$title){
                $this->response_data('error','菜单名称不能为空');
            }
            $data = $this->db->get_where('auth_rule', array('title'=>$title))->row_array();
            if($data){
                $this->response_data('error','菜单名称已经存在');
            }
            $arr = $this->input->post();
            $arr['create_time'] = time();
            $status = $this->db->insert('auth_rule', $arr);
            if($status){
                $this->response_data('success','菜单添加成功');
            }
        }
    }

    public function delMenu(){
        if($this->input->is_ajax_request()){
            $id = $this->input->post('id');
            $data = $this->db->get_where('auth_rule', array('pid'=>$id))->result_array();
            if($data){
                $this->response_data('error','当前菜单下，存在子菜单');
            }else{
                $this->db->delete('auth_rule', array('id'=>$id));
                $this->response_data('success','删除成功');
            } 
        }

    }

    public function order(){
        $orders = $this->input->post('order');
        foreach ($orders as $key => $value) {
            $this->db->update('auth_rule', array('sort'=>$value), array('id'=>$key));
        }
        $this->response_data('success','排序成功');
    }

    public function addUser(){
        if($this->input->is_ajax_request()){
            $data['username'] = $this->input->post('username');
            $data['password'] = md5($this->input->post('password'));
            $data['last_login_time'] = time();      //创建时间
            $data['last_login_ip'] = '0.0.0.0';
            $where['username'] = $this->input->post('username');
            $result = $this->db->get_where('user', $where)->row_array();
            if(!empty($result)){
                $this->response_data('error','用户名已存在');
            }
            //添加用户
            $status = $this->db->insert('user', $data);
            $result['uid'] = $this->db->insert_id();
            $result['group_id'] = $this->input->post('groupid'); //用户组ID
            if($result['uid']){
                if($this->db->insert('auth_group_access', $result)){
                    $this->response_data('success','用户添加成功');
                }else{
                    $this->response_data('success','用户组分配失败');
                }
            }else{
                $this->response_data('error','用户添加失败');
            }
        }
    }


    /**
     * 管理员列表
     */
    public function adminList(){
        $admins = $this->db->select('u.id,u.username,group.title,u.last_login_ip,u.status,u.last_login_time')->from('user as u')->join('auth_group_access as access', 'u.id = access.uid')->join('auth_group as group','group.id = access.group_id')->where(array('group.role'=>'1'))->get()->result_array();
        foreach ($admins as $key => $value) {
            $group = $this->auth->getGroups($value['id']);
            $admins[$key]['last_login_time'] = date('Y-m-d H:i:s',$value['last_login_time']);
            $admins[$key]['status'] = $value['status'] ? '启用' : '禁用';
            $admins[$key]['disable'] = $value['status'] ? '禁用' : '启用';
        }
        $groups = $this->db->where(array('role'=>'1'))->get('auth_group')->result_array();
        $arr['admins'] = $admins;
        $arr['groups'] = $groups;
        $this->load->view('admin/AuthMenu/adminList.html',$arr);
    }

    /**
     * 禁用用户
     */
    public function disableUser(){
        if($this->input->is_ajax_request()){
            if($this->input->post('id') == '1'){
                $this->response_data('error','不能禁用系统默认账户');
            }
            $data = $this->db->get_where('user', array('id'=>$this->input->post('id')))->row_array();
            if($data['status']){
                $this->db->update('user', array('status'=>0), array('id'=>$this->input->post('id')));
                $this->response_data('success','用户禁用成功');
            }else{
                $this->db->update('user', array('status'=>1), array('id'=>$this->input->post('id')));
                $this->response_data('success','用户启用成功');
            }
        }
    }

    public function delUser(){
        if($this->input->is_ajax_request()){
            $id = $this->input->post('id');
            if($id == '1'){
                $this->response_data('error','不能删除系统默认账户');
            }
            $status = $this->db->delete('user', array('id'=>$id));
            if($status){
                $this->db->delete('auth_group_access', array('uid'=>$id));
                $this->response_data('success','用户删除成功');
            }
        }
    }

    /**
     * 分组列表
     */
    public function groupList(){
        $groups = $this->db->order_by('id', 'asc')->get('auth_group')->result_array();
        $arr['groups'] = $groups;
        $this->load->view('admin/AuthMenu/groupList.html',$arr);
    }

    /**
     * 添加分组
     */
    public function addGroup(){
        if($this->input->method(true)!='POST'){
            $rules = $this->db->select('title,pid,id')->get('auth_rule')->result_array();
            foreach ($rules as $key => $value) {
                $rules[$key]['parentid']= $value['pid'];
                $rules[$key]['name'] = $value['title'];
            }
            $this->load->library('tree');
            $this->tree->icon = array('&nbsp;&nbsp;&nbsp;','&nbsp;&nbsp;&nbsp;├─ ','&nbsp;&nbsp;&nbsp;└─ ');
            $this->tree->nbsp = '&nbsp;&nbsp;&nbsp;';
            $this->tree->init($rules);
            $str = "<label style='margin-bottom:5px;'><input name='rule[]' type='checkbox' value='\$id' /><i></i>&nbsp;\$spacer\$name</label><br>";
            $check = $this->tree->get_tree(0,$str,1);
            $arr['check'] = $check;
            $this->load->view('admin/AuthMenu/addGroup.html',$arr);
        }else{
            $arr = $this->input->post();
            if(empty($arr['rule'])){
                $this->response_data('error','权限不能为空');
            }
            if($this->db->get_where('auth_group', array('title'=>$arr['title']))->row_array()){
                $this->response_data('error','用户组已经存在');
            }
            $data['title'] = $arr['title'];
            $data['role'] = $arr['role'];
            if($arr['role'] =='2'){
                $data['leve'] = $arr['leve'];
                if($this->db->get_where('auth_group', array('leve'=>$arr['leve']))->row_array()){
                    $this->response_data('error','该权限的业务员用户组已经存在');
                }
            }
            $data['rules'] = implode(',', $arr['rule']);
            $data['create_time'] = time();


            if($this->db->insert('auth_group', $data)){
                $this->response_data('success','用户组添加成功');
            }else{
                $this->response_data('error','用户组添加失败');
            }
        }
    }


    /**
     * 编辑用户组
     */
    public function editGroup(){
        if($this->input->method(true)!='POST'){
            $id = $this->uri->segment(4);
            $authData = $this->db->get_where('auth_group', array('id'=>$id))->row_array();
            $arrs = explode(',', $authData['rules']);
            $rules = $this->db->select('title,pid,id')->get('auth_rule')->result_array();
            foreach ($rules as $key => $value) {
                $rules[$key]['parentid']= $value['pid'];
                $rules[$key]['name'] = $value['title'];
                $rules[$key]['check'] = in_array($value['id'], $arrs) ? 'checked="checked"' : '';

            }
            $this->load->library('tree');
            $this->tree->icon = array('&nbsp;&nbsp;&nbsp;','&nbsp;&nbsp;&nbsp;├─ ','&nbsp;&nbsp;&nbsp;└─ ');
            $this->tree->nbsp = '&nbsp;&nbsp;&nbsp;';
            $this->tree->init($rules);
            $str = "<label style='margin-bottom:5px;'><input name='rule[]' type='checkbox' \$check value='\$id' /><i></i>&nbsp;\$spacer\$name</label><br>";
            $check = $this->tree->get_tree(0,$str,1);
            $arr['check'] = $check;
            $arr['authData'] = $authData;
            $this->load->view('admin/AuthMenu/editGroup.html',$arr);

        }else{
            $arr = $this->input->post();
            if(empty($arr['rule'])){
                $this->response_data('error','权限不能为空');
            }
            $id = $arr['id'];
            // $data['id'] = $id;
            $data['title'] = $arr['title'];
            $data['role'] = $arr['role'];
            if($arr['role'] =='2'){
                $data['leve'] = $arr['leve'];
            }
            $data['rules'] = implode(',', $arr['rule']);
            if($this->db->update('auth_group',$data,array('id'=>$id))){
                $this->response_data('success','用户组编辑成功');
            }else{
                $this->response_data('error','用户组编辑失败');
            }
        }
    }

    /**
     * 删除分组
     */
    public function delGroup(){
        $arr = $this->input->post();
        if($this->input->method(true)=='POST'){
            $id = $arr['id'];
            if($id == '1'){
                $this->response_data('error','不能删除系统默认分组');
            }
            $where['id'] = $id;
            if($this->db->delete('auth_group', array('id'=>$id))){
                $this->db->delete('auth_group_access', array('group_id'=>$id));
                $this->response_data('success','用户组删除成功');
            }else{
                $this->response_data('error','用户组删除失败');
            }
        }
    }

}
