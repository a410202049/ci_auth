<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Platform extends Auth_Controller {
	public function __construct(){
		parent::__construct();
	}

	public function index(){
		$this->load->view('admin/Platform/index.html');
	}

    /**
     * 管理员列表
     */
    public function adminList(){
        $admins = $this->db->select('u.id,u.username,group.title,u.last_login_ip,u.status,u.last_login_time')->from('user as u')->join('pt_group_access as access', 'u.id = access.uid')->join('pt_group as group','group.id = access.group_id')->where(array('user_type'=>'platform'))->get()->result_array();
        foreach ($admins as $key => $value) {
            $group = $this->pt_auth->getGroups($value['id']);
            $admins[$key]['last_login_time'] = date('Y-m-d H:i:s',$value['last_login_time']);
            $admins[$key]['status'] = $value['status'] ? lang('enable') : lang('disable');
            $admins[$key]['disable'] = $value['status'] ? lang('disable') : lang('enable');
        }
        $groups = $this->db->get('pt_group')->result_array();
        $arr['admins'] = $admins;
        $arr['groups'] = $groups;
        $this->load->view('admin/Platform/adminList.html',$arr);
    }

    /**
     * [addUser 平台添加用户]
     */
    public function addUser(){
        if($this->input->is_ajax_request()){
            $data['username'] = $this->input->post('username');
            $data['password'] = md5($this->input->post('password'));
            $data['last_login_time'] = time();      //创建时间
            $data['last_login_ip'] = '0.0.0.0';
            $data['user_type'] = 'platform';
            $where['username'] = $this->input->post('username');
            $result = $this->db->get_where('user', $where)->row_array();
            if(!empty($result)){
                $this->response_data('error',lang('user').lang('already_exist'));
            }
            //添加用户
            $status = $this->db->insert('user', $data);
            $result['uid'] = $this->db->insert_id();
            $result['group_id'] = $this->input->post('groupid'); //用户组ID
            if($result['uid']){
                if($this->db->insert('pt_group_access', $result)){
                    $this->response_data('success',lang('add_user').lang('success'));
                }
            }else{
                $this->response_data('error',lang('add_user').lang('fail'));
            }
        }
    }

  	/**
     * 禁用用户
     */
    public function disableUser(){
        if($this->input->is_ajax_request()){
            if($this->input->post('id') == '1'){
                $this->response_data('error',lang('cant').lang('disable').lang('system').lang('default').lang('user'));
            }
            $data = $this->db->get_where('user', array('id'=>$this->input->post('id')))->row_array();
            if($data['status']){
                $this->db->update('user', array('status'=>0), array('id'=>$this->input->post('id')));
                $this->response_data('success',lang('user').lang('disable').lang('success'));
            }else{
                $this->db->update('user', array('status'=>1), array('id'=>$this->input->post('id')));
                $this->response_data('success',lang('user').lang('enable').lang('success'));
            }
        }
    }

    /**
     * [delUser 平台删除用户]
     */
    public function delUser(){
        if($this->input->is_ajax_request()){
            $id = $this->input->post('id');
            if($id == '1'){
                $this->response_data('error',lang('cant').lang('delete').lang('system').lang('default').lang('user'));
            }
            $status = $this->db->delete('user', array('id'=>$id));
            if($status){
                $this->db->delete('pt_group_access', array('uid'=>$id));
                $this->response_data('success',lang('user').lang('delete').lang('success'));
            }
        }
    }

    /**
     * 平台分组列表
     */
    public function groupList(){
        $groups = $this->db->order_by('id', 'asc')->get('pt_group')->result_array();
        $arr['groups'] = $groups;
        $this->load->view('admin/Platform/groupList.html',$arr);
    }


    /**
     * 添加分组
     */
    public function addGroup(){
        if(IS_POST){
            $arr = $this->input->post();
            if(empty($arr['rule'])){
                $this->response_data('error',lang('auth').lang('cant_empty'));
            }
            if($this->db->get_where('pt_group', array('title'=>$arr['title']))->row_array()){
                $this->response_data('error',lang('group_name').lang('already_exist'));
            }
            $data['title'] = $arr['title'];
            $data['rules'] = implode(',', $arr['rule']);
            $data['create_time'] = time();
            if($this->db->insert('pt_group', $data)){
                $this->response_data('success',lang('group_name').lang('add_success'));
            }else{
                $this->response_data('error',lang('group_name').lang('add_fail'));
            }
        }else{
            $rules = $this->db->get_where('auth_rule',array('rule_type'=>'platform'))->result_array();
            foreach ($rules as $key => $value) {
                $rules[$key]['parentid']= $value['pid'];
                $rules[$key]['name'] = lang($value['title_language']);
            }
            $this->load->library('tree');
            $this->tree->icon = array('&nbsp;&nbsp;&nbsp;','&nbsp;&nbsp;&nbsp;├─ ','&nbsp;&nbsp;&nbsp;└─ ');
            $this->tree->nbsp = '&nbsp;&nbsp;&nbsp;';
            $this->tree->init($rules);
            $str = "<label style='margin-bottom:5px;'><input name='rule[]' type='checkbox' value='\$id' /><i></i>&nbsp;\$spacer\$name</label><br>";
            $check = $this->tree->get_tree(0,$str,1);
            $arr['check'] = $check;
            $this->load->view('admin/Platform/addGroup.html',$arr);
        }
    }


    /**
     * 编辑用户组
     */
    public function editGroup(){
        if(IS_POST){

            $arr = $this->input->post();
            if(empty($arr['rule'])){
                $this->response_data('error',lang('auth').lang('cant_empty'));
            }
            $id = $arr['id'];
            $data['title'] = $arr['title'];
            $data['rules'] = implode(',', $arr['rule']);
            if($this->db->update('pt_group',$data,array('id'=>$id))){
                $this->response_data('success',lang('group_name').lang('edit_success'));
            }else{
                $this->response_data('error',lang('group_name').lang('edit_success'));
            }


        }else{
            $id = $this->uri->segment(4);
            $authData = $this->db->get_where('pt_group', array('id'=>$id))->row_array();
            $arrs = explode(',', $authData['rules']);
            $rules = $this->db->get_where('auth_rule',array('rule_type'=>'platform'))->result_array();

            foreach ($rules as $key => $value) {
                $rules[$key]['parentid']= $value['pid'];
                $rules[$key]['name'] = lang($value['title_language']);
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
            $this->load->view('admin/Platform/editGroup.html',$arr);

        }
    }

    /**
     * 平台权限菜单列表
     */

    public function authMenu(){
        $rules = $this->db->order_by('sort', 'asc')->get_where('auth_rule',array('rule_type'=>'platform'))->result_array();
        foreach ($rules as $key => $value) {
            $rules[$key]['order'] = $value['sort'];
            $rules[$key]['parentid']= $value['pid'];
            $rules[$key]['name'] = lang($value['title_language']);
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
                    <td><a class='option edit-menu' data-val='\$id'>".lang('edit')."</a>|<a class='option del-menu' data-val='\$id'>".lang('delete')."</a></td>
                </tr>";
        $this->tree->init($rules);
        $tr = $this->tree->get_tree(0, $tdStr);
        $arr['menus'] = $menus;
        $arr['tr'] = $tr;
        $this->load->view('admin/Platform/authMenu.html',$arr);    
    }


    /**
     * 获取不包含本身菜单的层级
     */
    public function ajaxGetMenu(){
        if(IS_AJAX){
           $mid = trim($this->input->post('id'));
            $rules = $this->db->order_by('sort', 'asc')->get_where('auth_rule',array('id!='=>$mid,'rule_type'=>'platform'))->result_array();
            foreach ($rules as $key => $value) {
                $rules[$key]['order'] = $value['sort'];
                $rules[$key]['parentid']= $value['pid'];
                $rules[$key]['name'] = lang($value['title_language']);
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
            $arr['menus'] = '<option value="0">--'.lang('top_menu').'--</option>'.$menus;
            $info = $this->db->select('id,pid,isshow,title_language')->get_where('auth_rule',array('id='=>$mid))->row_array();
            $arr['info'] = $info;
            $this->response_data('success',lang('success'),$arr);

        }
    }


    /**
     * 编辑保存菜单
     */

    public function saveMenu(){
        if(IS_AJAX){
            $id = $this->input->post('id');
            $is_show = $this->input->post('is_show');
            $pid = $this->input->post('pid');
            $menu_title = $this->input->post('menu_title');
            if(empty($menu_title)){
                $this->response_data('error',lang('language_config').lang('cant_empty'));
            }
            $this->db->update('auth_rule', array('title_language'=>$menu_title,'isshow'=>$is_show,'pid'=>$pid), array('id'=>$id));
            $this->response_data('success',lang('menu').lang('edit_success'));
        }
    }

    /**
     * [delMenu 删除菜单]
     */
    public function delMenu(){
        if(IS_AJAX){
            $id = $this->input->post('id');
            $data = $this->db->get_where('auth_rule', array('pid'=>$id))->result_array();
            if($data){
                $this->response_data('error',lang('current_menu_sub_menu'));
            }else{
                $this->db->delete('auth_rule', array('id'=>$id));
                $this->response_data('success',lang('delete').lang('success'));
            }
        }

    }

    /**
     * [addMenu 添加菜单]
     */
    public function addMenu(){
        if(IS_AJAX){
            $title = trim($this->input->post('title'));
            $pid = $this->input->post('pid');
            if(!$title){
                $this->response_data('error',lang('language_config').lang('cant_empty'));
            }
            $data = $this->db->get_where('auth_rule', array('title_language'=>$title,'pid'=>$pid))->row_array();
            if($data){
                $this->response_data('error',lang('language_config').lang('already_exist'));
            }            

            $arr = $this->input->post();
            $arr['create_time'] = time();
            $arr['title_language'] = $arr['title'];
            unset($arr['title']);
            $status = $this->db->insert('auth_rule', $arr);
            if($status){
                $this->response_data('success',lang('add_menu').lang('success'));
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


    /**
     * [siteSetting 平台站点设置]
     * @return [type] [description]
     */
    public function siteSetting(){
        if(IS_POST){
            echo "ssss";
        }else{
            $languages = $this->config->item('support_language');
            $data['languages'] = $languages;
            $this->load->view('admin/Platform/siteSeting.html',$data);
        }


    }

}
