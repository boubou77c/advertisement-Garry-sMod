-- ad-- advert.lua
if SERVER then
  util.AddNetworkString("RP_Advert")


  local function Advert(ply, text)
    --Check if the first 3 letters == /adv (command)
    if string.sub(text, 1, 4) == "/adv" then
      if not ply:IsAdmin() then
        ply:CharPrint("You can't use this command.")
        return ""
      end
      --Get the content]
      local args = string.sub(text, 5)
      --If he doesn't enter a content -> Explain how the command works
      if not args or args == "" then
        ply:ChatPrint("Usage: /advert <message>")
        return ""
      end

      local advertMessage =args
      
      net.Start("RP_Advert")
      --Send the message to the client
      net.WriteString(advertMessage)
      
      --BroadCast the advert for all player
      net.Broadcast()

      return ""
    end
  end

  --Hook to get what the player write
  hook.Add("PlayerSay", "AdvertCommand", Advert)


end
