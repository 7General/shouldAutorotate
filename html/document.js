$(document).ready(function(argument) {
	
    // var elem=document.body;
    // var resoult = fullscreen(elem);
    // console.log("--------"+resoult);
    checkVideoState();
    addPlay();
    
});

function addPlay(){
    $("#playButton").click(function(){
        
        // $('#myVideo').css('height','800px');
        document.getElementById('myVideo').play(); // 播放
    });
    
    
}

function checkVideoState() {
    var video = document.getElementById('myVideo');
    video.addEventListener("click" , function(){
       // alert("-------------------");
       catchPoint();
    });
}

//  获取坐标点
function catchPoint() {
    $('#myVideo').mousemove(function(){
        var x=event.offsetX;
        var y=event.offsetY;
        console.log("-----X"+x+">>>>>>>pageY:"+y);
    });
}


// function fullscreen(elem) {
//     var prefix = 'webkit';
//     if (elem[prefix + 'EnterFullScreen']) {
//         return prefix + 'EnterFullScreen';
//     } else if (elem[prefix + 'RequestFullScreen']) {
//         return prefix + 'RequestFullScreen';
//     };
//     return false;
// };



function checkState (){
	document.addEventListener("fullscreenchange", function(){

	fullscreenState.innerHTML = (document.fullscreen)? "" : "not ";}, false);

	document.addEventListener("mozfullscreenchange", function () {

	fullscreenState.innerHTML = (document.mozFullScreen)? "" : "not ";}, false);

	document.addEventListener("webkitfullscreenchange", function () {

	fullscreenState.innerHTML = (document.webkitIsFullScreen)? "" : "not ";}, false);

	document.addEventListener("msfullscreenchange", function () {

	fullscreenState.innerHTML = (document.msFullscreenElement)? "" : "not ";}, false);
}




function fullscreenState(){
	var elem=document.body;  
    if(elem.webkitRequestFullScreen){  
        elem.webkitRequestFullScreen();
        console.log("1");     
    }else if(elem.mozRequestFullScreen){  
        elem.mozRequestFullScreen();  
        console.log("2");
    }else if(elem.requestFullScreen){  
        elem.requestFullscreen();  
        console.log("3");
    }else{  
        //浏览器不支持全屏API或已被禁用  
        console.log("4-------------");
    } 
}


function  exitFullscreenState(){
	var elem=document;  
    if(elem.webkitCancelFullScreen){  
        elem.webkitCancelFullScreen(); 
        console.log("1");     
    }else if(elem.mozCancelFullScreen){  
        elem.mozCancelFullScreen();  
        console.log("2");
    }else if(elem.cancelFullScreen){  
        elem.cancelFullScreen();  
        console.log("3");
    }else if(elem.exitFullscreen){  
        elem.exitFullscreen();  
        console.log("4");
    }else{  
        //浏览器不支持全屏API或已被禁用  
        console.log("5==========================");
    } 
}
 