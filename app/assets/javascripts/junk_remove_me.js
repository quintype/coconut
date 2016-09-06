function replaceLoginContent() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      var member = JSON.parse(this.responseText)["member"];
      document.getElementById("replace-after-login").innerHTML = '<img src="' + member["avatar-url"]  + '" title="'+ member["name"] + '"/>';
    }
  };
  xhttp.open("GET", "/api/v1/members/me", true);
  xhttp.send();
}

qtReady.push(replaceLoginContent);
