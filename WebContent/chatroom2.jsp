<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
body, ul, li {
    margin:0;
    padding:0;
    list-style:none;
    font-family: inherit;
}

/* ���̺귯�� */
.con {
    max-width:1000px;
    margin:0 auto;
}

/* Ŀ���� */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

body {
    font-family: 'Noto Sans KR', sans-serif;
    overflow-y:hidden;
}

body, html {
    height:100%;
}

#chat-room {
    height:100%;
    background-color:#6884b3;
    /* �ӽ� */
    outline:2px solid black;
    position:relative;
}

#chat-room .message-box {
    padding:0 0.7rem;
   /*  overflow-y:auto; */
    height:calc(100% - 10rem);
}

#chat-room .message-group::before {
    content:attr(data-date-str);
    display:block;
    background-color:rgba(0,0,0,0.15);
    border-radius:1rem;
    text-align:center;
    padding:0.3rem 0;
    color:white;
    font-size:1.6rem;
}

#chat-room .chat-message {
    margin-left:3rem;
    position:relative;
}

#chat-room .chat-message > section {
    position:absolute;
    top:0;
    left:-3rem;
}

#chat-room .chat-message > span {
    display:block;
}

#chat-room .chat-message > section {
    font-size:3rem;
}

#chat-room .chat-message::after {
    content:"";
    display:block;
    clear:both;
}

#chat-room .chat-message > div {
    background-color:white;
    float:left;
    padding:0.8rem;
    border-radius:1rem;
    clear:both;
    font-weight:bold;
    font-size:1.46rem;
    box-shadow: 1px 1px 0 rgba(0,0,0,0.3);
}

#chat-room .chat-message.mine > div {
    background-color:#FDF01B;
    float:right;
    box-shadow: -1px 1px 0 rgba(0,0,0,0.3);
}

#chat-room .chat-message.mine > span {
    display:none;
}

#chat-room .chat-message.mine > section {
    display:none;
}

#chat-room .input-box {
    position:absolute;
    bottom:0;
    left:0;
    width:100%;
    background-color:white;
}


 #text-input {
    width:86%;
    display:block;
    border:0;
    outline:none;
    padding-left:4.8rem;
    padding-top:0.1rem;
    font-size:1.4rem;
    line-height:2rem;
    font-weight:bold;
    box-sizing:border-box;
    max-height:250px;
    min-height: 100px;
}

#chat-room .input-box .btn-plus {
    position:absolute;
    top:0;
    left:0;
    width:4rem;
    height:100%;
    background-color:#D1D1D1;
}

#chat-room .input-box .btn-plus > i {
    position:absolute;
    top:50%;
    left:50%;
    transform:translateX(-50%) translateY(-45%);
    color:white;
    font-size:3rem;
}

#chat-room .input-box .btn-submit {
    position:absolute;
    right:1rem;
    top:50%;
    transform:translateY(-50%);
    padding:10px;
    background-color:#fdf01b;
    padding:10px;
    color:#bfb73d;
    border-radius:3px;
    font-size:1.3rem;
    box-shadow:0 1px 10px rgba(0,0,0,0.2);
    user-select:none;
}

#chat-room .input-box .btn-emo {
    position:absolute;
    right:6rem;
    top:50%;
    transform:translateY(-50%);
    font-size:2rem;
    color:#CBCBCB;
    user-select:none;
}
</style>
</head>
<body>

<h1 style="display:none;">�Ϸ� �䱸���� : �޼��� �ڽ��� ��ũ�ѹٴ� �Է¹ڽ� �ٷ� �������� ��ġ�ؾ� �մϴ�.</h1>
<h1 style="display:none;">���� �䱸���� : ��ũ�ѹٸ� ������ ���ּ���.</h1>



<div id="chat-room">
    <div class="message-box">
        <div class="message-group" data-date-str="2014�� 12�� 10�� �Ͽ���">
            <div class="chat-message other">
                <section><i class="fa fa-user"></i></section>
                <span>�Ƶ�</span>
                <div>�¸��!!!!</div>
            </div>
            
            <div class="chat-message mine">
                <section><i class="fa fa-user"></i></section>
                <span>ȫ�浿</span>
                <div>�������Ⱑ �ҽ��ϱ���</div>
            </div>
        </div>
        
        <div class="message-group" data-date-str="2014�� 12�� 11�� ������">
            <div class="chat-message other">
                <section><i class="fa fa-user"></i></section>
                <span>�Ƶ�</span>
                <div>�¸��!!!! �Դϴ�!</div>
            </div>
            
            <div class="chat-message mine">
                <section><i class="fa fa-user"></i></section>
                <span>ȫ�浿</span>
                <div>������ ������ ����~ ����</div>
            </div>
            
        </div>
    </div>
    <div class="input-box">
        <textarea id="text-input" onkeyup="xSize(this)"></textarea>
        <div class="btn-plus">
            <i class="fa fa-plus" aria-hidden="true"></i>
        </div>
        <div class="btn-emo">
            <i class="fa fa-smile-o" aria-hidden="true"></i>
        </div>
        <div class="btn-submit">
            <button id="btn-submit1">����</button>
        </div>
    </div>
</div>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
function xSize(e)
{
    var xe = document.getElementById('xt'),
        t;

    e.onfocus = function()
    {
        t = setInterval(
            function()
            {
                xe.value = e.value;
                e.style.height = (xe.scrollHeight + 12) + 'px';
            }, 100);
    }

    e.onblur = function()
    {
        clearInterval(t);
    }
}

xSize(document.getElementById('ta'));

var k = function() {
    // val()�� ������Ʈ�� ������ �ִ� value �Ӽ��� ���� �����´�.
    var message = $('#chat-room .input-box #text-input').val();
    
    // �޼��� ������ ����ִ� ���� ''�� ���ٸ�
    if ( message == '' ) {
        // �Լ��� �� �̻� �����Ű�� �ʰ� ���⼭ �����Ų��.
        return false;
    }
    
    var html = 
    '<div class="chat-message mine">'
        +'<section><i class="fa fa-user"></i></section>'
        +'<span>ȫ�浿</span>'
        +'<div>'+message+'</div>'
    +'</div>';
    
    $('#chat-room .message-group:last-child').append(html);
    
    // val(���ڿ�)�� ������Ʈ�� ������ �ִ� value �Ӽ��� ���� �Է¹��� ���ڿ��� ��ü�϶�� ���Դϴ�.
    $('#chat-room .input-box #text-input').val('');
};

$('#chat-room .input-box .btn-submit').click(k);

// input â���� Ű���� ���� �̺�Ʈ �߻��� �Լ��� �����ϵ��� ����
$('#chat-room .input-box #text-input').keydown(function(e) {
    // ���� �Է��� Ű�ڵ尡 13, �� ���Ͷ�� �Լ��� �����Ѵ�.
    if( e.keyCode == 13 ) {
        k();
    }
});
</script>
</body>
</html>