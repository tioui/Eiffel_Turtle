note
	description: "The panel containing the diagram."
	author: "Louis Marchand"
	date: "10/26/2012"
	revision: "$Revision$"

class
	TURTLE_PANEL

inherit
	EV_DRAWING_AREA_PROJECTOR
		rename
			make as make_projector
		end

create
	make

feature {NONE} -- Initialisation

	make(a_drawing:EV_DRAWING_AREA; a_turtle:TURTLE_TURTLE; a_floor:TURTLE_FLOOR)
			-- Creating the `Current' panel and associate it with `a_drawing'
		local
			l_diagram_world:EV_FIGURE_WORLD
		do
			create l_diagram_world.default_create
			create buffer.default_create
			make_with_buffer (l_diagram_world, buffer, a_drawing)
			a_drawing.resize_actions.extend (agent on_resize)
	--		world.extend (a_turtle.figure)
			full_project
		end

feature -- Access

	enable_grid
			-- Show te grid on the panel
		do
			world.enable_grid
			full_project
		end

	disable_grid
			-- Hide the grid from the panel
		do
			world.disable_grid
			full_project
		end

	is_grid_enabled:BOOLEAN
			-- The Grid is visible on the panel
		do
			Result:=world.grid_enabled
		end

	set_grid_spacing(a_spacing:INTEGER)
			-- The distance between each dots of the grid on the panel
		do
			world.set_grid_x (a_spacing)
			world.set_grid_y (a_spacing)
			full_project
		end

feature {NONE} -- Implementation - Routines

	on_resize(a_x,a_y,a_width,a_height:INTEGER)
			-- When the attached drawing area is resized.
		do
			buffer.set_size (a_width, a_height)
			full_project
		end


feature {NONE} -- Implementation - Variables


	buffer: EV_PIXMAP
			-- The drawing buffer to enable multi bufferring


end
