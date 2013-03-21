note
	description: "Summary description for {TURTLE_BRUSH}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TURTLE_BRUSH

inherit
	ANY
		redefine
			default_create
		end

create
	default_create

feature {NONE}	-- Initialisation

	default_create
		do
			set_fine
			create color
			color.set_black
		end

feature -- Access

	set_extra_fine
			-- Very thin brush size.
		do
			set_size(1)
		end

	set_fine
			-- A thin brush size.
		do
			set_size(3)
		end

	set_medium
			-- Very medium brush size.
		do
			set_size(5)
		end

	set_large
			-- A large brush size.
		do
			set_size(7)
		end

	set_extra_large
			-- A very large brush size.
		do
			set_size(9)
		end

	set_size(a_size:INTEGER)
			-- Set the size of the brush
		require
			Size_Positive:a_size>0
		do
			size:=a_size
		end

	size:INTEGER assign set_size
			-- The size of the brush in pixel

	color:TURTLE_COLOR
			-- The color of the brush.

end
