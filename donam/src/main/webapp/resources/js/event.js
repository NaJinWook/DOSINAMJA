/*************************배너**********************************/
var banner_list = [
  {img:"../resources/images/banner1.png"},
  {img:"../resources/images/banner2.png"}
];
var i = 0;
function BannerEvent(){
  document.getElementById("banner").src = banner_list[i].img;
  if(i == 0){
    i = 1;
  }else {
    i = 0;
  }
}
setInterval(BannerEvent, 4000);

/*************************비밀번호 체크****************************/
function pwd_check(){
  var pwd=$("#user_pwd").val();
  var pwd_check=$("#user_pwd_check").val();
  $("#pwd_check_msg").html("");
  $("#pwd_recheck_msg").html("");
  if(pwd==""){
    $("#pwd_check_msg").html("비밀번호를 입력하세요.");
  } else if(pwd.length < 4){
    $("#pwd_check_msg").html("비밀번호 최소 4글자 이상 입력하세요.");
  } else if(pwd != pwd_check && pwd_check != "" ){
    $("#pwd_recheck_msg").html("비밀번호가 일치하지 않습니다.");
  } else if(pwd == pwd_check || pwd_check == "") {
    $("#pwd_check_msg").html("");
    $("#pwd_recheck_msg").html("");
  }
}