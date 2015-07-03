import 'dart:html';
import 'package:pixi/pixi.dart';

class testApplication {

  var renderer = new CanvasRenderer(width: 800, height: 600);
  var stage = new Stage(new Colour.fromHtml('#6f9'));
  var tex = new Sprite.fromImage('res/texture.png');

  testApplication(){
    document.body.append(this.renderer.view);

    this.tex.anchor = new Point(0.5, 0.5);
    this.tex.position = new Point(300,300);
    this.tex.visible = true;

    querySelector("#text").text = "This Should change";

    this.tex.onMouseDown.listen((e) => querySelector("#text").text = "This has changed!");
    this.tex.onTap.listen((e) => print("Clicked button!"));

    this.stage.children.add(this.tex);

    window.requestAnimationFrame(this._animate);


  }


  void _animate(var num)
  {
    window.requestAnimationFrame(this._animate);
    this.tex.rotation += -0.1;
    this.renderer.render(this.stage);

  }

  void bind(){

  }
}


//entry point
void main(){
  new testApplication();
}