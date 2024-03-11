var isLogged=false;

function validate() {
  var dificuldade = document.getElementById('dificuldade');
  var start = document.getElementById('start');
    if (document.getElementById('sim').checked) {
      dificuldade.hidden=false;
      start.hidden =false;
      document.getElementById('nao').checked=false;
    }
    else{
      dificuldade.hidden=true;
      start.hidden =true;
    }
}

function validate_nao(){
  var dificuldade = document.getElementById('dificuldade');
  var start = document.getElementById('start');

  if (document.getElementById('nao').checked){
      dificuldade.hidden=true;
      start.hidden =false;
      document.getElementById('sim').checked=false;
    }
    else{
      start.hidden =true;
    }
}

function hide_div(){
    if(document.getElementById("cavidades").value == "" || document.getElementById("sementes").value==""){
      alert("Preencha todos os dados de jogo antes de comeÃ§ar");
    }
    else{
      var start_div = document.getElementById("start_div");
      start_div.hidden=true;
      var login=document.getElementById("login");
      login.hidden=true;
      var first = document.getElementById("first");
      var second = document.getElementById("second");
      var third = document.getElementById("third");
      var start = document.getElementById("start");
      start.hidden=true;
      first.hidden=false;
      second.hidden=false;
      third.hidden=false;
      document.getElementById("p1").hidden=false;
      document.getElementById("give_up").hidden=false;
      document.getElementById("classifica").hidden=true;
    }
}

function table_add(username,rows){
  var table = document.getElementById("classifica");
  var row = table.insertRow(rows);
  var cell1 = row.insertCell(0);
  var cell2 = row.insertCell(1);
  var cur_wins = 0;

  if(username==""){
    cell1.innerHTML = "guest";
  }
  else{
    cell1.innerHTML = username;
  }

  if(rows>4){
    cur_wins = parseInt(table.rows[rows].cells[1].innerHTML);
    cur_wins++;
    cell2.innerHTML = cur_wins;
  }
  else{
    cell2.innerHTML = "1";
  }

}

function show_div(){
  var start_div = document.getElementById("start_div");
  start_div.hidden=false;
  var login=document.getElementById("login");
  login.hidden=false;
  var start = document.getElementById("start");
  start.hidden=false;
  var classifica = document.getElementById("classifica");
  classifica.hidden=false;
  var cavidades = document.getElementById("cavidades");
  var sementes = document.getElementById("sementes");
  var sim = document.getElementById("sim");
  var nao = document.getElementById("nao");
  cavidades.value = null;
  sementes.value=null;
  sim.checked = false;
  nao.checked = false;
}

function hide_board(){
  var first = document.getElementById("first");
  var second = document.getElementById("second");
  var third = document.getElementById("third");
  var start = document.getElementById("start");
  var p1= document.getElementById("p1");
  var p2= document.getElementById("p2");
  var give_up=document.getElementById("give_up");
  var bot = document.getElementById("bot");
  start.hidden=true;
  first.hidden=true;
  second.hidden=true;
  third.hidden=true;
  p1.hidden=true;
  p2.hidden=true;
  bot.hidden=true;
  give_up.hidden=true;
  var remove_circles=document.getElementById("first");
  while ( remove_circles.firstChild ) {
    remove_circles.removeChild( remove_circles.firstChild );
  }
  var remove_circ2 =document.getElementById("second");
  var remove_circ3 = document.getElementById("third");
  while ( remove_circ2.firstChild ) {
    remove_circ2.removeChild( remove_circ2.firstChild );
  }
  while ( remove_circ3.firstChild ) {
    remove_circ3.removeChild( remove_circ3.firstChild );
  }
}

function hidelogin(){
  var login=document.getElementById("login");
  var username=document.getElementById("username");
  var password=document.getElementById("password");
  if(username.value=="" || password.value==""){
    alert("Preencha os dados de login");
  }
  else{
    login.hidden=true;
  }
}

