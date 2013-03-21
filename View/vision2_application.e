note
	description: "EiffelVision Custom Application.%
		%The original version of this class has been generated by EiffelBuild."
	generator: "EiffelBuild"
	date: "$Date: 2010-12-22 10:39:24 -0800 (Wed, 22 Dec 2010) $"
	revision: "$Revision: 85202 $"

class
	VISION2_APPLICATION

inherit
	EV_APPLICATION
		redefine
			create_interface_objects,
			initialize
		end

create
	default_create, make_and_launch
	
feature {NONE} -- Initialization

	make_and_launch
			-- Create, initialize and launch event loop.
		do
			default_create
			launch
		end
		
feature {NONE} -- User Initialization

	user_create_interface_objects
			-- User object creation.
		do
				-- Create Window
			create main_window
		end

	user_initialization
			-- User object initialization.
		do
				-- Show Window
			main_window.show
		end

feature -- Access

	main_window: TURTLE_WINDOW
			-- Application Main Window.	

feature {NONE} -- Implementation

	frozen initialize
			-- <Precursor>
			-- Do not alter routine.
		do
			user_initialization
			Precursor
		end

	frozen create_interface_objects
			-- <Precursor>
			-- Do not alter routine.
		do
			user_create_interface_objects
			Precursor
		end

end
