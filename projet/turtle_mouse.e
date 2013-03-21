note
	description: "Summary description for {TURTLE_MOUSE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TURTLE_MOUSE

inherit
	ANY

create
	make

feature {NONE} -- Initialisation

	make(a_turtle_area:EV_DRAWING_AREA)
		do
			a_turtle_area.pointer_button_press_actions.extend (agent on_button_press)
			a_turtle_area.pointer_button_release_actions.extend (agent on_button_release)
			a_turtle_area.pointer_motion_actions.extend (agent on_motion)
			a_turtle_area.resize_actions.extend (agent on_resize)
			i_width:=0
			i_height:=0
		end

feature -- Access

	x:INTEGER
		do
			result:=i_x-(i_width//2)
		end

	y:INTEGER
		do
			result:=i_y-(i_height//2)
		end

	is_left_button_pressed:BOOLEAN

	is_right_button_pressed:BOOLEAN

	is_middle_button_pressed:BOOLEAN

feature {NONE} -- Implementation

	on_button_press(a_x: INTEGER_32; a_y: INTEGER_32; button: INTEGER_32; x_tilt: REAL_64; y_tilt: REAL_64; pressure: REAL_64; screen_x: INTEGER_32; screen_y: INTEGER_32)
		do
			is_left_button_pressed:=(button=1)
			is_right_button_pressed:=(button=3)
			is_middle_button_pressed:=(button=2)
		end

	on_button_release(a_x: INTEGER_32; a_y: INTEGER_32; button: INTEGER_32; x_tilt: REAL_64; y_tilt: REAL_64; pressure: REAL_64; screen_x: INTEGER_32; screen_y: INTEGER_32)
		do
			if button=1 then
				is_left_button_pressed:=false
			end
			if button=3 then
				is_right_button_pressed:=false
			end
			if button=2 then
				is_middle_button_pressed:=false
			end
		end

	on_motion(a_x: INTEGER_32; a_y: INTEGER_32; x_tilt: REAL_64; y_tilt: REAL_64; pressure: REAL_64; screen_x: INTEGER_32; screen_y: INTEGER_32)
		do
			i_x:=a_x
			i_y:=a_y
		end

	on_resize(a_x,a_y,a_width,a_height:INTEGER)
		do
			i_width:=a_width
			i_height:=a_height
		end

	i_width:INTEGER
	i_height:INTEGER
	i_x:INTEGER
	i_y:INTEGER



end
