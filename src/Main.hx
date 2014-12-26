
package ;

import luxe.AppConfig;
import luxe.Game;
import luxe.Sprite;

import phoenix.Color;
import phoenix.Texture;
import phoenix.Vector;

class Main extends luxe.Game
{

    var hsp:Float;
    var total:Int;
    var twidth:Float;

    var _offset:Float;

    var circle:Texture;
    var time:Float = 0;

    override function config( config:AppConfig )
    {
        config.window.width = 700;
        config.window.height = 600;

        return config;

    } //config


    override public function ready():Void
    {
        // circle = new Texture();


        hsp = 6;
        total = 100;
        twidth = (total-1) * hsp;


        var noo:Ball;
        for(i in 0...total)
        {
            _offset = Math.abs((total/2) - i);

            noo = new Ball({
                name: 'ball${i}',
                color: new Color(0,0,0,0),
                pos: new Vector( (Luxe.screen.w - twidth)/2 + hsp*i, Luxe.screen.h/2 )
            });
            noo.generate({
                offset: _offset
            });
            
        }
    }

    override public function update(dt:Float):Void
    {
        // time += dt;
        // if(time >= 1)
        // {
        //     time -= 1;
        // }
        // circle.x = Math.sin(time)*40 + 40;
    }


}