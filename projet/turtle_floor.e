note
	description: "Summary description for {TURTLE_FLOOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TURTLE_FLOOR

inherit
	ANY
		redefine
			default_create
		end

create
	default_create

feature {NONE} -- Initialisation

	default_create
		do
			create internal_mutex.make
			create internal_image
			create color
			color.set_rgb_value (200, 200, 200)
			must_paint:=false
			repaint
			create {LINKED_QUEUE[TUPLE[x,y:INTEGER;brush:TURTLE_BRUSH]]} point_to_draw.make
		end

feature -- Access

	color:TURTLE_COLOR

	draw_point(a_x,a_y:INTEGER;a_brush:TURTLE_BRUSH)
		do
			internal_mutex.lock
			point_to_draw.put ([a_x,a_y,a_brush])
			internal_mutex.unlock
		end

	paint
		do
			reset
		end

	reset
		do
			must_paint:=true
		end

	height:INTEGER
		do
			Result:=internal_image.height
		end

	width:INTEGER
		do
			Result:=internal_image.width
		end

feature {TURTLE_WINDOW} -- Restrict

	image:EV_PIXMAP
		do
			internal_mutex.lock
			if must_paint then
				repaint
				must_paint:=false
			end
			from

			until
				point_to_draw.is_empty
			loop
				internal_image.set_foreground_color(point_to_draw.item.brush.color.internal_color)
				internal_image.set_line_width(point_to_draw.item.brush.size)
				internal_image.draw_segment ((width//2)+point_to_draw.item.x, (height//2)+point_to_draw.item.y, (width//2)+point_to_draw.item.x, (height//2)+point_to_draw.item.y)
				point_to_draw.remove
			end
			Result:=internal_image
			internal_mutex.unlock
		end

	on_resize(a_width,a_height:INTEGER)
		local
			old_image:EV_PIXMAP
		do
			old_image:=internal_image
			create internal_image.make_with_size (a_width, a_height)
			repaint
			internal_image.draw_pixmap ((a_width-old_image.width)//2, (a_height-old_image.height)//2, old_image)
		end

feature {NONE} -- Implementation

	internal_image:EV_PIXMAP
	internal_mutex:MUTEX
	point_to_draw:QUEUE[TUPLE[x,y:INTEGER;brush:TURTLE_BRUSH]]
	must_paint:BOOLEAN


	repaint
		do
			internal_image.set_foreground_color (color.internal_color)
			internal_image.fill_rectangle (0, 0, width, height)
		end

end
