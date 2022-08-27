        let id = 'asdf';

        let addZero = function(value=1){
            return value > 9 ? value : "0"+value;
        }

        let dateToString = function(ms=0) {
            let date = new Date(ms);

            let yyyy = date.getFullYear();
            let mm = addZero(date.getMonth() + 1);
            let dd = addZero(date.getDate());

            let HH = addZero(date.getHours());
            let MM = addZero(date.getMinutes());
            let ss = addZero(date.getSeconds());          

            return yyyy+"."+mm+"."+dd+ " " + HH + ":" + MM + ":" + ss;            
        }

        $(document).ready(function(){
            $("a.btn-write").click(function(e){
                let target = e.target;
                let cno = target.getAttribute("data-cno")
                let bno = target.getAttribute("data-bno")

                let repForm = $("#reply-writebox");
                repForm.appendTo($("li[data-cno="+cno+"]"));
                repForm.css("display", "block");
                repForm.attr("data-pcno", pcno);
                repForm.attr("data-bno",  bno);
            });

            $("#btn-cancel-reply").click(function(e){
                $("#reply-writebox").css("display", "none");
            });

            $("a.btn-modify").click(function(e){
                let target = e.target;
                let cno = target.getAttribute("data-cno");
                let bno = target.getAttribute("data-bno");
                let pcno = target.getAttribute("data-pcno");
                let li = $("li[data-cno="+cno+"]");
                let commenter = $(".commenter", li).first().text();
                let comment = $(".comment-content", li).first().text();

                $("#modalWin .commenter").text(commenter);
                $("#modalWin textarea").text(comment);
                $("#btn-write-modify").attr("data-cno", cno);
                $("#btn-write-modify").attr("data-pcno", pcno);
                $("#btn-write-modify").attr("data-bno", bno);

                // 팝업창을 열고 내용을 보여준다.
                $("#modalWin").css("display","block");
            });

            $("a.btn-delete").click(function(e){
                alert("delete");
            });

            $("#btn-write-modify").click(function(){
                // 1. 변경된 내용을 서버로 전송
                // 2. 모달 창을 닫는다. 
                $(".close").trigger("click");
            });

            $(".close").click(function(){
                $("#modalWin").css("display","none");
            });
        });
