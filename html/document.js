$(document).ready(function(argument) {
      addPlay();
      console.log('--------');
      playVideoFunc();
    function playVideoFunc() {
      $("#videoImg1").click(function(){
        document.getElementById('myVideo').play(); // 播放
      });
    }
});




function requestFullScreen(){
    document.getElementById('myVideo').play(); // 播放
    document.getElementById('myVideo').pause(); // 暂停
    console.log('---------------');
}

//document.getElementById('myVideo').webkitRequestFullscreen();
//// backAudio.get(0).pause();
/////launchFullScreen(document.documentElement); // the whole page
    //launchFullScreen(document.getElementById('myVideo')); // any individual element
    //console.log('--------requestFullScreen');
    // var myPlayer = document.getElementById('myVideo');
    // myPlayer.webkitRequestFullscreen();

function addPlay(){
    $("#playButton").click(function(){
        console.log('--------全屏播放');
       requestFullScreen();
       });
}


// function launchFullScreen(element) {  
//       if (element.requestFullScreen) {
//         element.requestFullScreen();
//     } else if (element.mozRequestFullScreen) {
//         element.mozRequestFullScreen();
//     } else if (element.webkitRequestFullScreen) {
//         element.webkitRequestFullScreen();
//     }
//     else if (element.msRequestFullscreen) {
//         element.msRequestFullscreen();
//     } else if (element.webkitRequestFullscreen) {
//         element.webkitRequestFullscreen();
//     } else {

//         alert("no cai en ningun lado");
//         element.webkitRequestFullscreen();
//     }
// }

//function launchFullScreenone(element) {
    //此方法不可以在異步任務中執行，否則火狐無法全屏
    // if(element.requestFullscreen) {
    //     element.requestFullscreen();
    // } else if(element.mozRequestFullScreen) {
    //     element.mozRequestFullScreen();
    // } else if(element.msRequestFullscreen){
    //     element.msRequestFullscreen();
    // } else if(element.oRequestFullscreen){
    //     element.oRequestFullscreen();
    // }
    // else if(element.webkitRequestFullscreen)
    // {
    //     element.webkitRequestFullScreen();
    // }else{
        
        // var videobox  = element;
        // var  cssText = 'width:640px;height:320px;overflow:hidden;';
        /*
        -webkit-transform-origin: center bottom;
transform-origin: center bottom
         */
       // videobox.style.cssText = cssText+';'+'-webkit-transform-origin: center top;transform-origin: center top;transform: rotate(90deg);margin:0px;padding:0px;left:0;right:0;';
        //console.log('-----');
    // }
//}


