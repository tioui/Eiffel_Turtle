note
	description: "Summary description for {TURTLE_TURTLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TURTLE_TURTLE

inherit
	ANY

create
	make

feature {NONE} -- Initialization

	make(a_drawing_procedure:PROCEDURE[ANY,TUPLE[a_x,a_y:INTEGER;a_brush:TURTLE_BRUSH]])
		do
			create image_ctrl
			create env
			set_medium_speed
			create brush
			brush.color.set_red
			start_drawing
			drawing_procedure:=a_drawing_procedure
			create internal_mutex.make
		end

feature -- Access

	brush:TURTLE_BRUSH

	is_drawing:BOOLEAN

	stop_drawing
		do
			is_drawing:=false
		end

	start_drawing
		do
			is_drawing:=true
		end

	x:INTEGER
			-- Horizontal position. 0 is the position in the center of the window.
		do
			Result:=real_x.rounded
		end

	y:INTEGER
			-- Vertical position. 0 is the position in the center of the window.
		do
			Result:=real_y.rounded
		end

	heading:INTEGER
			-- The angle in degree of the direction of the turtle. 0 is up and using clockwise direction.

	speed:NATURAL_8 assign set_speed
			-- Turtle speed from 0 to 255 (0 is slower and 255 is faster).

	set_light_speed
		do
			set_speed(255)
		end

	set_very_fast
		do
			set_speed(200)
		end

	set_fast
		do
			set_speed(150)
		end

	set_medium_speed
		do
			set_speed(100)
		end

	set_slow
		do
			set_speed(50)
		end

	set_very_slow
		do
			set_speed(20)
		end

	go_x(a_x:INTEGER)
			-- Modify the horizontal position to `a_x'. 0 is the position in the center of the window.
		do
			if a_x>x then
				set_heading(90)
				go(a_x-x)
			else
				set_heading(-90)
				go(x-a_x)
			end
		end

	go_y(a_y:INTEGER)
			-- Modify the vertical position to `a_y'. 0 is the position in the center of the window.
		do
			if a_y>y then
				set_heading(180)
				go(a_y-y)
			else
				set_heading(0)
				go(y-a_y)
			end
		end

	go_position(a_x,a_y:INTEGER)
			-- Modify the position to (`a_x',`a_y'). (0,0) is the position in the center of the window.
		do
			go_x(a_x)
			go_y(a_y)
		end

	set_heading(a_heading:INTEGER)
			-- Modify the angle in degree of the direction of the turtle. 0 is up and using clockwise direction.
		do
			if a_heading>heading then
				turn(a_heading-heading)
			else
				turn(heading-a_heading)
			end
		end

	set_speed(a_speed:NATURAL_8)
			-- Assign `a_speed' to the `speed' property.
		require
			Speed_Positive:a_speed>0
		do
			speed:=a_speed
		end

	turn(a_angle:INTEGER)
			-- Turn the heading of `a_angle' degree clockwise.
		local
			incrementer,i:INTEGER
		do
			if a_angle>0 then
				incrementer:=1
			else
				incrementer:=-1
			end
			from
				i:=1
			until
				i>a_angle.abs
			loop
				internal_mutex.lock
				heading:=heading+incrementer
				image_ctrl.rotate (heading)
				is_modified:=true
				internal_mutex.unlock
				env.sleep (20000000//speed)
				i:=i+1
			end
			update_theta
		end

	go(step:INTEGER)
		local
			i:INTEGER
			incrementer_x,incrementer_y:REAL_64
		do

			incrementer_x:={DOUBLE_MATH}.sine(theta)
			incrementer_y:={DOUBLE_MATH}.cosine(theta)
			if step>0 then
				incrementer_y:=incrementer_y*-1

			else
				incrementer_x:=incrementer_x*-1
			end
			from
				i:=1
			until
				i>step.abs
			loop
				internal_mutex.lock
				real_x:=real_x+incrementer_x
				real_y:=real_y+incrementer_y
				is_modified:=true
				internal_mutex.unlock
				i:=i+1
				if is_drawing then
					drawing_procedure.call([x,y,brush])
				end
				env.sleep (50000000//speed)
			end
			env.sleep (50000000//speed)
		end

	reset
		do
			real_x:=0
			real_y:=0
		end



feature {TURTLE_WINDOW} -- Implementation

	image_ctrl:TURTLE_IMAGES_CONTROLLER
	internal_mutex:MUTEX
	is_modified:BOOLEAN
	clear_modified
		do
			is_modified:=false
		end

feature {NONE} -- Implementation

	internal_pixmap:TURTLE_IMAGES_CONTROLLER

	update_timer:EV_TIMEOUT

	env:EXECUTION_ENVIRONMENT

	drawing_procedure:PROCEDURE[ANY,TUPLE[a_x,a_y:INTEGER;a_brsh:TURTLE_BRUSH]]


	start_line
		do
			old_x:=x
			old_y:=y
		end

	end_line
		do

		end

	update_theta
		do
			theta:=({DOUBLE_MATH}.Pi*heading)/180
		end

	theta:REAL_64

	real_x:REAL_64
	real_y:REAL_64

	old_x:INTEGER
	old_y:INTEGER



end
