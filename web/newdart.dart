import 'dart:html';
import 'package:pixi/pixi.dart';

class testApplication {

  var renderer = new CanvasRenderer(width: 800, height: 600);
  var stage = new Stage(new Colour.fromHtml('#6f9'));
  var tex = new Sprite.fromImage('res/texture.png');
  int i = 0;

  testApplication(){

    CanvasElement screenCanvas;
    CanvasRenderingContext2D screen;
    final int width = 400, height = 300;


    document.getElementById("viewContainer").append(this.renderer.view);
    querySelector("#text").text = "This Should change";

    tex
      ..anchor = new Point(0.5, 0.5)
      ..position = new Point(300,300)
      ..visible = true;

    this.stage.children.add(this.tex);


    window.requestAnimationFrame(this._animate);

  }

  void changeText(Event event){

    i++;
    querySelector("#text").text = event.toString();

  }

  void _animate(var num)
  {


    window.requestAnimationFrame(this._animate);
    this.tex.rotation += 0.1;
    this.renderer.render(this.stage);

  }

  void bind(){

  }
}


//entry point
void main(){
  new testApplication();
}