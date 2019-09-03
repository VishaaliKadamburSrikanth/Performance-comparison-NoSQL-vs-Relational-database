<!DOCTYPE html>
<html>
<body>
<h2>Ocean Tracking Network</h2>

<br>
<form action="welcome.jsp" method="post">
<select id="dropdown"  name ="projref">
</select>

<br>
<br>

<div>
<input type="radio" id="r1" name="db" value="mysql"> mysql
<input type="radio" id="r2" name="db" value="mongodb"> mongodb
</div>

<br>

<button> Submit </button>
</form>

<script>
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      myFunction(this);
    }
  };
  xhttp.open("GET", "dropdown.xml", true);
  xhttp.send();

function myFunction(xml) {
  var xmlDoc = xml.responseXML;     
  var x = xmlDoc.getElementsByTagName("ref");
  var option;  
  for(var i=0; i<x.length ;i++) {
	  option="<option>"+x[i].childNodes[0].textContent+"</options>";
	  document.getElementById("dropdown").innerHTML += option;
  }     
}


</script>
</body>
</html>

