local composer = require("composer") 
local scene = composer.newScene()
local sp_music = audio.loadStream("images/shoot.wav")
function scene:create(event)
	names={"1","2","3","4","5"}
	local total=5
	local left1,lef2,right1,right2
	local pos_mid,pos_right1,pos_right2,pos_left1,pos_left2
	local pos_easy,pos_hard,pos_normal
	local sceneGroup = self.view
	local slide_time = 200 --default=200
	local s_slide_time = 300 --default=300
	local background = display.newImageRect("images/Floral.png", 1000, 480)
	background.x=150
	background.y=240
    sceneGroup:insert(background)
	function song_display(middle)
		if middle-1 == 0 then
			left1=names[total]
			left2=names[total-1]
			right1=names[middle+1]
			right2=names[middle+2]
		elseif middle-2 == 0 then
			left1=names[middle-1]
			left2=names[total]
			right1=names[middle+1]
			right2=names[middle+2]
		elseif middle+1 == total+1 then
			left1=names[middle-1]
			left2=names[middle-2]
			right1=names[1]
			right2=names[2]
		elseif middle+2 == total+1 then
			left1=names[middle-1]
			left2=names[middle-2]
			right1=names[total]
			right2=names[1]
		else
			left1=names[middle-1]
			left2=names[middle-2]
			right1=names[middle+1]
			right2=names[middle+2]
		end

		pos_mid = display.newImageRect("images/song"..names[middle]..".png", 420, 210)
		pos_mid.x=170
		pos_mid.y=250

		pos_right1 = display.newImageRect("images/song"..right1..".png", 140, 70)
		pos_right1.x=430
		pos_right1.y=320

		pos_right2 = display.newImageRect("images/song"..right2..".png", 42, 21)
		pos_right2.x=540
		pos_right2.y=340
		
		pos_left1 = display.newImageRect("images/song"..left1..".png", 140, 70)
		pos_left1.x=-90
		pos_left1.y=320

		pos_left2 = display.newImageRect("images/song"..left2..".png", 42, 21)
		pos_left2.x=-200
		pos_left2.y=340
		
		sceneGroup:insert(pos_mid)
		sceneGroup:insert(pos_right1)
		sceneGroup:insert(pos_right2)
		sceneGroup:insert(pos_left1)
		sceneGroup:insert(pos_left2)
	end

	song_display(1)
	local curren_mid=1

	function L_shift(middle)
		middle=middle+1
		curren_mid=curren_mid+1
		if curren_mid == total+1 then
			curren_mid=1
		end
		if middle==total+1 then
			middle=1
		end

		transition.to(pos_left2, {time=slide_time, x=pos_left2.x-30, y=pos_left2.y+15,xScale=0.1,yScale=0.1,otation=0}) 
		transition.to(pos_left1, {time=slide_time, x=pos_left1.x-110, y=pos_left1.y+20,xScale=0.3,yScale=0.3,otation=0}) 
		transition.to(pos_mid, {time=slide_time, x=pos_mid.x-260, y=pos_mid.y+70,xScale=0.3,yScale=0.3,otation=0})
		transition.to(pos_right1, {time=slide_time, x=pos_right1.x-260, y=pos_right1.y-70,xScale=3,yScale=3,otation=0})
		transition.to(pos_right2, {time=slide_time, x=pos_right2.x-110, y=pos_right2.y-20,xScale=3,yScale=3,otation=0})
		local function clear()
			pos_left2:removeSelf()
			pos_left2= nil 
			pos_left1:removeSelf()
			pos_left1= nil 
			pos_right1:removeSelf()
			pos_right1= nil 
			pos_right2:removeSelf()
			pos_right2= nil 
			pos_mid:removeSelf()
			pos_mid= nil 
			if middle-1 == 0 then
			left1=names[total]
			left2=names[total-1]
			right1=names[middle+1]
			right2=names[middle+2]
		elseif middle-2 == 0 then
			left1=names[middle-1]
			left2=names[total]
			right1=names[middle+1]
			right2=names[middle+2]
		elseif middle+1 == total+1 then
			left1=names[middle-1]
			left2=names[middle-2]
			right1=names[1]
			right2=names[2]
		elseif middle+2 == total+1 then
			left1=names[middle-1]
			left2=names[middle-2]
			right1=names[total]
			right2=names[1]
		else
			left1=names[middle-1]
			left2=names[middle-2]
			right1=names[middle+1]
			right2=names[middle+2]
		end

		pos_mid = display.newImageRect("images/song"..names[middle]..".png", 420, 210)
		pos_mid.x=170
		pos_mid.y=250

		pos_right1 = display.newImageRect("images/song"..right1..".png", 140, 70)
		pos_right1.x=430
		pos_right1.y=320

		pos_right2 = display.newImageRect("images/song"..right2..".png", 42, 21)
		pos_right2.x=540
		pos_right2.y=340
		
		pos_left1 = display.newImageRect("images/song"..left1..".png", 140, 70)
		pos_left1.x=-90
		pos_left1.y=320

		pos_left2 = display.newImageRect("images/song"..left2..".png", 42, 21)
		pos_left2.x=-200
		pos_left2.y=340
		
		sceneGroup:insert(pos_mid)
		sceneGroup:insert(pos_right1)
		sceneGroup:insert(pos_right2)
		sceneGroup:insert(pos_left1)
		sceneGroup:insert(pos_left2)
		end
		
		timer.performWithDelay( slide_time+10, clear,1 )
		
	end

	function R_shift(middle)
		middle=middle-1
		curren_mid=curren_mid-1
		if curren_mid == 0 then
			curren_mid=total
		end
		if middle==0 then
			middle=total
		end

		transition.to(pos_left2, {time=slide_time, x=pos_left2.x+110, y=pos_left2.y-20,xScale=3,yScale=3,otation=0}) 
		transition.to(pos_left1, {time=slide_time, x=pos_left1.x+260, y=pos_left1.y-70,xScale=3,yScale=3,otation=0}) 
		transition.to(pos_mid, {time=slide_time, x=pos_mid.x+260, y=pos_mid.y+70,xScale=0.3,yScale=0.3,otation=0})
		transition.to(pos_right1, {time=slide_time, x=pos_right1.x+110, y=pos_right1.y+20,xScale=0.3,yScale=0.3,otation=0})
		transition.to(pos_right2, {time=slide_time, x=pos_right2.x+30, y=pos_right2.y+15,xScale=0.1,yScale=0.1,otation=0})
		local function clear()
			pos_left2:removeSelf()
			pos_left2= nil 
			pos_left1:removeSelf()
			pos_left1= nil 
			pos_right1:removeSelf()
			pos_right1= nil 
			pos_right2:removeSelf()
			pos_right2= nil 
			pos_mid:removeSelf()
			pos_mid= nil 
		if middle-1 == 0 then
			left1=names[total]
			left2=names[total-1]
			right1=names[middle+1]
			right2=names[middle+2]
		elseif middle-2 == 0 then
			left1=names[middle-1]
			left2=names[total]
			right1=names[middle+1]
			right2=names[middle+2]
		elseif middle+1 == total+1 then
			left1=names[middle-1]
			left2=names[middle-2]
			right1=names[1]
			right2=names[2]
		elseif middle+2 == total+1 then
			left1=names[middle-1]
			left2=names[middle-2]
			right1=names[total]
			right2=names[1]
		else
			left1=names[middle-1]
			left2=names[middle-2]
			right1=names[middle+1]
			right2=names[middle+2]
		end

		pos_mid = display.newImageRect("images/song"..names[middle]..".png", 420, 210)
		pos_mid.x=170
		pos_mid.y=250

		pos_right1 = display.newImageRect("images/song"..right1..".png", 140, 70)
		pos_right1.x=430
		pos_right1.y=320

		pos_right2 = display.newImageRect("images/song"..right2..".png", 42, 21)
		pos_right2.x=540
		pos_right2.y=340
		
		pos_left1 = display.newImageRect("images/song"..left1..".png", 140, 70)
		pos_left1.x=-90
		pos_left1.y=320

		pos_left2 = display.newImageRect("images/song"..left2..".png", 42, 21)
		pos_left2.x=-200
		pos_left2.y=340
		
		sceneGroup:insert(pos_mid)
		sceneGroup:insert(pos_right1)
		sceneGroup:insert(pos_right2)
		sceneGroup:insert(pos_left1)
		sceneGroup:insert(pos_left2)
		end
		
		timer.performWithDelay( slide_time+10, clear,1 )
		
	end

	local switch=1
	local switch2=1
	function select_dif()
			switch=0
			pos_right1.alpha=0.2
			pos_right2.alpha=0.2
			pos_left1.alpha=0.2
			pos_left2.alpha=0.2
			transition.to(pos_mid, {time=s_slide_time, x=pos_mid.x-240, y=pos_mid.y-120,rotation=0})
			
			pos_easy = display.newImageRect("images/easy.png", 120, 75)
			pos_easy.x=360
			pos_easy.y=150
			
			pos_normal = display.newImageRect("images/normal.png", 120, 75)
			pos_normal.x=420
			pos_normal.y=250
			
			pos_hard = display.newImageRect("images/hard.png", 120, 75)
			pos_hard.x=360
			pos_hard.y=350
			
			sceneGroup:insert(pos_easy)
			sceneGroup:insert(pos_normal)
			sceneGroup:insert(pos_hard)
			
			local function toscene_easy()
				audio.fadeOut({channel=1,time=500})
				audio.play(sp_music, { channel = 3, loops = 0})
				audio.setVolume(0.05, { channel = 3 })
				composer.gotoScene("gameScene")
			end
			
			local function toscene_normal()
				audio.fadeOut({channel=1,time=500})
				audio.play(sp_music, { channel = 3, loops = 0})
				audio.setVolume(0.05, { channel = 3 })
				composer.gotoScene("gameScene")
			end
			
			local function toscene_hard()
				audio.fadeOut({channel=1,time=500})
				audio.play(sp_music, { channel = 3, loops = 0})
				audio.setVolume(0.05, { channel = 3 })
				composer.gotoScene("gameScene")
			end
			
			pos_easy:addEventListener( "touch", toscene_easy)
			pos_normal:addEventListener( "touch", toscene_normal)
			pos_hard:addEventListener( "touch", toscene_hard)
			

	end

	local x1=0	
	local x2=0
	local y=0
	local act = function(event)

		local function clear()
			if pos_hard~=nil then
				pos_hard:removeSelf()
				pos_hard= nil 
				pos_easy:removeSelf()
				pos_easy= nil 
				pos_normal:removeSelf()
				pos_normal= nil 
			end
		end

		if event.phase=="began" then
			x1=event.x
			y=event.y
			if switch ==0 and (x1<360 or x1>490) then
				clear()
			end
			if switch ==0 and (x1>360 and x1<490) and (y>400 or y<200) then
				clear()
			end
			
		end
		
		if event.phase=="ended" then
			x2=event.x
			if x1-x2>5 then
				L_shift(curren_mid)
				switch=1
			elseif x1-x2<-5 then
				R_shift(curren_mid)
				switch=1
			else if x1<370 and x1>-10 and x2<370 and x2>-10 and switch==1 then
				select_dif()
			else if x2>370 then
				L_shift(curren_mid)
				switch=1
			else
				R_shift(curren_mid)
				switch=1
			end	
			end
			end
		end
	end

	Runtime:addEventListener( "touch", act)
end

scene:addEventListener( "create", scene )
return scene