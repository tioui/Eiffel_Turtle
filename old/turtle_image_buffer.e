note
	description: "Pixel buffer that replaces original turtle image file.%
		%The original version of this class has been generated by Image Eiffel Code."

class
	TURTLE_IMAGE_BUFFER

inherit
	EV_PIXEL_BUFFER

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			make_with_size (23, 32)
			fill_memory
		end

feature {NONE} -- Image data

	c_colors_0 (a_ptr: POINTER; a_offset: INTEGER)
			-- Fill `a_ptr' with colors data from `a_offset'.
		external
			"C inline"
		alias
			"{
			{
				#define B(q) \
					#q
				#ifdef EIF_WINDOWS
				#define A(a,r,g,b) \
					B(\x##b\x##g\x##r\x##a)
				#else
				#define A(a,r,g,b) \
					B(\x##r\x##g\x##b\x##a)
				#endif
				char l_data[] = 
				A(00,5F,A2,14)A(00,5F,A2,14)A(00,5E,A1,14)A(00,52,9B,14)A(00,37,81,0E)A(00,44,88,0E)A(00,61,A4,15)A(00,5E,A1,14)A(00,5E,A1,14)A(37,6C,AC,13)A(CA,61,A4,14)A(F7,51,97,12)A(D4,36,7E,0D)A(60,23,50,09)A(00,38,80,0F)A(00,3A,84,0F)A(00,3A,84,0F)A(00,37,82,0F)A(00,5A,9E,13)A(00,61,A4,14)A(00,58,9C,12)A(00,43,88,0D)A(00,33,79,0A)A(00,5F,A2,14)A(00,5F,A2,14)A(00,5E,A1,14)A(00,52,9B,14)A(00,37,81,0E)A(00,44,88,0E)A(00,61,A4,15)A(00,5E,A1,14)A(23,5F,A2,14)A(DC,6E,AE,13)A(FF,68,A7,13)A(FF,60,A4,14)A(FF,3C,7D,0E)A(F5,36,7D,0E)A(3C,3B,86,0F)A(00,3A,84,0F)A(00,38,83,0F)A(00,47,8E,11)A(00,5F,A2,14)A(00,60,A3,14)A(00,58,9C,12)A(00,43,88,0D)A(00,33,79,0A)A(00,5F,A2,14)A(00,5F,A2,14)A(00,5E,A1,14)A(00,52,9B,14)A(00,37,80,0E)A(00,46,8A,0E)A(00,63,A5,15)A(00,5F,A4,14)A(91,4F,83,10)A(FF,39,5B,0A)A(FF,60,96,10)A(FF,6C,B0,15)A(FF,3E,76,0E)A(FF,17,39,06)A(AB,2F,6B,0C)A(00,3B,87,0F)A(00,36,81,0F)A(00,50,96,12)A(00,63,A5,14)A(00,60,A3,14)A(00,58,9C,12)A(00,43,88,0D)A(00,33,79,0A)A(00,5F,A2,14)A(00,5F,A2,14)A(00,5E,A1,14)A(00,52,9B,14)A(00,39,82,0E)A(00,39,7E,0C)A(00,5E,A1,12)A(11,68,AC,14)A(CA,4E,7D,0D)A(FF,23,37,05)A(FF,5F,95,10)
				A(FF,6D,B1,15)A(FF,44,7F,0F)A(FF,0F,25,03)A(E0,2B,62,0B)A(26,3B,87,0F)A(00,3D,87,10)A(00,59,9D,13)A(00,60,A3,14)A(00,60,A3,14)A(00,58,9C,12)A(00,43,88,0D)A(00,33,79,0A)A(00,5F,A2,14)A(00,5F,A2,14)A(01,5E,A1,14)A(0B,52,9B,14)A(10,3B,84,0F)A(00,2C,72,09)A(00,5C,9D,10)A(26,6F,AF,14)A(E1,6B,A9,12)A(FF,69,A6,11)A(FF,6D,AB,11)A(FF,65,A8,14)A(FF,4B,91,13)A(FF,33,77,0B)A(F6,36,7E,0E)A(3A,39,83,0F)A(00,48,8F,11)A(00,63,A5,14)A(10,5F,A2,14)A(07,60,A3,14)A(00,57,9B,12)A(00,43,88,0D)A(00,33,79,0A)A(00,5F,A2,14)A(22,5F,A2,14)A(83,5F,A1,14)A(C9,55,9C,14)A(CE,3A,83,0E)A(32,2E,74,09)A(00,5B,9D,11)A(14,6A,AB,14)A(CD,6C,AC,13)A(FF,70,AF,12)A(FF,6D,AE,12)A(FF,5D,A1,14)A(FF,4E,95,15)A(FF,37,7E,0C)A(E4,36,7E,0D)A(29,3B,85,0F)A(00,5D,A1,14)A(58,5F,A2,14)A(DA,5F,A2,14)A(BA,60,A3,14)A(69,5A,9D,13)A(10,43,87,0D)A(00,33,79,0A)A(38,5F,A2,14)A(DC,5F,A2,14)A(FF,60,A3,14)A(FF,58,9D,13)A(F5,3A,7F,0C)A(3F,2D,74,09)A(00,36,7C,0D)A(00,5B,A1,15)A(7F,60,A3,14)A(FF,65,A6,14)A(FF,5E,A2,15)A(FF,54,9A,16)A(FF,51,98,16)A(FF,38,7E,0C)A(9F,31,79,0C)A(00,3A,83,0F)A(00,5C,A1,14)A(7D,61,A4,14)A(FF,5F,A2,14)A(FF,5F,A2,14)A(FF,5F,A2,14)A(B6,49,8D,0F)
				A(16,32,78,0A)A(D6,5F,A2,14)A(FF,5F,A2,14)A(FF,61,A4,14)A(FF,51,97,11)A(D9,31,74,0A)A(00,3C,7B,09)A(00,56,94,0A)A(00,6B,AB,11)A(1F,59,9D,15)A(F1,4E,96,17)A(FF,4E,98,17)A(FF,51,99,16)A(FF,50,9A,18)A(FA,33,7D,0D)A(46,35,7A,0A)A(00,72,9B,0A)A(00,66,9F,10)A(37,54,9A,12)A(F3,5F,A1,14)A(FF,5F,A2,14)A(FF,60,A4,14)A(FF,4D,91,10)A(A0,33,78,0A)A(F5,5F,A2,14)A(FF,5F,A2,14)A(FF,5F,A3,14)A(FF,43,89,0F)A(D0,20,5D,08)A(00,56,8A,08)A(00,A5,D8,09)A(0B,9D,CE,08)A(68,83,BD,0C)A(FA,76,B2,0F)A(FF,79,A8,0D)A(FF,72,9D,0D)A(FF,73,A0,0D)A(FF,64,94,0B)A(8A,6A,95,09)A(19,86,A4,09)A(00,79,9D,09)A(27,48,89,0D)A(EE,53,99,12)A(FF,60,A3,14)A(FF,5C,9F,13)A(FF,43,87,0E)A(E1,32,77,0A)A(F5,5F,A2,14)A(FF,60,A3,14)A(FF,56,9D,14)A(FF,38,81,0E)A(F8,1E,58,07)A(6A,50,84,08)A(71,9C,D0,09)A(E2,99,CC,08)A(FF,96,C9,09)A(FF,82,B1,0A)A(FF,74,9E,0B)A(FF,7F,A7,08)A(FF,77,9F,08)A(FF,74,9B,09)A(FF,7D,A0,09)A(F2,84,A3,09)A(92,7F,A1,09)A(9D,4C,86,0A)A(FF,37,7F,0C)A(FF,48,8C,0F)A(FF,42,87,0D)A(FF,35,7A,0B)A(CE,32,78,0A)A(CF,5F,A2,14)A(FF,5D,A1,15)A(FF,4B,98,16)A(FF,38,83,11)A(FF,3A,78,09)A(FF,7B,AF,08)A(FF,96,CA,09)A(FF,7B,B6,0E)A(FF,5D,A1,13)A(FF,49,93,15)
				A(FF,41,90,14)A(FF,73,B7,0A)A(FF,54,99,0B)A(FF,38,7D,0B)A(FF,44,81,09)A(FF,5A,8D,0A)A(FF,7C,9F,09)A(FF,7A,9E,09)A(FF,49,84,09)A(FF,2F,76,0A)A(FF,31,78,0A)A(FF,31,77,0A)A(8D,32,79,0A)A(6C,61,A3,14)A(FF,53,9B,15)A(FF,41,92,16)A(FF,46,94,14)A(FF,84,BC,0B)A(FF,97,C9,0C)A(FF,68,A8,12)A(FF,4D,96,17)A(FF,41,91,17)A(FF,43,93,16)A(FF,47,93,14)A(FF,75,B7,0A)A(FF,58,9B,0C)A(FF,38,81,0E)A(FF,2E,78,0A)A(FF,2D,76,0A)A(FF,3F,7E,0A)A(FF,72,9A,09)A(FF,7E,A1,09)A(FF,43,7E,0A)A(FF,2A,6A,09)A(EF,2D,6B,09)A(33,30,73,0A)A(10,54,9D,14)A(C4,47,95,16)A(FF,3F,90,17)A(FF,6E,B0,0F)A(FF,9A,C9,0A)A(FF,67,A6,13)A(FF,4F,97,16)A(FF,4F,97,16)A(FF,46,94,16)A(FF,45,94,16)A(FF,49,96,15)A(FF,76,B9,0B)A(FF,58,9C,0B)A(FF,3B,82,0E)A(FF,36,7D,0C)A(FF,32,78,0A)A(FF,2F,76,0A)A(FF,3A,7C,0A)A(FF,79,9F,09)A(FF,6B,92,09)A(FF,28,5D,07)A(8E,24,5B,07)A(00,28,61,08)A(00,46,94,16)A(35,3E,90,17)A(D9,48,98,15)A(F0,90,C6,0A)A(FF,83,BA,0E)A(FF,5A,9F,15)A(FF,52,98,16)A(FF,53,9A,16)A(FF,49,96,15)A(FF,48,96,15)A(FF,4C,99,15)A(FF,78,BA,0C)A(FF,5B,9F,0D)A(FF,3F,87,0E)A(FF,3B,81,0C)A(FF,35,7B,0A)A(FF,35,7A,0A)A(FF,2F,77,0A)A(FF,51,89,0A)A(FF,84,A4,09)A(C7,3C,6B,07)
				A(0E,1C,52,07)A(00,1F,56,07)A(00,64,A3,10)A(00,5F,9F,11)A(33,6A,A9,0F)A(F7,9B,CD,08)A(FF,6E,AB,12)A(FF,63,A5,13)A(FF,58,9B,15)A(FF,55,99,15)A(FF,4C,97,15)A(FF,4A,97,15)A(FF,4E,98,14)A(FF,78,B9,0C)A(FF,5E,A5,0F)A(FF,44,8C,10)A(FF,3E,83,0D)A(FF,39,7C,0B)A(FF,36,7B,0A)A(FF,3A,7F,0A)A(FF,51,8D,09)A(FF,7D,A1,09)A(68,72,97,09)A(00,47,74,08)A(00,48,74,08)A(00,90,B9,08)A(00,90,B8,08)A(2D,91,BC,08)A(FD,96,CA,09)A(FF,79,B5,0E)A(FF,7B,B8,0F)A(FF,7E,B9,0D)A(FF,80,BB,0D)A(FF,7E,BD,0C)A(FF,7D,BE,0B)A(FF,7D,BD,0B)A(FF,88,C5,09)A(FF,81,BE,0A)A(FF,78,B7,0A)A(FF,75,B2,09)A(FF,6F,AA,08)A(FF,68,A5,08)A(FF,65,A1,08)A(FF,5C,96,08)A(FF,74,9B,09)A(68,83,A3,09)A(00,86,A6,09)A(00,86,A6,09)A(00,8A,B6,09)A(00,8A,B5,09)A(26,8C,BA,09)A(F0,97,CB,09)A(FF,75,B1,10)A(FF,6D,AC,12)A(FF,71,B0,10)A(FF,73,B1,10)A(FF,70,B2,0F)A(FF,6D,B1,0F)A(FF,72,B4,0E)A(FF,7E,BC,0B)A(FF,6F,B1,0D)A(FF,67,A8,0C)A(FF,65,A6,0C)A(FF,5F,9E,09)A(FF,58,97,08)A(FF,52,91,09)A(FF,55,91,09)A(FF,77,9D,09)A(58,80,A1,09)A(00,7E,A0,09)A(00,7E,A0,09)A(00,91,C2,09)A(00,91,C2,09)A(18,92,C3,09)A(D7,97,CB,09)A(FF,71,AE,11)A(FF,62,A4,13)A(FF,58,9C,15)A(FF,56,9A,15)A(FF,52,9A,15);
				memcpy ((EIF_NATURAL_32 *)$a_ptr + $a_offset, &l_data, sizeof l_data - 1);
			}
			}"
		end

	c_colors_1 (a_ptr: POINTER; a_offset: INTEGER)
			-- Fill `a_ptr' with colors data from `a_offset'.
		external
			"C inline"
		alias
			"{
			{
				#define B(q) \
					#q
				#ifdef EIF_WINDOWS
				#define A(a,r,g,b) \
					B(\x##b\x##g\x##r\x##a)
				#else
				#define A(a,r,g,b) \
					B(\x##r\x##g\x##b\x##a)
				#endif
				char l_data[] = 
				A(FF,4C,98,14)A(FF,53,9D,14)A(FF,78,B8,0C)A(FF,5E,A3,0F)A(FF,45,8D,11)A(FF,43,8B,10)A(FF,3B,80,0B)A(FF,36,7A,0A)A(FF,3A,7F,0A)A(FF,52,8F,09)A(FF,7E,A1,09)A(3A,83,A9,09)A(00,84,AB,09)A(00,84,AB,09)A(00,96,CA,09)A(00,96,CA,09)A(02,96,CA,09)A(AD,97,CA,09)A(FF,80,B8,0E)A(FF,5D,9F,14)A(FF,53,99,15)A(FF,55,9A,15)A(FF,53,9A,15)A(FF,4C,98,15)A(FF,4D,99,14)A(FF,73,B5,0C)A(FF,5C,A1,0F)A(FF,43,8C,11)A(FF,41,8A,11)A(FF,38,7E,0C)A(FF,35,79,0A)A(FF,31,78,0A)A(FF,4D,87,0A)A(E7,82,A2,09)A(21,85,AB,09)A(00,86,AE,09)A(00,86,AD,09)A(00,98,CB,09)A(00,98,CB,09)A(00,98,CB,09)A(74,99,CC,09)A(FF,8F,C1,0C)A(FF,5A,9E,15)A(FF,52,98,16)A(FF,53,99,16)A(FF,54,9A,15)A(FF,4E,99,15)A(FF,4B,98,15)A(FF,72,B3,0B)A(FF,5A,A0,0E)A(FF,41,8B,11)A(FF,3E,89,11)A(FF,36,7C,0B)A(FF,33,78,0A)A(FF,30,77,0A)A(FF,63,92,0A)A(AE,84,A4,09)A(03,82,A3,09)A(00,82,A3,09)A(00,82,A3,09)A(00,60,A5,13)A(00,60,A5,13)A(00,5A,A1,14)A(3A,72,B2,0E)A(F0,97,C7,0A)A(FF,72,AD,10)A(FF,5F,A0,13)A(FF,5E,A0,13)A(FF,5E,A1,14)A(FF,5B,9F,13)A(FF,5B,A1,11)A(FF,75,B2,0B)A(FF,5B,A0,0E)A(FF,47,91,11)A(FF,43,8B,0F)A(FF,3B,7F,0B)A(FF,37,7C,0A)A(FF,3F,80,0A)A(FF,7E,A2,09)A(69,5D,87,08)
				A(00,32,66,07)A(00,37,6A,07)A(00,37,6A,07)A(00,52,9B,16)A(00,52,9B,16)A(0D,52,9B,16)A(A6,50,99,15)A(FF,81,BB,0D)A(FF,8C,C1,0C)A(FF,6A,A8,11)A(FF,6A,A8,11)A(FF,6A,A7,10)A(FF,6A,A6,0F)A(FF,6A,A9,0D)A(FF,74,B0,0A)A(FF,63,A4,0D)A(FF,53,9A,10)A(FF,49,8E,0D)A(FF,42,84,09)A(FF,3E,83,09)A(FF,65,97,09)A(FF,79,9C,09)A(90,33,68,07)A(04,23,5C,07)A(00,25,5E,07)A(00,25,5E,07)A(00,5B,A0,14)A(00,5B,A0,14)A(59,5C,A0,14)A(FF,5E,A1,14)A(FF,66,A8,12)A(FF,93,C8,0A)A(FF,72,AE,11)A(FF,4E,94,16)A(FF,50,95,14)A(FF,51,96,14)A(FF,53,97,13)A(FF,70,AC,0B)A(FF,5C,A0,0F)A(FF,43,8E,13)A(FF,37,7F,0D)A(FF,2D,75,0A)A(FF,43,81,0A)A(FF,7D,A1,09)A(FF,4D,7D,08)A(FF,23,5B,07)A(4E,29,62,08)A(00,29,62,08)A(00,29,62,08)A(00,5E,A1,14)A(00,5E,A1,14)A(64,5E,A1,14)A(FF,5F,A2,14)A(FF,59,9F,14)A(FF,6D,AC,0E)A(FF,96,C8,0A)A(FF,69,A4,11)A(FF,4D,93,15)A(FF,51,96,14)A(FF,54,97,13)A(FF,70,AA,0B)A(FF,56,99,0D)A(FF,39,82,0E)A(FF,30,78,0B)A(FF,40,7F,0A)A(FF,79,9E,09)A(FF,69,96,0A)A(FF,30,71,0A)A(FF,2A,66,08)A(5D,2B,66,08)A(00,2B,66,08)A(00,2B,66,08)A(00,52,9B,15)A(00,52,9B,15)A(5B,53,9C,15)A(FF,5A,9F,15)A(FF,51,99,15)A(FF,3A,81,0D)A(FF,69,A5,09)A(FF,91,BE,0B)
				A(FF,68,9A,0F)A(FF,4D,90,12)A(FF,4D,90,11)A(FF,6E,A6,0B)A(FF,4F,8F,0B)A(FF,33,79,0B)A(FF,4E,87,0A)A(FF,7A,9E,09)A(FF,6F,99,09)A(FF,3F,86,0F)A(FF,3E,89,12)A(FF,39,80,0F)A(48,30,72,09)A(00,30,71,09)A(00,30,71,09)A(00,44,94,16)A(00,44,94,16)A(4B,45,94,16)A(FF,48,96,16)A(FF,42,8F,14)A(FF,31,79,0C)A(D2,35,7B,0A)A(79,8A,BF,09)A(F0,8A,AF,09)A(FF,72,9A,0A)A(FF,5B,90,0C)A(FF,71,A2,0A)A(FF,5C,92,0A)A(FF,68,93,09)A(F8,83,A2,09)A(B1,78,9C,08)A(F0,3C,81,0C)A(FF,41,8E,14)A(FF,45,91,15)A(FF,42,8D,14)A(2F,38,7F,0E)A(00,36,7B,0D)A(00,36,7C,0D)A(00,43,93,16)A(00,43,93,16)A(32,43,93,16)A(FF,43,94,16)A(FF,3F,8D,13)A(FF,33,7A,0B)A(82,2F,75,0A)A(00,6A,A7,0A)A(36,93,BF,09)A(BE,82,A3,09)A(FF,83,A4,09)A(FF,83,A4,09)A(FF,86,AA,09)A(F7,83,AE,09)A(59,8F,B7,09)A(06,67,99,0B)A(C2,45,8D,10)A(FF,46,93,14)A(FF,42,8D,14)A(DB,3E,88,12)A(1A,3E,86,11)A(00,3E,87,11)A(00,3E,87,11)A(00,43,93,16)A(00,43,93,16)A(14,43,93,16)A(CE,43,94,16)A(FF,40,8E,14)A(FF,34,7C,0C)A(8D,2C,73,0A)A(00,48,8B,0A)A(00,94,BD,09)A(00,76,9F,09)A(95,3C,83,0C)A(FF,46,8C,10)A(FF,3A,7F,09)A(8E,43,88,08)A(00,78,B3,0C)A(02,59,9D,13)A(CF,5A,9E,14)A(FF,45,8D,12)A(FF,38,82,0F)
				A(A0,35,7B,0C)A(00,34,7A,0B)A(00,34,7A,0B)A(00,34,7A,0B)A(00,43,93,16)A(00,43,93,16)A(00,43,93,16)A(65,43,93,16)A(FF,43,92,16)A(FF,37,80,0D)A(BB,32,77,0A)A(00,2D,75,0A)A(00,4F,8B,09)A(00,54,8E,09)A(3D,2C,76,09)A(F5,37,84,0F)A(FF,2F,78,09)A(3C,2C,75,08)A(00,3C,83,0C)A(0F,5A,9D,13)A(F1,47,8D,0F)A(FF,35,7A,0B)A(EE,32,76,0A)A(35,31,77,0A)A(00,32,78,0A)A(00,32,78,0A)A(00,32,78,0A)A(00,43,93,16)A(00,43,93,16)A(00,43,93,16)A(00,43,93,16)A(52,44,94,16)A(A4,3D,89,12)A(54,32,79,0A)A(00,32,78,0A)A(00,2D,76,09)A(00,2C,76,09)A(45,32,7A,0A)A(FF,3A,86,10)A(D0,31,79,09)A(14,2F,77,08)A(00,3D,83,0C)A(05,53,97,11)A(79,36,7C,0B)A(9B,31,76,0A)A(37,31,77,0A)A(00,31,77,0A)A(00,31,77,0A)A(00,31,77,0A)A(00,31,77,0A)A(00,43,93,16)A(00,43,93,16)A(00,43,93,16)A(00,43,93,16)A(00,43,94,16)A(00,3D,8A,12)A(00,33,79,0B)A(00,32,77,0A)A(00,31,79,09)A(02,30,78,09)A(AF,38,84,0F)A(FF,39,84,0F)A(86,31,78,09)A(00,2F,77,08)A(00,3E,84,0C)A(00,55,98,12)A(00,36,7C,0B)A(00,31,77,0A)A(00,31,77,0A)A(00,31,77,0A)A(00,31,77,0A)A(00,31,77,0A)A(00,31,77,0A)A(00,43,93,16)A(00,43,93,16)A(00,43,93,16)A(00,43,93,16)A(00,43,94,16)A(00,3D,8A,12)A(00,33,79,0A)
				A(00,31,79,09)A(00,30,78,09)A(40,33,7C,0B)A(FF,3D,89,11)A(CE,32,7B,0A)A(1A,31,78,09)A(00,30,78,09)A(00,33,7B,09)A(00,4B,90,0F)A(00,38,7D,0C)A(00,31,77,0A)A(00,31,77,0A)A(00,31,77,0A)A(00,31,77,0A)A(00,31,77,0A)A(00,31,77,0A);
				memcpy ((EIF_NATURAL_32 *)$a_ptr + $a_offset, &l_data, sizeof l_data - 1);
			}
			}"
		end

	build_colors (a_ptr: POINTER)
			-- Build `colors'.
		do
			c_colors_0 (a_ptr, 0)
			c_colors_1 (a_ptr, 400)
		end

feature {NONE} -- Image data filling.

	fill_memory
			-- Fill image data into memory.
		local
			l_pointer: POINTER
		do
			if attached {EV_PIXEL_BUFFER_IMP} implementation as l_imp then
				l_pointer := l_imp.data_ptr
				if not l_pointer.is_default_pointer then
					build_colors (l_pointer)
					l_imp.unlock
				end
			end
		end

end -- TURTLE32
