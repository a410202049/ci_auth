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
    // /**
    //  * 编辑产品
    //  */

    // public function editProduct(){
    //     if(IS_AJAX){
    //         $arr = $this->input->post();
    //         $image = isset($arr['imagesList']) ? $arr['imagesList'] : '';
    //         $arr['image'] = $image;
    //         $arr['content'] = htmlspecialchars($arr['content']);
    //         $arr['content_en'] = htmlspecialchars($arr['content_en']);
    //         $arr['keywords'] = emptyreplace($arr['keywords']);
    //         $arr['keywords_en'] = emptyreplace($arr['keywords_en']);
    //         $arr['sort'] = '50';
    //         $arr['add_time'] = time();
    //         unset($arr['imagesList']);
    //         $id = $arr['id'];
    //         unset($arr['id']);
    //         $this->db->update('product',$arr, array('id'=>$id));
    //         $this->response_data('success','产品编辑成功');
    //     }else{
    //         $rules = $this->db->order_by('sort', 'asc')->get('product_category')->result_array();
    //         foreach ($rules as $key => $value) {
    //             $rules[$key]['order'] = $value['sort'];
    //             $rules[$key]['parentid']= $value['parent_id'];
    //             $rules[$key]['cat_name'] = $value['cat_name'];
    //             $rules[$key]['cat_name_en'] = $value['cat_name_en'];
    //             $rules[$key]['keywords'] = $value['keywords'];
    //             $rules[$key]['keywords_en'] = $value['keywords_en'];
    //             $rules[$key]['description'] = $value['description'];
    //             $rules[$key]['description_en'] = $value['description_en'];
    //         }
    //         $this->load->library('tree');
    //         $this->tree->icon = array('&nbsp;&nbsp;&nbsp;','&nbsp;&nbsp;&nbsp;├─ ','&nbsp;&nbsp;&nbsp;└─ ');
    //         $this->tree->nbsp = '&nbsp;&nbsp;&nbsp;';
    //         $this->tree->init($rules);
    //         $str = "<option value=\$id >\$spacer\$cat_name</option>";
    //         $categorys = $this->tree->get_tree(0,$str,1);
    //         $arr['categorys'] = $categorys;
    //         $id = $this->uri->segment('5');
    //         $result = $this->db->get_where('product',array('id'=>$id))->row_array();
    //         $arr['result'] = $result;
    //         $this->load->view('admin/Product/editProduct.html',$arr);
    //     }
    // }

    /**
     * 删除产品
     */

    public function delPage(){
        if(IS_AJAX){
            $id = $this->input->post('id');
            $result = $this->db->get_where('single_page',array('id'=>$id))->row_array();
            $this->db->update('single_page',array('is_del' =>'1'), array('id'=>$id));
            $this->response_data('success','删除成功');
        }
    }


}