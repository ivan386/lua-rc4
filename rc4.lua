
function rc4(key, data)
	-- lua 5.3.4
	
	local j, s = 0, {}
	for i = 0, 255 do
		j = 255 & j + (s[i] or i) + key:byte(i % #key + 1)
		s[i], s[j] = (s[j] or j), (s[i] or i)
	end
	
	local j, i, out = 0, 0, {}
	for p = 1, #data do
		i = 255 & p
		j = 255 & j + s[i]
		s[i], s[j] = s[j], s[i]
		table.insert(out, data:byte(p) ~ s[255 & s[i] + s[j]])
	end
	
	return string.char(table.unpack(out))
end