function createboard(){
  var n_cavs=document.getElementById("cavidades").value;
  var n_seeds=document.getElementById("sementes").value;
  var midPanel = document.getElementById("second");
  var matrix = creatematrix(n_cavs,n_seeds);
  var matrix_temp = creatematrix(n_cavs,n_seeds);

  for(let i=0;i<n_cavs;i++){
  let newColumn = createNewColumn(i,matrix,matrix_temp,n_cavs,n_seeds);
   newColumn.id="column_"+i;
   midPanel.appendChild(newColumn);
 }

}

function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}

function simulate_clicks(matrix){
  var cur_max=0;
  var max_col=0;
  var n_cavs = document.getElementById("cavidades").value;
  for(let i=0;i<n_cavs;i++){
    if (matrix[1][i] > cur_max){
      cur_max = matrix[1][i];
      max_col=i;
    }
  }
  sleep(2000).then(() => {
    p1.hidden=true;
    document.getElementById("player2_" + max_col).click();
});
}

function createNewColumn(index, matrix,matrix_temp,n_cavs,n_seeds){
  let holder_div = document.createElement("div");
  holder_div.className = "column";
  holder_div.id="holder" + index;
  let cavidade1 = document.createElement("div");
  cavidade1.className = "cavidade";
  cavidade1.id = "player1_" + index;
  let cavidade2 = document.createElement("div");
  cavidade2.className = "cavidade";
  cavidade2.id = "player2_" + index;
  cavidade1.innerHTML
  holder_div.appendChild(cavidade1);
  holder_div.appendChild(cavidade2);

  for(let j=0;j<n_seeds;j++){
    var circle = document.createElement('span');
    circle.className= "dot";
    cavidade1.appendChild(circle);
  }

  for(let j=0;j<n_seeds;j++){
    var circle = document.createElement('span');
    circle.className= "dot";
    cavidade2.appendChild(circle);
  }

  cavidade1.addEventListener('click', function (event) {
    var p1 = document.getElementById("p1");
    var p2 = document.getElementById("p2");
    var bot=document.getElementById("bot");
    var clear_row;
    if(p1.hidden == false || document.getElementById("sim").checked){
      matrix_temp = refresh_matrix(matrix_temp,cavidade1.id,0);
      console.log("bvb");
      circles_fill(n_cavs,cavidade2.id,matrix_temp);
      if(check_over(matrix_temp,n_cavs)){
        find_winner(matrix_temp,n_cavs);
        var first = document.getElementById("first").childElementCount;
        var third = document.getElementById("third").childElementCount;
        var table = document.getElementById("classifica");
        var rows = table.rows.length;
        var username=document.getElementById("username").value;
        if(document.getElementById("sim").checked && first > third) {
          table_add(username,rows);
          alert("Ganhou ao bot!")
        }
        else {
          if(document.getElementById("sim").checked && first < third) alert("Perdeu para o bot!");
          else if(document.getElementById("sim").checked && first == third) alert("Empatou com o bot!");
        }
        if(document.getElementById("sim").checked==false){
          if(first>third) alert("Player1 vence com "+first +" sementes");
          else if(third>first) alert("Player2 vence com "+second +" sementes");
          if(first == third) alert("Os jogadores emapataram com " + first + " sementes cada um!");
        }
        hide_board();
        show_div();
      }
    }
    else alert("Jogue na sua área de jogo");

  });

  cavidade2.addEventListener('click', function (event) {
    var p1 = document.getElementById("p1");
    var p2 = document.getElementById("p2");
    var bot=document.getElementById("bot");
    if(document.getElementById("sim").checked == false || bot.hidden==false){
      if(p2.hidden==false || bot.hidden==false){
        console.log("aaa");
        matrix_temp = refresh_matrix(matrix_temp,cavidade2.id,1);
        circles_fill(n_cavs,cavidade2.id,matrix_temp);
        if(check_over(matrix_temp,n_cavs)) {
          find_winner(matrix_temp,n_cavs);
          var first = document.getElementById("first").childElementCount;
          var third = document.getElementById("third").childElementCount;
          var table = document.getElementById("classifica");
          var rows = table.rows.length;
          var username=document.getElementById("username").value;
          if(first>third) alert("Player1 vence com "+first +" sementes");
          else if(third>first) alert("Player2 vence com "+second +" sementes");
          if(first == third) alert("Os jogadores emapataram com " + first + " sementes cada um!");
          hide_board();
          table_add(username,rows);
          show_div();
        }
      }
      else if (document.getElementById("sim").checked == false){
        alert("Jogue na sua área de jogo");
      }
  }
  else{
    alert("Jogue na sua área de jogo");
  }
  });

  return holder_div;
}

