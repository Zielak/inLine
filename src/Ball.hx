
package ;

import luxe.Sprite;
import luxe.Color;

import phoenix.geometry.CircleGeometry;

typedef BallOptions = {
    var offset:Float;
    @:optional var brmin:Float;
    @:optional var brmax:Float;
}

class Ball extends Sprite
{

    public var baseY:Float;
    public var inc:Float;
    public var colinc:Float;
    public var coldegree:Float;
    public var brmin:Float;
    public var brmax:Float;
    public var degree:Float;
    public var brvariation:Float;
    public var yMag:Float;
    public var minScale:Float;
    public var maxScale:Float;
    public var variation:Float;


    var circle:CircleGeometry;

    var value:Float;
    var value2:Float;
    var brightness:Float;

    public function generate(options:BallOptions):Void
    {
        baseY = Luxe.screen.h / 2;
        inc = geninc(options.offset);
        colinc = gencolinc(options.offset);
        brmin = (options.brmin != null) ? options.brmin : 0;
        brmax = (options.brmax != null) ? options.brmax : 40;
        degree = coldegree = genstartDegree(options.offset);
        brvariation = brmax - brmin;
        yMag = genyMag(options.offset);
        minScale = genminScale(options.offset);
        maxScale = genmaxScale(options.offset);
        variation = maxScale - minScale;

        circle = Luxe.draw.circle({
            x : 0,
            y : 0,
            r : 10,
            color : new Color(0,1,0,1).rgb(0x00ff00)
        });
        
        circle.transform.parent = transform;
    }

    override public function update(dt:Float):Void
    {
        degree += inc*dt;

        value = Math.sin(degree * Math.PI/180);
        circle.transform.scale.y = circle.transform.scale.x = minScale + variation/2 + (variation/2) * value;

        coldegree += colinc;

        value2 = Math.sin(coldegree * Math.PI/180);
        brightness = brmin + brvariation/2 + (brvariation/2) * value2;

        // setBrightness(color, brightness);
        pos.y = baseY + value2 * yMag;
    }

    function setBrightness(color:Color, v2:Float):Void
    {
        
    }



    function geninc(val:Float):Float
    {
        return 20 * val;
    }
    function gencolinc(val:Float):Float
    {
        return 4;
    }
    function genyMag(val:Float):Float
    {
        return 3 * val;
    }
    static public function genminScale(val:Float = 0):Float
    {
        return 0.2;
    }
    static public function genmaxScale(val:Float = 0):Float
    {
        return 1.5;
    }
    function genstartDegree(val:Float):Float
    {
        return 35 * val;
    }

}