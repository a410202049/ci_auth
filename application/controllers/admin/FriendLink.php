<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class FriendLink extends Auth_Controller {
	public function __construct(){
		parent::__construct();
	}

	public function index(){
        $array['url'] = 'admin/FriendLink/index';
        $array['tableName'] = 'link';
        $links = $this->page($array);
        $arr['links'] = $links;
        $this->load->view('admin/FriendLink/index.html',$arr);
	}

	/**
	 * [addPage 添加单页面]
	 */
	public function addLink(){
        if(IS_AJAX){
            $arr = $this->input->post();
            $arr['add_time'] = time();
            $arr['logo'] = isset($arr['imagesList']) ? $arr['imagesList'] : '';
            unset($arr['imagesList']);
            $this->db->insert('link', $arr);
            $this->response_data('success','页面添加成功');
        }
	}

    /**
     * 删除链接
     */

    public function delLink(){
        if(IS_AJAX){
            $id = $this->input->post('id');
            $this->db->delete('link', array('id'=>$id));
            $this->response_data('success','删除成功');
        }
    }


}