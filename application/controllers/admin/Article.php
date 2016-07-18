<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Article extends Auth_Controller {
	public function __construct(){
		parent::__construct();
	}

    /**
     * [categoryManage 文章分类管理]
     * @return [type] [description]
     */
    public function categoryManage(){
        $rules = $this->db->order_by('sort', 'asc')->get('article_category')->result_array();
        foreach ($rules as $key => $value) {
            $rules[$key]['order'] = $value['sort'];
            $rules[$key]['parentid']= $value['parent_id'];
            $rules[$key]['cat_name'] = $value['cat_name'];
            $rules[$key]['cat_name_en'] = $value['cat_name_en'];
            $rules[$key]['keywords'] = $value['keywords'];
            $rules[$key]['keywords_en'] = $value['keywords_en'];
            $rules[$key]['description'] = $value['description'];
            $rules[$key]['description_en'] = $value['description_en'];
        }
        $this->load->library('tree');
        $this->tree->icon = array('&nbsp;&nbsp;&nbsp;','&nbsp;&nbsp;&nbsp;├─ ','&nbsp;&nbsp;&nbsp;└─ ');
        $this->tree->nbsp = '&nbsp;&nbsp;&nbsp;';
        $this->tree->init($rules);
        $str = "<option value=\$id >\$spacer\$cat_name</option>";
        $menus = $this->tree->get_tree(0,$str,1);
        $tdStr = "<tr>
                    <td width='60px'><input type='text' class='form-control' name='order[\$id]' value='\$order'></td>
                    <td>\$id</td>
                    <td>\$spacer\$cat_name</td>
                    <td>\$spacer\$cat_name_en</td>
                    <td>\$keywords</td>
                    <td>\$keywords_en</td>
                    <td>\$description</td>
                    <td>\$description_en</td>
                    <td><a class='option edit-menu' data-val='\$id'>编辑</a>|<a class='option del-menu' data-val='\$id'>删除</a></td>
                </tr>";
        $this->tree->init($rules);
        $tr = $this->tree->get_tree(0, $tdStr);
        $arr['menus'] = $menus;
        $arr['tr'] = $tr;
        $this->load->view('admin/Article/categoryManage.html',$arr);
    }

    /**
     * [addMenu 添加菜单]
     */
    public function addCategory(){
        if($this->input->is_ajax_request()){
            $cat_name = trim($this->input->post('cat_name'));
            $pid = $this->input->post('parent_id');
            if(!$cat_name){
                $this->response_data('error','菜单名称不能为空');
            }
            $data = $this->db->get_where('article_category', array('cat_name'=>$cat_name,'parent_id'=>$pid))->row_array();
            if($data){
                $this->response_data('error','菜单名称已经存在');
            }
            $arr = $this->input->post();
            $status = $this->db->insert('article_category', $arr);
            if($status){
                $this->response_data('success','分类添加成功');
            }
        }
    }

    /**
     * [delMenu 删除分类]
     * @return [type] [description]
     */
    public function delCategory(){
        if($this->input->is_ajax_request()){
            $id = $this->input->post('id');
            $data = $this->db->get_where('article_category', array('parent_id'=>$id))->result_array();
            if($data){
                $this->response_data('error','当前分类下，存在子分类');
            }else{
                $this->db->delete('article_category', array('id'=>$id));
                $this->response_data('success','删除成功');
            }
        }
    }

    /**
     * [order 分类排序]
     * @return [type] [description]
     */
    public function order(){
        $orders = $this->input->post('order');
        foreach ($orders as $key => $value) {
            $this->db->update('article_category', array('sort'=>$value), array('id'=>$key));
        }
        $this->response_data('success','排序成功');
    }

    /**
     * [articleList 文章列表页]
     * @return [type] [description]
     */
    public function articleList(){
        echo "xxx";
    }




    /**
     * 获取不包含本身菜单的层级
     */
    public function ajaxGetCategory(){
        if($this->input->is_ajax_request()){
           $mid = trim($this->input->post('id'));
            $rules = $this->db->order_by('sort', 'asc')->get_where('article_category',array('id!='=>$mid))->result_array();

            foreach ($rules as $key => $value) {
                $rules[$key]['parentid']= $value['parent_id'];
                $rules[$key]['cat_name'] = $value['cat_name'];
            }
            $this->load->library('tree');
            $this->tree->icon = array('&nbsp;&nbsp;&nbsp;','&nbsp;&nbsp;&nbsp;├─ ','&nbsp;&nbsp;&nbsp;└─ ');
            $this->tree->nbsp = '&nbsp;&nbsp;&nbsp;';
            $this->tree->init($rules);
            $str = "<option value=\$id >\$spacer\$cat_name</option>";
            $menus = $this->tree->get_tree(0,$str,1);
            $arr['menus'] = '<option value="0">--顶级菜单--</option>'.$menus;
            $info = $this->db->get_where('article_category',array('id='=>$mid))->row_array();
            $arr['info'] = $info;
            $this->response_data('success','获取成功',$arr);
        }
    }


    /**
     * 编辑保存分类
    */
    public function saveCategory(){
        if($this->input->is_ajax_request()){
            $arr = $this->input->post();
            $id = $this->input->post('category_id');
            $pid = $this->input->post('pid');
            $cat_name = $this->input->post('cat_name');
            if(empty($cat_name)){
                $this->response_data('error','分类名称不能为空');
            }
            unset($arr['category_id']);
            $arr['parent_id'] = $arr['pid'];
            unset($arr['pid']);
            $this->db->update('article_category',$arr, array('id'=>$id));
            $this->response_data('success','分类编辑成功');
        }
    }



}
