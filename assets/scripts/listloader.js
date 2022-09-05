window.onload = function(_evn) {
  fetch("/assets/projects.json")
  .then(function(data){
    data.json().then(function(projectlist) {
      console.log(projectlist);
      var finalHTML = "";
      for (var i=0;i<projectlist.length;i++) {
        finalHTML += `<a class="projectthumb" href="/code/{{link}}"><li class="project">
  <img class="projectimage" src="/assets/media/icons/{{icon}}.svg" alt="{{name}}">
  <div>
    <h2 class="projecttitle">{{name}}</h2>
    {{desc}}
  </div>
</li></a>
`
          .replace("{{icon}}", projectlist[i].icon)
          .replace("{{name}}", projectlist[i].name)
          .replace("{{name}}", projectlist[i].name)
          .replace("{{desc}}", projectlist[i].desc)
          .replace("{{link}}", projectlist[i].link);
      }
      document.getElementById("codelist").innerHTML = finalHTML;
    }, function(err) {
      console.error(err);
    });
  }, function(res) {
    console.error(res);
  });
}