function creatematrix(n_cavs,n_seeds){
  var matrix = [];

  for (let i = 0; i < 2; i++) {
    matrix[i] = [];
    for (let j = 0; j < n_cavs; j++) {
      matrix[i][j] = n_seeds;
    }
  }

  return matrix;
}

function refresh_matrix(matrix,cavidade,row){
  var n_cavs = document.getElementById("cavidades").value;
  var cavidade=parseInt(cavidade.substr(8),10);
  var seed_spread=matrix[row][cavidade];
  matrix[row][cavidade]=0;
  var p1 = document.getElementById("p1");
  var p2 = document.getElementById("p2");
  var ball_addedp1=0;
  var ball_addedp2=0;
  var row_change1=0;
  var row_change2=0;
  var counter1=0;
  var counter2=0;
  var just_added1=0;
  var just_added2=0;
  var flagp1=0;
  var flagp2=0;

  for(let i=0;i<seed_spread;i++){
    if(row==1){
      if(matrix[row][cavidade+1]!=null) {
        matrix[row][cavidade+1]++;
        cavidade++;
      }
      else {
        if(flagp2==0){
          deposit_adder("third");
          flagp2=1;
          ball_addedp2++;
          flagp1=1;
        }
        else{
          matrix[row-1][cavidade]++;
          row--;
          row_change2++;
          flagp2=0;
        }
      }
    }
    else{
      if(matrix[row][cavidade-1]!=null) {
        matrix[row][cavidade-1]++;
        cavidade--;
      }
      else {
        if(flagp1==0){
          deposit_adder("first");
          flagp1=1;
          ball_addedp1++;
          flagp2=1;
        }
        else{
          matrix[row+1][cavidade]++;
          row++;
          row_change1++;
          flagp1=0;
        }
      }
    }
  }
    var counter=0;

    if(p1.hidden==false){
      if(row==0){
        if(matrix[row][cavidade]==1 && ball_addedp1==0){
          if(matrix[row+1][cavidade]!=0){
            var remove_circles=document.getElementById("player2_"+cavidade);
            while ( remove_circles.firstChild ) {
              remove_circles.removeChild( remove_circles.firstChild );
              matrix[1][cavidade]=0;
              counter++;
            }
            for(let f=0;f<counter;f++){
              var circle = document.createElement('span');
              circle.className= "dot";
              document.getElementById("first").appendChild(circle);
            }
            counter=0;
          }
        }
      }
    }
    else{
      if(row==1){
        if(matrix[row][cavidade]==1 && ball_addedp2==0){
          if(matrix[row-1][cavidade]!=0){
            var remove_circles=document.getElementById("player1_"+cavidade);
            while ( remove_circles.firstChild ) {
              remove_circles.removeChild( remove_circles.firstChild );
              matrix[0][cavidade]=0;
              counter++;
            }
            for(let f=0;f<counter;f++){
              var circle = document.createElement('span');
              circle.className= "dot";
              document.getElementById("third").appendChild(circle);
            }
            counter=0;
          }
        }
      }

    }

    var bot = document.getElementById("bot");
    var sim = document.getElementById("sim");
    if(sim.checked==false){
      if(p1.hidden==false){
        if((row_change1==row_change2) && (ball_addedp1==row_change1+1) ){
          p2.hidden=true;
          p1.hidden=false;
        }
        else{
          p1.hidden=true;
          p2.hidden=false;
        }
      }
      else{
        if((row_change1==row_change2) && (ball_addedp2==row_change2+1) ){
          p2.hidden=false;
          p1.hidden=true;
        }
        else{
          p1.hidden=false;
          p2.hidden=true;
        }
      }
  }
  else{
    if(p1.hidden==false){
      if((row_change1==row_change2) && (ball_addedp1==row_change1+1)){
        bot.hidden=true;
        p1.hidden=false;
      }
      else{
        p1.hidden=true;
        bot.hidden=false;
        simulate_clicks(matrix);
      }
    }
    else{
      if((row_change1==row_change2) && (ball_addedp2==row_change2+1) ){
        bot.hidden=false;
        simulate_clicks(matrix);
        p1.hidden=true;
      }
      else{
        p1.hidden=false;
        bot.hidden=true;
      }
    }
  }

    return matrix;
}

