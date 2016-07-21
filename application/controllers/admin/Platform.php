<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Platform extends Auth_Controller {
	public function __construct(){
		parent::__construct();
	}

	public function index(){
		$this->load->view('admin/Platform/index.html');
	}
}
