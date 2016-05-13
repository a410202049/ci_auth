function Upload(url,btnId){
	this.btnId=btnId;
	this.url=url;
	this.init=function(btnId){
        var uploadOption =
        {
            // 提交目标
            action: this.url,
            // 服务端接收的名称
            name: "file",
            // 自动提交
            autoSubmit: true,
            // 选择文件之后…
            onChange: function (file, extension) {
                if (!new RegExp(/(jpg)|(jpeg)|(bmp)|(gif)|(png)/i).test(extension)) {
                    layer.msg('只限上传图片文件，请重新选择！',{icon: 2});
                    return false;
                }
            },
            // 开始上传文件
            onSubmit: function (file, extension) {
                $("#"+btnId).html("上传中...");
            },
            // 上传完成之后
            onComplete: function (file, response) {
            	response = JSON.parse(response);
                if (response.status == "success")
            	{
 
                    str ='<li><div class="file_bar"><p class="file_name">'+response.data.file_name+'</p><span title="删除" data-index="0" class="file_del"></span></div>';
                    str+='<img src="/public/uploads/'+response.data.file_name+'"><input type="hidden" name="imagesList[]" value="'+response.data.file_name+'"></li>';
                 	$('.imgListUp').append(str);
                 	$("#"+btnId).html("选择图片");
            	}
                else{
                    layer.msg(response.message,{icon: 2});
                	$("#"+btnId).html('选择图片');
                } 
                	
            }
        }
		// 初始化图片上传框
		var oAjaxUpload = new AjaxUpload('#'+this.btnId, uploadOption);

		$(document).on("click",'.file_del',function(){
				$(this).parents('li').remove();
		});


        var ulStr = '<ul class="imgListUp"></ul>';
        if(!$(".imgListUp").length > 0){
            $("#"+this.btnId).before(ulStr);
        }
	}
	this.init(btnId);
}
