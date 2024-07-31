
# Garry's Mod 📢 Advertisement 📢

A simple command that advertises to all players.

## How it works ? 

To do an advertisement, you have to be minimum __Admin__.

-The command is : /adv <message>

-The default advertisement time duration is 10 secondes. 


## What can you change.

You can change many things as you wish :

Time duration : <u>line code cl_init :</u>

```Lua

--Timer before the panel closes (10 sec)
      timer.Simple(10, function()
          if IsValid(panel) then
            --Remove the panel
              panel:Remove()
          end
      end)
```

Import your own background :<u> cl_init.lua :</u>

You have to enter the new background into : _"Advertise\materials\adv\you_bg.png"_
```Lua
  local backgroundAdv = Material("materials/adv/advert.png") 
```

Change the text color and the font family : _cl__init.lua_
```Lua
      --Font used (you can change)
      label:SetFont("DermaLarge")
      --Text color (you can change)
      label:SetColor(Color(255, 255, 255)) 
```

## 📷 How it looks 

![App Screenshot]("picture/pic.png")


## 🚀 About Me

If you have any suggestion, you can write to me on my discord : 
