<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * 根据uid查询用户
 */
function getUid($uid){
  $ci = &get_instance();
  $data = $ci->db->get_where('user', array('id'=>$uid))->row_array();
  return $data;
}

/**
 * [emptyreplace 替换逗号]
 */
function emptyreplace($str) {
	$str = str_replace('　', ' ', $str); //替换全角空格为半角
	$str = str_replace(' ', ' ', $str); //替换连续的空格为一个
	$str = str_replace('，', ',', $str); //中文逗号替换英文逗号
	$noe = false; //是否遇到不是空格的字符
	for ($i=0 ; $i<strlen($str); $i++) { //遍历整个字符串
	if($noe && $str[$i]==' ') $str[$i] = ','; //如果当前这个空格之前出现了不是空格的字符
	elseif($str[$i]!=' ') $noe=true; //当前这个字符不是空格，定义下 $noe 变量
	}
	return $str;
} 