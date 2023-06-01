display.setStatusBar( display.HiddenStatusBar )

local movieclip = require("movieclip")
local physics = require( "physics" )
physics.start()
--physics.setDrawMode( "hybrid" )
--physics.setDrawMode( "debug" )
score1=0

---------------------------
-- Shapes
---------------------------
local shape_1 = { 0,-20, 16,-13, 20,9, 7,19, -12,20, -21,7, -17,-9, -7,-16 }
shape_1.density = 1; shape_1.friction = 0.3; shape_1.bounce = 1.2; 


local dispObj_2 = display.newImageRect( "images/ground.png", 400, 70 )
dispObj_2.x = 170
dispObj_2.y = 477
physics.addBody( dispObj_2, "static", { density=1, friction=0.3, bounce=0.2 } )

local dispObj_3 = display.newImageRect( "images/ground.png", 400, 70 )
dispObj_3.x = 166
dispObj_3.y = 1
physics.addBody( dispObj_3, "static", { density=1, friction=0.3, bounce=0.2 } )

local dispObj_4 = display.newImageRect( "images/ground.png", 51, 455 )
dispObj_4.x = -27
dispObj_4.y = 241
physics.addBody( dispObj_4, "static", { density=1, friction=0.3, bounce=0.2 } )

local dispObj_5 = display.newImageRect( "images/ground.png", 51, 455 )
dispObj_5.x = 352
dispObj_5.y = 227
physics.addBody( dispObj_5, "static", { density=1, friction=0.3, bounce=0.2 } )

score  = display.newText("Score : ",150,22,system.nativeFont,20)  
score5 = display.newText(score1,200,22,system.nativeFont,20)  


math.randomseed(os.time()) 
local backgroundmusic=audio.loadStream("images/s1.wav")

function  produceBall()
      local dispObj_6 = display.newImageRect( "images/ball.png", 49, 48 )
      dispObj_6.x = math.random( 300 )
      dispObj_6.y = math.random( 400 )
      physics.addBody( dispObj_6, 
          {density=shape_1.density, friction=shape_1.friction, bounce=shape_1.bounce, shape=shape_1}
      )
      
            local onTouch = function(event)  
                                  
                  Forest = movieclip.newAnim({"images/explode1.png","images/explode2.png","images/explode3.png","images/explode4.png","images/explode5.png","images/explode6.png","images/explode7.png","images/explode8.png","images/explode9.png"})
                  Forest:play({startFrame=1,endFrame=9,loop=1,remove=true})
                  Forest.x,Forest.y = dispObj_6.x,dispObj_6.y --位置
                  Forest.width,Forest.height=200,200
                  Forest:setDrag{drag=false} --拖曳移動物件     
                  score1 = score1 + 5
                  score5.text =score1 

                  audio.play(backgroundmusic,{channel=1,loops=1})
                  audio.setVolume(0.2,{channel=1})            
                  dispObj_6:removeSelf()
                  dispObj_6 = nil  
                            
            end 
            dispObj_6:addEventListener("touch", onTouch)          
      
      
end

for i=1,15 do 
  produceBall()      
end




