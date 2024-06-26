
    function bajar(){
        var sc=Math.max(document.body.scrollTop);
        if(sc>70){
            document.getElementById('menu').style.position="fixed";
            document.getElementById('menu').style.marginTop="-35px";
            document.getElementById("legendObligatorio").style.display="none";
            document.getElementById("logoUnefa").style.marginTop="0px";
        }else{
            document.getElementById('menu').style.position="relative";
            document.getElementById('menu').style.marginTop="0px";
            document.getElementById('menu').style.marginLeft="0px";
            document.getElementById("legendObligatorio").style.display="block";
            document.getElementById("logoUnefa").style.marginTop="-35px";
        }

    }