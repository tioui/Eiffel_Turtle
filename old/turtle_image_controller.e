note
	description: "Summary description for {TURTLE_IMAGE_CONTROLLER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TURTLE_IMAGE_CONTROLLER

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
			i:INTEGER
		do
			create {ARRAYED_LIST[EV_PIXMAP]} internal_pixmap_list.make (360)
			rotate(0)
			from i:=1
			until i>360
			loop
				internal_rotate(i)
				internal_pixmap_list.extend (internal_pixmap)
				i:=i+1
			end
		end

feature -- Access

	rotate(a_angle:INTEGER)
		do
			current_angle:=a_angle
		end

	current_angle:INTEGER

feature {TURTLE_WINDOW} -- Restricted


	turtle_pixmap:EV_PIXMAP
		local
			l_angle:INTEGER
		do
			from l_angle:=current_angle
			until l_angle>=0
			loop
				l_angle:=l_angle+360
			end
			l_angle:=l_angle\\360
			Result:=internal_pixmap_list.at (l_angle+1)
		end

	update_pixmap
		do

		end

--	turtle_pixmap:EV_PIXMAP
--		do
--			if internal_angle/=current_angle then
--				internal_rotate(current_angle)
--			end
--			Result:=internal_pixmap
--		end

--	update_pixmap
--		do
--			if internal_angle/=current_angle then
--				internal_rotate(current_angle)
--			end
--		end

