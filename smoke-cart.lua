-- title:  Smoke Particle
-- author: By Mozz http://mozz.itch.io/
-- Originally for Pico 8 fanzine #1
-- Ported to Tic80 by me
-- desc:   Smoke particle Demo
-- script: lua

function _make_smoke(x,y,init_size,color)
    local smoke_particle={}
    smoke_particle.x=x
    smoke_particle.y=y
    smoke_particle.color=color
    smoke_particle.width=init_size
    smoke_particle.width_final=init_size+math.random(3)+1
    smoke_particle.time_alive=0
    smoke_particle.max_time_alive=60+math.random(10)
    smoke_particle.dx=math.random()*.8*.4
    smoke_particle.dy=math.random()*.05
    smoke_particle.ddy=-.02
    table.insert(smoke,smoke_particle)
    return smoke_particle
  end
  
  function _move_smoke(current_particle)
    if current_particle.time_alive>current_particle.max_time_alive-15 then
      table.remove(smoke,1)
    end
    if current_particle.time_alive>current_particle.max_time_alive then
      current_particle.width=current_particle.width+1
      current_particle.width=math.min(current_particle.width,current_particle.width_final)
    end
    current_particle.x=current_particle.x+current_particle.dx
    current_particle.y=current_particle.y+current_particle.dy
    current_particle.dy=current_particle.dy+current_particle.ddy
    current_particle.time_alive=current_particle.time_alive+1
  end
  
function _update()
  t=t+1
  --foreach(smoke,_move_smoke) 
  for k,v in pairs(smoke) do
    _move_smoke(v)
  end
  if btn(2) then cursor_x=cursor_x-1 end
  if btn(3) then cursor_x=cursor_x+1 end
  if btn(0) then cursor_y=cursor_y-1 end
  if btn(1) then cursor_y=cursor_y+1 end
  if btn(4) then color = math.floor(math.random(1,15)) end
  _make_smoke(cursor_x,cursor_y,math.random(4),color)
end
  
function _draw_smoke(smoke_particle)
  circ(smoke_particle.x,smoke_particle.y,smoke_particle.width,smoke_particle.color)
end
  
function _draw()
  cls()
  --foreach(smoke,_draw_smoke) 
  for k,v in pairs(smoke) do
    _draw_smoke(v)
  end
end

function _init()
  smoke={}
  cursor_x=50
  cursor_y=50
  color=1
  t=0
end

-- called just once
_init()
  
function TIC()  
  _update()
  _draw()
end
  
  
  
  
  
  
  