/// @description core player logic

//get palyer inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right)
key_jump = keyboard_check_pressed(vk_up);

//calculate movment
var _move = key_right -key_left;

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,Obj_Invisble_Wall)) && (key_jump)
{
	vsp = -jumpsp
}

//horizontal collision
if (place_meeting(x+hsp,y,Obj_Invisble_Wall))
{
	while (!place_meeting(x+sign(hsp),y,Obj_Invisble_Wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x +hsp;

//vertical collision
if (place_meeting(x,y+vsp,Obj_Invisble_Wall))
{
	while (!place_meeting(x,y+sign(vsp),Obj_Invisble_Wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y +vsp;

//Animation
if (!place_meeting(x,y+1,Obj_Invisble_Wall))
{
	sprite_index = Spr_Player_Jump;
	image_speed = 0;
	if (vsp > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;	
	if (hsp == 0)
	{
		sprite_index = Spr_Player;
	}
	else
	{
		sprite_index = Spr_Player_Run;
	}
}

if (hsp != 0) image_xscale  = sign(hsp);