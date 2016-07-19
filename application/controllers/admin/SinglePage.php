<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class SinglePage extends Auth_Controller {
	public function __construct(){
		parent::__construct();
	}

	public function index(){
        $array['url'] = 'admin/SinglePage/index';
        $array['tableName'] = 'single_page';
        $array['where'] = array('is_del'=>'0');
        $singlePage = $this->page($array);
        $arr['singlePage'] = $singlePage;
        // cateid
        $this->load->view('admin/SinglePage/index.html',$arr);
	}

	/**
	 * [addPage 添加单页面]
	 */
	public function addPage(){
        if(IS_AJAX){
            $arr = $this->input->post();
            $arr['content'] = htmlspecialchars($arr['content']);
            $arr['content_en'] = htmlspecialchars($arr['content_en']);
            $arr['keywords'] = emptyreplace($arr['keywords']);
            $arr['keywords_en'] = emptyreplace($arr['keywords_en']);
            $arr['add_time'] = time();
            unset($arr['imagesList']);
            $this->db->insert('single_page', $arr);
            $this->response_data('success','页面添加成功');
        }else{
            $this->load->view('admin/SinglePage/addPage.html');
        }
	}

	/**
	 * [editPage 编辑单页面]
	 */
	public function editPage(){
        if(IS_AJAX){
            $arr = $this->input->post();
            $arr['content'] = htmlspecialchars($arr['content']);
            $arr['content_en'] = htmlspecialchars($arr['content_en']);
            $arr['keywords'] = emptyreplace($arr['keywords']);
            $arr['keywords_en'] = emptyreplace($arr['keywords_en']);
            $arr['add_time'] = time();
			$id = $arr['id'];
			unset($arr['id']);
            $this->db->update('single_page', $arr,array('id'=>$id));
            $this->response_data('success','页面编辑成功');
        }else{
			$id = $this->uri->segment('5');
			$result = $this->db->get_where('single_page',array('id'=>$id))->row_array();
			$arr['result'] = $result;
            $this->load->view('admin/SinglePage/editPage.html',$arr);
        }
	}


    /**
     * 删除页面
     */

    public function delPage(){
        if(IS_AJAX){
            $id = $this->input->post('id');
            $this->db->update('single_page',array('is_del' =>'1'), array('id'=>$id));
            $this->response_data('success','删除成功');
        }
    }


}