feature {NONE} -- Implementation

	internal_pixmap_list:LIST[EV_PIXMAP]

	internal_pixmap:EV_PIXMAP

	internal_angle:INTEGER

	internal_rotate(a_angle:INTEGER)
		local
			l_angle:INTEGER
			l_turtle_pixel_buffer:TURTLE_IMAGE_BUFFER
			l_pixel_buffer_rotated:EV_PIXEL_BUFFER
		do
			create l_turtle_pixel_buffer.make
			from l_angle:=a_angle
			until l_angle>=0
			loop
				l_angle:=l_angle+360
			end
			l_angle:=l_angle\\360
			if l_angle=0 then
				l_pixel_buffer_rotated:=l_turtle_pixel_buffer
			elseif l_angle=90 or l_angle=180 or l_angle=270 then
				l_pixel_buffer_rotated:=rotate_buffer_orthogonal(l_turtle_pixel_buffer,l_angle)
			else
				l_pixel_buffer_rotated:=rotate_buffer(l_turtle_pixel_buffer,l_angle)
			end
			create internal_pixmap.make_with_pixel_buffer (l_pixel_buffer_rotated)
			internal_angle:=a_angle
		end

	rotate_buffer_orthogonal(a_buffer:EV_PIXEL_BUFFER;a_angle:INTEGER):EV_PIXEL_BUFFER
		require
			Orthogonal:a_angle /= 0 and a_angle\\90=0
		local
			l_iterator_source,l_iterator_destination: EV_PIXEL_BUFFER_ITERATOR
            l_pixel_source: EV_PIXEL_BUFFER_PIXEL
		do
			if a_angle=180 then
				create Result.make_with_size (a_buffer.width, a_buffer.height)
			else
				create Result.make_with_size (a_buffer.height, a_buffer.width)
			end
			a_buffer.lock
			Result.lock
			l_iterator_source:=a_buffer.pixel_iterator
			l_iterator_destination:=Result.pixel_iterator
			from
				l_iterator_source.start
			until
				l_iterator_source.exhausted
			loop
				l_pixel_source:=l_iterator_source.item
				if a_angle=90 then
					l_iterator_destination.set_column ((a_buffer.height.to_natural_32) - l_iterator_source.row+1)
					l_iterator_destination.set_row (l_iterator_source.column)
				elseif a_angle=180 then
					l_iterator_destination.set_column ((a_buffer.width.to_natural_32) - l_iterator_source.column+1)
					l_iterator_destination.set_row ((a_buffer.height.to_natural_32) - l_iterator_source.row+1)
				elseif a_angle=270 then
					l_iterator_destination.set_column (l_iterator_source.row)
					l_iterator_destination.set_row ((a_buffer.width.to_natural_32) - l_iterator_source.column+1)
				else
					check Angle_Not_Valid:False end
				end
				l_iterator_destination.item.set_rgba_value (l_pixel_source.rgba_value)
				l_iterator_source.forth
			end
			Result.unlock
			a_buffer.unlock
		end

	rotate_buffer(a_buffer:EV_PIXEL_BUFFER;a_angle:INTEGER):EV_PIXEL_BUFFER
		local
			l_angle_radian,l_sin_angle_inverse,l_cos_angle_inverse,l_gap_x,l_gap_y:REAL_64
			l_rotation_info:TUPLE[width,height:INTEGER;x_gap,y_gap:REAL_64]
			l_iterator_source,l_iterator_destination: EV_PIXEL_BUFFER_ITERATOR
            l_x,l_y:INTEGER
		do
			l_angle_radian:=({DOUBLE_MATH}.Pi*a_angle)/180
			l_rotation_info:=find_width_and_height_after_rotate(a_buffer.width,a_buffer.height,l_angle_radian)
			l_gap_x:=l_rotation_info.x_gap
			l_gap_y:=l_rotation_info.y_gap
			l_sin_angle_inverse:={DOUBLE_MATH}.sine(-l_angle_radian)
			l_cos_angle_inverse:={DOUBLE_MATH}.cosine(-l_angle_radian)
			create Result.make_with_size (l_rotation_info.width, l_rotation_info.height)
			a_buffer.lock
			Result.lock
			l_iterator_destination:=Result.pixel_iterator
			l_iterator_source:=a_buffer.pixel_iterator
			from l_iterator_destination.start
			until l_iterator_destination.exhausted
			loop
				l_x:=((l_cos_angle_inverse*(l_iterator_destination.column+l_gap_x))-(l_sin_angle_inverse*(l_iterator_destination.row+l_gap_y))).floor
				l_y:=((l_sin_angle_inverse*(l_iterator_destination.column+l_gap_x))+(l_cos_angle_inverse*(l_iterator_destination.row+l_gap_y))).floor
				if l_x<1 or l_x>a_buffer.width or l_y<1 or l_y>a_buffer.height then
					l_iterator_destination.item.set_values (0, 0, 0, 0)
				else
					l_iterator_source.set_column (l_x.to_natural_32)
					l_iterator_source.set_row (l_y.to_natural_32)
					l_iterator_destination.item.set_rgba_value (l_iterator_source.item.rgba_value)
				end
				l_iterator_destination.forth
			end

			Result.unlock
			a_buffer.unlock
		end

	find_width_and_height_after_rotate(a_width,a_height:INTEGER;a_angle_radian:REAL_64):TUPLE[width,height:INTEGER;x_gap,y_gap:REAL_64]
		local
			l_sin_angle,l_cos_angle,l_x1,l_x2,l_y1,l_y2,l_x3,l_x4,l_y3,l_y4:REAL_64
			l_gap_x,l_gap_y,l_upper_x,l_lower_x,l_upper_y,l_lower_y:REAL_64
			l_width,l_height:INTEGER
		do
			l_sin_angle:={DOUBLE_MATH}.sine(a_angle_radian)
			l_cos_angle:={DOUBLE_MATH}.cosine(a_angle_radian)

			-- Point (1,1)'
			l_x1:=l_cos_angle-l_sin_angle
			l_y1:=l_sin_angle+l_cos_angle

			-- Point (1,height)'
			l_x2:=l_cos_angle-(l_sin_angle*a_height)
			l_y2:=l_sin_angle+(l_cos_angle*a_height)

			-- Point (width,1)'
			l_x3:=(l_cos_angle*a_width)-l_sin_angle
			l_y3:=(l_sin_angle*a_width)+l_cos_angle

			-- Point (width,heigh)'
			l_x4:=(l_cos_angle*a_width)-(l_sin_angle*a_height)
			l_y4:=(l_sin_angle*a_width)+(l_cos_angle*a_height)

			l_upper_x:=get_upper_value(l_x1,l_x2,l_x3,l_x4)
			l_lower_x:=get_lower_value(l_x1,l_x2,l_x3,l_x4)
			l_upper_y:=get_upper_value(l_y1,l_y2,l_y3,l_y4)
			l_lower_y:=get_lower_value(l_y1,l_y2,l_y3,l_y4)

			l_width:=(l_upper_x-l_lower_x).ceiling
			l_height:=(l_upper_y-l_lower_y).ceiling

			l_gap_x:=get_gap(l_lower_x,l_upper_x,l_width)
			l_gap_y:=get_gap(l_lower_y,l_upper_y,l_height)

			Result:=[l_width,l_height,l_gap_x,l_gap_y]
		end

	get_gap(a_lower_value,a_upper_value:REAL_64;a_lenght:INTEGER):REAL_64
		do
			if a_lower_value<1 then
				Result:=a_lower_value
			else
				Result:=a_upper_value-a_lenght
			end
		end

	get_upper_value(l_value_1,l_value_2,l_value_3,l_value_4:REAL_64):REAL_64
		do
			Result:=l_value_1
			if l_value_2>Result then
				Result:=l_value_2
			end
			if l_value_3>Result then
				Result:=l_value_3
			end
			if l_value_4>Result then
				Result:=l_value_4
			end
		end

	get_lower_value(l_value_1,l_value_2,l_value_3,l_value_4:REAL_64):REAL_64
		do
			Result:=l_value_1
			if l_value_2<Result then
				Result:=l_value_2
			end
			if l_value_3<Result then
				Result:=l_value_3
			end
			if l_value_4<Result then
				Result:=l_value_4
			end
		end



end
