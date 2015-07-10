import 'dart:html';
import '../../packages/pixi/pixi.dart';
import 'dart:math' as Math;

class testApplication {

  var renderer = new WebGLRenderer(width: 800, height: 800, interactive:true);
  var stage = new Stage(new Colour.fromHtml('#f0f0f0'));
  var tex = new List(9);
  var holder = new DisplayObjectContainer();
  int i = 0;
  int lastFrame;
  int thisFrame;
  int timeDiff;
  double fps;

  DateTime dateTime;

  testApplication(){

    var textures = {
      "button"	: new Texture.fromImage("res/button.png"),
      "down"		: new Texture.fromImage("res/buttonDown.png"),
      "over"		: new Texture.fromImage("res/buttonOver.png")
    };

    int width = window.screen.width;
    int height = window.screen.height;

    print(height);
    if(height < width){
      width = height;
    }else{
      height = width;
    }
    double sqrt2 = 1.4142;

    var positions = {
      0         : new Point(0,0),
      1 : new Point(-width/4,-width/4),
      2 : new Point(-sqrt2*width/4,0),
      3 : new Point(-width/4,width/4),
      4 : new Point(0,-sqrt2*width/4),
      5 : new Point(0,sqrt2*width/4),
      6 : new Point(width/4,-width/4),
      7 : new Point(sqrt2*width/4,0),
      8 : new Point(width/4,width/4)
    };



    for(int j = 0; j < 9; j++){

      tex[j] = new Sprite(textures["button"]);
      tex[j].anchor = new Point(0.5,0.5);

      tex[j].onClick.listen((e) => tex[j].scale *= -1);


    }

    this.stage.onMouseUp.listen((e) {
      for (var b in this.holder) b.setTexture(b.isOver ? textures["over"] : textures["button"]);
    });

    this.stage.onTouchEnd.listen((e) {
      for (var b in this.holder) b.setTexture(textures["button"]);
    });

    renderer.resize(width, height);

    holder.position = new Point(width/2,height/2);
    for(int j = 0; j < 9; j++){
      tex[j].anchor = new Point(0.5,0.5);
      holder.children.add(tex[j]);
    }


    tex[0].position = new Point(0,0);
    tex[1].position = new Point(-width/4,-width/4);
    tex[2].position = new Point(-sqrt2*width/4,0);
    tex[3].position = new Point(-width/4,width/4);
    tex[4].position = new Point(0,-sqrt2*width/4);
    tex[5].position = new Point(0,sqrt2*width/4);
    tex[6].position = new Point(width/4,-width/4);
    tex[7].position = new Point(sqrt2*width/4,0);
    tex[8].position = new Point(width/4,width/4);

    for(int j = 0; j < 9; j++) {
      tex[j].anchor = new Point(0.5, 0.5);
      holder.children.add(tex[j]);
    }


    dateTime = new DateTime.now();
    stage.children.add(holder);



    lastFrame = dateTime.millisecondsSinceEpoch;


    document.getElementById("viewContainer").append(this.renderer.view);

    window.onResize.listen(resize);

    window.requestAnimationFrame(this._animate);
  }

  void flip(InteractionEvent event){
    querySelector("#text").text = "Yay?";
  }

  void resize(Event e){
    int width = window.innerWidth-100;
    int height = window.innerHeight-100;
    print(height);
    if(height < width){
      width = height;
    }else{
      height = width;
    }
    double sqrt2 = 1.4142;

    renderer.resize(width, height);

    holder.position = new Point(width/2,height/2);

    tex[0].position = new Point(0,0);
    tex[1].position = new Point(-width/4,-width/4);
    tex[2].position = new Point(-sqrt2*width/4,0);
    tex[3].position = new Point(-width/4,width/4);
    tex[4].position = new Point(0,-sqrt2*width/4);
    tex[5].position = new Point(0,sqrt2*width/4);
    tex[6].position = new Point(width/4,-width/4);
    tex[7].position = new Point(sqrt2*width/4,0);
    tex[8].position = new Point(width/4,width/4);


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
    querySelector("#text").text = (fps).round().toString();
  }

  void bind(){

  }


}


//entry point
void main(){
  new testApplication();
}