note
	description : "eiffel_turtle application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	TURTLE_APPLICATION

create
	make

feature {NONE} -- Initialization

	execute
			-- Run application.
		local
			i,j:INTEGER
			fin:BOOLEAN
		do
			turtle.set_very_slow
			fin:=false
			from
				fin:=false
			until
				fin
			loop
				if mouse.is_left_button_pressed then
					fin:=true
				else
					turtle.go_position (mouse.x, mouse.y)
				end

			end

		end

end
