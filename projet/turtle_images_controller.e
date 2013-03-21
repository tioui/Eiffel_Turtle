note
	description: "Summary description for {TURTLE_IMAGES_CONTROLLER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TURTLE_IMAGES_CONTROLLER

inherit
	ANY
		redefine
			default_create
		end

create
	default_create

feature {NONE}

	default_create
		local
			l_images:TURTLES_IMAGE_BUFFER
		do
			create l_images.make
			create internam_pixmap.make_with_pixel_buffer (l_images)
		end

feature -- Access

	rotate(a_angle:INTEGER)
		do
			current_angle:=a_angle
		end

	current_angle:INTEGER

feature {TURTLE_WINDOW} -- Restricted


	turtle_pixmap:EV_PIXMAP
		do
			Result:=get_turtle_with_angle(current_angle)
		end

	get_turtle_with_angle(a_angle:INTEGER):EV_PIXMAP
		local
			l_angle:INTEGER
			l_image_rect:EV_RECTANGLE
		do
			from l_angle:=a_angle
			until l_angle>=0
			loop
				l_angle:=l_angle+360
			end
			l_angle:=l_angle\\360
			if l_angle=0 then
				l_angle:=360
			end
			create l_image_rect.make (0, (l_angle-1)*38, 37, 37)
			Result:=internam_pixmap.sub_pixmap (l_image_rect)
		end


feature {NONE} -- Implementation

	internam_pixmap:EV_PIXMAP

end
