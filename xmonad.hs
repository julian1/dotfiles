

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

import XMonad.Util.SpawnOnce

myterminal :: String
-- myterminal = "xterm -fa 'DejaVu Sans Mono' -fs 10" -- desktop
myterminal = "xterm -fa 'DejaVu Sans Mono' -fs 15"

myLogHook dest = dynamicLogWithPP defaultPP { ppOutput = hPutStrLn dest
,ppVisible = wrap "(" ")"
} 

main = do
xmproc <- spawnPipe "/usr/bin/xmobar /home/meteo/.xmobarrc"
xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig

		, logHook = myLogHook xmproc 

		, terminal = myterminal 

		-- , startupHook = spawnOnce "/usr/bin/xmobar /home/meteo/.xmobarrc"

        } 
		`additionalKeys`
        [ ((mod1Mask ,  xK_z), spawn "xtrlock -b")
        ]


