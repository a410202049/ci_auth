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
