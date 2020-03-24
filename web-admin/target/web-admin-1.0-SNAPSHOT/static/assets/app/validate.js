var Validate = function () {
    var handlerInitValidate = function () {
        console.log("初始化 jQuery validation");
/*        $.validator.addMethod("mobile", function(value,element) {
            var length = value.length;
            var mobile=/"zhengze/;
            return this.option(element)||(length==11 && mobile.test(value));
        },"手机号码格式错误");*/

        $("#inputForm").validate({
            errorElement:'span',
            errorClass:'help-block',

            errorPlacement: function(error,element){
            element.attr("class","form-control required help-block is-invalid");
            error.insertAfter(element);
            }
        });
    };

    return {
        init:function () {
            handlerInitValidate();
        }
    }

}();

$(document).ready(function () {
    Validate.init();
});