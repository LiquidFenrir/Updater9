local white = Color.new(255,255,255)
local url = "http://d0k3.secretalgorithm.com/latest/"
local config_path = "/homebrew/Updater9/"
local config = dofile(config_path.."config.cfg")
local payloads = config["payloads"]
local path = config["path"]
local y = 5

function append(str)
	Screen.refresh()
	Screen.debugPrint(5, y, str, white, TOP_SCREEN)
	Screen.refresh()
	y = y + 15
end

function Credits()
	Screen.refresh()
	Screen.clear(BOTTOM_SCREEN)
	Screen.debugPrint(5,5,"Thanks to:", white, BOTTOM_SCREEN)
	Screen.debugPrint(5,20,"Shadowhand for the nightlies", white, BOTTOM_SCREEN)
	Screen.debugPrint(5,35,"d0k3 for the apps", white, BOTTOM_SCREEN)
	Screen.debugPrint(5,50,"Rinnegatamante for lpp-3ds", white, BOTTOM_SCREEN)
	Screen.refresh()
end

function editConfig()

end

function update(payload)
	y = 5
	Screen.refresh()
	Screen.clear(TOP_SCREEN)
	Screen.refresh()
	
	local zip_path = "/"..payload..".zip"
	append("Downloading "..payload.."...")
	Network.downloadFile(url..payload, zip_path)
	append("Done!")
	
	if payload == "CTRXplorer" or payload == "A9NC" then
		--to be installed
		local cia_path = "/"..payload..".cia"
		local elf_path = "/"..payload..".elf"
		local GW_path = "/"..payload..".3ds"
		
		append("Deleting older "..payload.."...")
		System.deleteDirectory("/3ds/"..payload.."/")
		append("Done!")
		append("Extracting zip...")
		System.extractZIP(zip_path, "/")
		append("Done!")
		append("Installing cia...")
		System.installCIA(cia_path, SDMC)
		append("Done!")
		
		append("Deleting files...")
		System.deleteFile(elf_path)
		System.deleteFile(cia_path)
		System.deleteFile(GW_path)
		append("Done!")
	else
		--a9lh payload
		local bin_name = payload..".bin"
		append("Deleting older "..bin_name.."...")
		System.deleteFile(path..bin_name)
		append("Done!")
		append("Extracting "..bin_name.." from zip...")
		System.extractFromZIP(zip_path, bin_name, path..bin_name)
		append("Done!")
	end
	
	append("Deleting zip...")
	System.deleteFile(zip_path)
	append("Done!")
end

function main()
	Screen.refresh()
	Screen.clear(TOP_SCREEN)
	append("Press A to update the apps")
	append("Press X to edit the config")
	append("Press START to quit")
	Credits()
	y = 5
	while true do
		pad = Controls.read()
		if Controls.check(pad, KEY_START) then
			Screen.waitVblankStart()
			Screen.flip()
			System.exit()
		elseif Controls.check(pad, KEY_A) then
			if Network.isWifiEnabled() then
				for i =1,#payloads,1 do
					local payload = payloads[i]
					update(payload)
					local wait = Timer.new()
					Timer.reset(wait)
					append("Waiting for :")
					append(config["wait"].."ms before continuing...")
					while true do
						if Timer.getTime(wait) > config["wait"] then break end
					end
					Timer.destroy(wait)
				end
				y = 5
				Screen.refresh()
				Screen.clear(TOP_SCREEN)
				append("All your payloads have been updated!")
				append("Press START to quit")
				while true do
					pad = Controls.read()
					if Controls.check(pad, KEY_START) then
						Screen.waitVblankStart()
						Screen.flip()
						System.exit()
					end
				end
			else
				Screen.refresh()
				Screen.clear(TOP_SCREEN)
				append("Wi-Fi is not enabled!")
				append("please turn it on and retry!")
				append("Press START to quit")
				while true do
					pad = Controls.read()
					if Controls.check(pad, KEY_START) then
						Screen.waitVblankStart()
						Screen.flip()
						System.exit()
					end
				end
			end
		elseif Controls.check(pad, KEY_X) then
			editConfig()
		end
	end
end

main()