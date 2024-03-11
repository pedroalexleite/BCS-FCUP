var isLogged=false;
var game_hash;

function isObjectEmpty(obj){
    for(const i in obj) return false;
    return true;
}

function register(nick, pass){
    var username1=nick;
    var password1 =pass;

    let data = {'nick': username1, 'password': password1};
    sendRequest(data, "register");
}

function preRegister(data){
    console.log(data);
    if(isObjectEmpty(data)){
      console.log("Login certo");
    }
    else{
      alert("Os dados inseridos não estão corretos");
    }
}

function join(group,nick,pass,size,initial){
    let data = {'group':group,'nick': nick, 'password': pass, 'size':size, 'initial':initial};
    console.log("join sent data  " + data);
    add_event();
    sendRequest(data, "join");
}

function preJoin(data){
    console.log("PRE JOIN");
    console.log(data);
    if(data.error == "Invalid game reference") alert("Erro a juntar-se a um jogo");
    else{
        console.log(data);
        game_hash = data.game;
    }
}

function leave(game,nick,pass){
    game = game_hash;
    let data = {'nick': nick, 'password': pass, 'game':game};
    sendRequest(data,"leave");
}

function preLeave(data){
    console.log("PRE LEAVE");
    console.log(data);
    if (isObjectEmpty(data)) alert("Saiu da sala")
    else{
        alert("Erro");
    }
}

function notify(nick,pass,game,move){
    console.log("Entered notify");

    let data = {'nick':nick,'password': pass, 'game': game, 'move':move};
    console.log(data);
    sendRequest(data,"notify");
}

function preNotify(data){
    console.log("PRE NOTIFY");
    console.log(data);
    if(isObjectEmpty(data)){
      console.log("Jogada valida");
    }
    else{
      switch(data.error){
        case "Not your turn to play":
          alert("Not your turn to play!");
          break;
        case "invalid move":
          alert("Invalid move");
          break;
        default:
          alert("Unknown Error");
      }
    }
}

function add_event(){

    const cavs = document.getElementById("cavidades").value;

    for(let i=0;i<cavs;i++){
        let p1_cav = document.getElementById("player1_" + i);
        p1_cav.addEventListener('click', function (event) {
            notify(document.getElementById("username").value, document.getElementById("password").value,game_hash,i);
        });
    }

    for(let i=0;i<cavs;i++){
        let p2_cav = document.getElementById("player2_" + i);
        p2_cav.addEventListener('click', function (event) {
            notify(document.getElementById("username").value, document.getElementById("password").value,game_hash,i);
        });
    }

}

function update(game, nick){
  console.log("Entered update");
  let data = {'game': game, 'nick':nick};
  console.log(data);
  sendRequest(data,"update");
}

function preUpdate(data){
  var eventSource = new EventSource('http://twserver.alunos.dcc.fc.up.pt:8008/update?nick='+encodeURIComponent(gNickname)+'&game='+encodeURIComponent(gameHash));
  eventSource.onmessage = function(event){
    const data = JSON.parse(event.data);
    var first = document.getElementById(first);
    var third = document.getElementById(third);
  }
  eventSource.close();
}

function sendRequest(obj,command){
    const xhr = new XMLHttpRequest();
    let server = "twserver.alunos.dcc.fc.up.pt"
    console.log(obj);
    console.log(command);
    xhr.open('POST','http://'+server+':'+8008+'/'+command,true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState < 4) return;
        let data=JSON.parse(xhr.responseText);
        switch (command) {
            case "join":
                preJoin(data);
                break;
            case "leave":
                console.log("aaaa");
                preLeave(data);
                break;
            case "notify":
                preNotify(data);
                break;
            case "ranking":
                preRanking(data);
                break;
            case "register":
                preRegister(data);
                break;
            case "update":
                preUpdate(data);
                break;
        }
    }
    xhr.send(JSON.stringify(obj));
}
