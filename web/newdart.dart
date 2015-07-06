import 'dart:html';
import 'package:pixi/pixi.dart';

class testApplication {

  var renderer = new CanvasRenderer(width: 800, height: 800);
  var stage = new Stage(new Colour.fromHtml('#553333'));
  var tex = new List(9);
  var holder = new DisplayObjectContainer();
  int i = 0;
  int lastFrame;
  int thisFrame;
  int timeDiff;
  double fps;

  DateTime dateTime;

  testApplication(){

    document.getElementById("audio").setAttribute("voudlme", "0.0");

    for(int j = 0; j < 9; j++){
      print(j);
      tex[j] = new Sprite.fromImage('res/texture.png');
    }


    document.getElementById("viewContainer").append(this.renderer.view);

    holder.position = new Point(400,400);

    for(int j = 0; j < 9; j++){
      tex[j].anchor = new Point(0.5,0.5);
      holder.children.add(tex[j]);
    }

    tex[0].position = new Point(0,0);
    tex[1].position = new Point(-200,-200);
    tex[2].position = new Point(-282,0);
    tex[3].position = new Point(-200,200);
    tex[4].position = new Point(0,-282);
    tex[5].position = new Point(0,282);
    tex[6].position = new Point(200,-200);
    tex[7].position = new Point(282,0);
    tex[8].position = new Point(200,200);

    for(int j = 0; j < 9; j++) {
      tex[j].anchor = new Point(0.5, 0.5);
      holder.children.add(tex[j]);
    }

    dateTime = new DateTime.now();
    stage.children.add(holder);
    lastFrame = dateTime.millisecondsSinceEpoch;
    window.requestAnimationFrame(this._animate);
  }

  void _animate(var num)
  {
    dateTime = new DateTime.now();
    window.requestAnimationFrame(this._animate);

    thisFrame = dateTime.millisecondsSinceEpoch;
    for(int j = 0; j < 9; j++){
      tex[j].rotation += 0.03;
    }
      tex[0].rotation += 0.03;

    holder.rotation -= 0.03;
    this.renderer.render(this.stage);
    timeDiff = thisFrame - lastFrame;
    lastFrame = thisFrame;
    fps = 1000/timeDiff;
    querySelector("#text").text = "Frames Per Second : " + (fps).round().toString();
  }

  void bind(){

  }
}


//entry point
void main(){
  new testApplication();
}