import 'dart:html';
import 'package:pixi/pixi.dart';

class testApplication {

  var renderer = new CanvasRenderer(width: 800, height: 600);
  var stage = new Stage(new Colour.fromHtml('#6f9'));
  var tex = new Sprite.fromImage('res/texture.png');
  int i = 0;

  testApplication(){

    document.getElementById("viewContainer").append(this.renderer.view);

    this.tex.anchor = new Point(0.5, 0.5);
    this.tex.position = new Point(300,300);
    this.tex.visible = true;

    querySelector("#text").text = "This Should change";

    tex.onMouseDown.listen((e)	{ tex.alpha = 0.9; tex.dragging = true; });
    tex.onTouchStart.listen((e)	{ tex.alpha = 0.9; tex.dragging = true; });
    tex.onMouseUp.listen((e) 		{ tex.alpha = 1.0; tex.dragging = false; });
    tex.onTouchEnd.listen((e) 	{ tex.alpha = 1.0; tex.dragging = false; });
    tex.onMouseMove.listen((e)	{ if (tex.dragging) tex.position = new Point(e.x, e.y); });
    tex.onTouchMove.listen((e)	{ if (tex.dragging) tex.position = new Point(e.x, e.y); });


    this.stage.children.add(this.tex);


    window.requestAnimationFrame(this._animate);

  }

  void changeText(){
    i++;
    querySelector("#text").text = "This has changed! Iteration ("+i.toString()+")";

  }

  void _animate(var num)
  {


    window.requestAnimationFrame(this._animate);
    this.renderer.render(this.stage);

  }

  void bind(){

  }
}


//entry point
void main(){
  new testApplication();
}