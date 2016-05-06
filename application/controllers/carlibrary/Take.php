<?php
defined('BASEPATH') OR exit('No direct script access allowed');
set_time_limit(0);//设置不超时

class Take extends CI_Controller {

	public function brand(){
		$brandStr = 'http://i.che168.com/Handler/SaleCar/ScriptCarList_V1.ashx?needData=1';
		$content = file_get_contents($brandStr);
		$str=iconv("GBK", "UTF-8", $content);
		preg_match('/=\'([^\']+)\'/', $str, $matches);
        $arr = explode(',',$matches[1]);
        $cars = array_chunk($arr,2);
        foreach ($cars as $k => $v) {
        	$a = explode(' ',$v[1]);
        	$cars[$k][1] = $a[0];
        	$cars[$k][2] = $a[1];
        }
        foreach ($cars as $key => $value) {
            $dataArr = array(
                'id'=>$value[0],
                'name'=>$value[2],
                'firstLetter'=>$value[1]
            );
            $objResult  = $this->db->get_where('brand', array('id'=>$value[0]));
            if(!$objResult->row_array()){
            	//品牌不存在就添加
            	$this->db->insert('brand', $dataArr);
            }
            //品牌采集完成跳转到车系和厂商采集
            redirect(base_url('stepone') );
        }

	}

	public function stepone($bid = ''){
		$ret = $this->db->from('brand')->order_by('id asc')->limit(0,1)->get();
		$rid = $ret->row_array()['id'];
		$id = !empty($bid) ? $bid : $rid;
		$this->vendors_carseries($id);
		$result = $this->db->from('brand')->where('id >',$id)->order_by('id asc')->limit(0,1)->get();
		if($nid = $result->row_array()['id']){//判断采集未完成
            echo "正在采集品牌ID为".$nid."的车系和厂商";
            echo "<script>location.href='".base_url('stepone')."/id\/".$nid."'</script>";
		}else{
			redirect(base_url('steptwo'));
		}
	}


	public function steptwo($bid = ''){
		$ret = $this->db->from('carseries')->order_by('id asc')->limit(0,1)->get();
		$rid = $ret->row_array()['id'];
		$id = !empty($bid) ? $bid : $rid;
		$this->getCarspec($id);
		$result = $this->db->from('carseries')->where('id >',$id)->order_by('id asc')->limit(0,1)->get();
		if($nid = $result->row_array()['id']){//判断采集未完成
            echo "正在采集车系ID为".$nid."的车型";
            echo "<script>location.href='".base_url('steptwo')."/id\/".$nid."'</script>";
		}else{
			redirect(base_url('steptree'));
		}
	}

	public function steptree($bid = ''){
		$ret = $this->db->from('carspec')->order_by('id asc')->limit(0,1)->get();
		$rid = $ret->row_array()['id'];
		$id = !empty($bid) ? $bid : $rid;
		$this->getParameter($id);
		$result = $this->db->from('carspec')->where('id >',$id)->order_by('id asc')->limit(0,1)->get();
		if($nid = $result->row_array()['id']){//判断采集未完成
            echo "正在采集车系ID为".$nid."的车型";
            echo "<script>location.href='".base_url('steptree')."/id\/".$nid."'</script>";
		}else{
			echo "车型参数采集完成";
		}
	}