function check_over(matrix,n_cavs){
  var counter=0;
  for (let i = 0; i < 2; i++) {
    for (let j = 0; j < n_cavs; j++) {
      if(matrix[i][j]==0) counter++;
      if(j==(n_cavs-1) && counter==(n_cavs)){
        return true;
      }
      if(j==(n_cavs-1)) counter=0;
    }
  }

  return false;
}

function find_winner(matrix,n_cavs){
  var counter=0;
  var board_clear;
  var seeds_adder=0;

  for (let i = 0; i < 2; i++) {
    for (let j = 0; j < n_cavs; j++) {
      if(matrix[i][j]==0) counter++;
      if(j==(n_cavs-1) && counter==(n_cavs)){
        board_clear=i;
        break;
      }
      if(j==(n_cavs-1)) counter=0;
    }
  }

  if(board_clear==0){
    for(let i=0;i<n_cavs;i++){
      seeds_adder = seeds_adder + matrix[1][i];
      var remove_circles=document.getElementById("player2_"+i);
      while ( remove_circles.firstChild ) {
        remove_circles.removeChild( remove_circles.firstChild );
      }
    }
    for(let i=0;i<seeds_adder;i++){
      var circle = document.createElement('span');
      circle.className= "dot";
      document.getElementById("third").appendChild(circle);
    }
  }

  if(board_clear==1){
    for(let i=0;i<n_cavs;i++){
      seeds_adder = seeds_adder + matrix[0][i];
      var remove_circles=document.getElementById("player1_"+i);
      while ( remove_circles.firstChild ) {
        remove_circles.removeChild( remove_circles.firstChild );
      }
    }
    for(let i=0;i<seeds_adder;i++){
      var circle = document.createElement('span');
      circle.className= "dot";
      document.getElementById("first").appendChild(circle);
    }
  }
}

function deposit_adder(deposit){
  var circle = document.createElement('span');
  circle.className= "dot";
  document.getElementById(deposit).appendChild(circle);

}

function circles_fill(n_cavs,cavidade,matrix_temp){
  var cavidade=parseInt(cavidade.substr(8),10);
  var cur_circles;

  for(let i=0;i<2;i++){
    for(let j=0;j<n_cavs;j++){
      cur_circles=matrix_temp[i][j];
      var remove_circles=document.getElementById("player"+(i+1)+"_"+j);
      while ( remove_circles.firstChild ) remove_circles.removeChild( remove_circles.firstChild );
      for(let k=0;k<cur_circles;k++){
        var circle = document.createElement('span');
        circle.className= "dot";
        document.getElementById("player"+(i+1)+"_"+j).appendChild(circle);
      }
    }
  }
}
