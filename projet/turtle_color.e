note
	description: "Summary description for {TURTLE_COLOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TURTLE_COLOR

inherit
	ANY
	redefine
		default_create
	end


feature {NONE} -- Initialisation

	default_create
		do
			create internal_color.make_with_8_bit_rgb (0, 0, 0)
		end

feature -- Access

	set_rgb_value(red,green,blue:INTEGER)
		do
			internal_color.set_rgb_with_8_bit (red, green, blue)
		end

	set_red
		do
			set_rgb_value(255, 0, 0)
		end

	set_green
		do
			set_rgb_value (0, 255, 0)
		end

	set_blue
		do
			set_rgb_value (0, 0, 255)
		end

	set_yellow
		do
			set_rgb_value (255, 255, 0)
		end

	set_pink
		do
			set_rgb_value(255, 0, 255)
		end

	set_magenta
		do
			set_rgb_value(0, 255, 255)
		end

	set_white
		do
			set_rgb_value(255,255,255)
		end

	set_black
		do
			set_rgb_value (0, 0, 0)
		end

feature {TURTLE_FLOOR,TURTLE_WINDOW} -- Implementation

	internal_color:EV_COLOR


end
