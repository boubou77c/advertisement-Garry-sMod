if CLIENT then

  --Load the material
  local backgroundAdv = Material("materials/adv/advert.png")

  --Function to create the panel
  local function CreatePanel(advertMessage)
      

      local panel = vgui.Create("DPanel")
      panel:SetBackgroundColor(Color(255, 100, 100, 0)) -- Make the panel transparent

      -- Add the background
      local image = vgui.Create("DImage", panel)
      image:SetPos(0, 0)
      image:SetImage("materials/adv/advert.png") -- Path to the background


      -- Add the text on the background
      local label = vgui.Create("DLabel", image)
      --Message to show
      label:SetText(advertMessage)
      --Font used (you can change)
      label:SetFont("DermaLarge")
      --Text color (you can change)
      label:SetColor(Color(255, 255, 255)) 

      label:SizeToContents()

      --calculate the text size + Info size / width / height...
      local textW,textH = label:GetSize()

      local padding = 20
      local bgW = textW+padding*2
      local bgH = 100
      local scrW = ScrW()
      local scrH = ScrH()

      --Set the position and the size of the panel / bg
      panel:SetPos((scrW-bgW) /2,30)
      image:SetSize(bgW ,bgH)
      panel:SetSize(bgW,bgH)

      label:Center()

      --Timer before the panel closes (10 sec)
      timer.Simple(10, function()
          if IsValid(panel) then
            --Remove the panel
              panel:Remove()
          end
      end)
  end

  -- Receiving the server message
  net.Receive("RP_Advert", function()
      -- Read the message by the serv
      local advertMessage = net.ReadString()

      -- Call the function and create the panel
      CreatePanel(advertMessage)
  end)
end