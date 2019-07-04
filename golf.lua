
-- title:  game title
-- author: game developer
-- desc:   short description
-- script: lua

local x = 120
local y = 68
local a = 0
local pi2 = 3.14159 * 2
local tailColor = 0


TURN_RADIUS = 0.05    -- how much the car turn when pressing left or right
ACCEL_VALUE = 0.02    -- acceleration when pressing z

car = {
 x=120, y=68, -- position
 vx=0, vy=0, -- velocity
 a=0 -- angle
}


-- adds two angles ensuring the
-- result is in the 0..2pi range
function angleAdd(a, d)
	a=a+d
	-- ensure angle is in 0..2pi range
	if a<0 then 
	  a=a+pi2
	elseif a>=pi2 then 
	  a=a-pi2
	end
	return a
   end

   -- gets a vector of given length
-- oriented on the given angle
function vector(length, angle)
	return rotate(0, -length, angle)
   end

function drawCar(c)
	circb(c.x, c.y, 3, 15)
	local x1,y1 = vector(5,c.a)
	line(c.x, c.y, c.x+x1, c.y+y1, 15)
end

function drawCarPlus(c)
	local x1,y1 = vector(8,c.a-pi2)
	line(c.x, c.y, c.x-x1, c.y-y1,tailColor)
	tailColor=tailColor+1
	if tailColor>16 then
		tailColor=0
	end
end

function rotate(x,y,a)
	return x * math.cos(a)-y*math.sin(a),
		x*math.sin(a) + y*math.cos(a)
end

function TIC()
-- rotate our direction
if btn(2) then car.a=angleAdd(car.a,-0.05) end
if btn(3) then car.a=angleAdd(car.a,0.05) end
 
cls(0)

if car.y<-1 then
	car.y = 136-car.y
end
if car.y>139 then
	car.y = car.y-136
end
if car.x>241 then
	car.x = 1
end
if car.x<0 then
	car.x = 240+car.x
end

drawCar(car)

if btn(4) then
	drawCarPlus(car)
	local ax,ay = vector(ACCEL_VALUE,car.a)
	car.vx=car.vx+ax -- change velocity this time
	car.vy=car.vy+ay
   end

   -- this push the car towards the ground
   car.vy=car.vy+0.008
   if car.vy>1 then
		car.vy=1
   end

   -- add velocity to car
   car.x=car.x+car.vx
   car.y=car.y+car.vy

end