	/**
	 * 采集车商和车系
	 */
	public function vendors_carseries($bid){
		$vcStr = 'http://hao.autohome.com.cn/Handler/SelectBrand.ashx?type=2&brandid='.$bid;
		$content = file_get_contents($vcStr);
		$str=iconv("GBK", "UTF-8", $content);
		$arr = json_decode($str);
  		$new_arr = array();
  		$factoryId ="";
  		$n = 0;
  		$s = 0;
        foreach ($arr as $j => $i) {
        	if($i->factoryId!=$factoryId){
        		$name = $i->factoryname;
        		$new_arr[$s]['name'] = $name;
        		$new_arr[$s]['factoryId'] = $i->factoryId;
        		$s++;
        		$n = 0;
        	}
        	unset($i->factoryname);
    		$new_arr[$s-1]['list'][$n] = $i;
        	$n++;
        }

        foreach ($new_arr as $k => $v) {
        	$dataArr = array(
                'id'=>$v['factoryId'],
                'vendor_name'=>$v['name'],
            );
        	$ret  = $this->db->get_where('vendors', array('id'=>$v['factoryId']));
        	if(!$ret->row_array()){//厂商如果不存在就插入
            	$this->db->insert('vendors', $dataArr);
        	}
        	foreach ($v['list'] as $list_k => $list_v) {
        		$carseriesArr = array(
        			'id'=>$list_v->seriesId,
        			'name'=>$list_v->seriesname,
        			'brand_id'=>$bid,
        			'vendor_id'=>$list_v->factoryId
        		);
        		$re  = $this->db->get_where('carseries', array('id'=>$list_v->seriesId));
        		if(!$re->row_array()){//车系如果不存在就插入
        			$this->db->insert('carseries', $carseriesArr);
        		}
        	}
        }
        echo "品牌ID为".$bid."的厂商和车系采集完毕"."<br>";

	}

	/**
	 * 获取车型
	*/
	public function getCarspec($sid){
		$str = 'http://i.che168.com/Handler/SaleCar/ScriptCarList_V1.ashx?seriesGroupType=2&needData=3&seriesid='.$sid;
		$data = file_get_contents($str);
		$data = iconv("GBK", "UTF-8", $data);
   		$data = str_replace("spec","\"spec\"",$data);
    	$carModel = json_decode($data);
        foreach ($carModel as $carModel_k => $carModel_v) {
            foreach ($carModel_v->spec as $spec_k => $spec_v) {
                $carModel_data = array(
                    'id' => $spec_v->id,
                    'name' => $spec_v->name,
                    'year' => str_replace("款","",$carModel_v->year),//汉字替换为空
                    'carseries_id' => $sid
                );
                $re = $this->db->get_where('carspec', array('id'=>$spec_v->id));
                if(!$re->row_array()){
                	$this->db->insert('carspec', $carModel_data);
                }
            }
        }
        echo "车系ID为".$sid."的车型采集完毕"."<br>";
	}

	/**
	 * 获取车型参数
	 */
	public function getParameter($cid){
		$strOne = "http://www.interface.che168.com/CarProduct/GetParam.ashx?specid=".$cid."&_callback=param";
		$strTwo = "http://www.interface.che168.com/CarProduct/GetConfig.ashx?specid=".$cid."&_callback=config";
		$dataOne = file_get_contents($strOne);
		$dataOne = iconv("GBK", "UTF-8", $dataOne);
		$dataTwo = file_get_contents($strTwo);
		$dataTwo = iconv("GBK", "UTF-8", $dataTwo);
		$json_one = substr($dataOne,6,-1);
		$json_two = substr($dataTwo,7,-1);
		$arr_one = json_decode($json_one,true);
		$arr_two = json_decode($json_two,true);

		$arrA = $arr_one['result']['paramtypeitems'];
		$arrB = $arr_two['result']['configtypeitems'];
		foreach ($arrB as $key => $value) {
			$arrB[$key]['paramitems'] = $value['configitems'];
			unset($arrB[$key]['configitems']);
		}
		$arr = array_merge($arrA, $arrB);
		
		foreach ($arr as $k => $v) {
			$parArr = array(
				'name' => $v['name'],
				'carspec_id' => $cid,
				'pid'=>0
			);
			
			$re = $this->db->get_where('parameter', array('carspec_id'=>$cid,'name'=>$v['name']));
            if(!$re->row_array()){
				$this->db->insert('parameter', $parArr);
				$pid = $this->db->insert_id();
				foreach ($v['paramitems'] as $par_k => $par_v) {
					$childArr = array(
						'name' => $par_v['name'],
						'carspec_id' => $cid,
						'pid'=>$pid,
						'value'=>$par_v['value']
					);
					$this->db->insert('parameter', $childArr);
				}
            }

		}
		echo "车型ID为".$cid."的车型参数采集完毕"."<br>";
	}


}
