if CLIENT then
  local backgroundAdv = Material("materials/adv/advert.png")
  local CustomFont = "Custom_Font"
  
  -- Create a font
  surface.CreateFont("Custom_Font", {
      font = "Arial",
      size = 30, 
      weight = 500, 
      antialias = true,
      shadow = true,
    })

  local advertEndTime = 0
  net.Receive("RP_Advert", function()
      --Read the message sent by the server 
      local advertMessage = net.ReadString()

      --Advert time duration : 10 sec
      advertEndTime = CurTime() +10


      --Hook to draw the advert
      hook.Add("HUDPaint","drawAdvert",function()

          --Check if the time is finished
          if CurTime() > advertEndTime then
            --remove the hook
            hook.Remove("HUDPaint","drawAdvert")
            return 
          end

          --Get Info screenW /H , x,y...
          local scrW = ScrW()
          local scrH = ScrH()
          local bgW = 600
          local bgH = 100

          local x = (scrW-bgW) /2
          local y = 10

          --If the materials is True -> Draw it
          if backgroundAdv then
            --send the Advert
            surface.SetMaterial(backgroundAdv)
            surface.SetDrawColor(255, 255, 255, 255) 
            surface.DrawTexturedRect(x,y,bgW,bgH)
            --Draw the text : Setting -> Font, color (orange)
            draw.SimpleText(advertMessage,"Custom_Font",x+15,y+38,Color(255,165,0))

          end
        end)
    end)
end