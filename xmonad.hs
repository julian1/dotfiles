-- deployed by ansible!

-- {-# OPTIONS_GHC -Wno-deprecations #-}

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

import XMonad.Util.SpawnOnce

-- intellij
import XMonad.Hooks.SetWMName


import qualified XMonad.StackSet as W

-- use xev app to get keycodes
-- https://stackoverflow.com/questions/27742421/how-can-i-have-more-than-9-workspaces-in-xmonad
-- https://hackage.haskell.org/package/xmonad-0.15/docs/doc-index-X.html

-- note. premapped modbar/xmonad keys   alt-p xmobar launch menu. and alt-t is to cycle focus. and alt-q is restart xmonad, alt-tab cycle window.
-- test by , cp ~/devel/dotfiles/xmonad.hs  /home/me/.xmonad/xmonad.hs  -i
-- and then alt-q to restart

myExtraWorkspaces = [ (xK_grave , "backtick"), (xK_0, "0"),(xK_minus, "-"),(xK_equal, "+"), (xK_BackSpace, "backspace") ]
                  ++ [ (xK_backslash, "\\"), (xK_bracketright, "]"), (xK_bracketleft, "["), (0x6f , "o"), (0x69 , "i"), (0x75, "u"), (0x79, "y"), (0x72, "r"), (0x65, "e"), (0x77, "w") ]


-- myWorkspaces =  (map snd myExtraLeft ) ++  ["1","2","3","4","5","6","7","8","9"] ++ (map snd myExtraWorkspaces) -- doesn't work
myWorkspaces =  ["1","2","3","4","5","6","7","8","9"]
                ++ (map snd myExtraWorkspaces)



mykeys = [
          -- ((mod1Mask ,  xK_z), spawn "xtrlock -b")
          ((mod1Mask ,  xK_z), spawn "sleep 0.2; xtrlock"),
          ((mod1Mask ,  xK_a), spawn "sleep 0.2; scrot -s ~/output.png")

          ] ++ [ ((mod1Mask, key), (windows $ W.greedyView ws)) | (key,ws) <- myExtraWorkspaces  ]

          -- JA this is needed - since shift is used to move app from window to a diferent winidow
          ++ [ ((mod1Mask .|. shiftMask, key), (windows $ W.shift ws)) | (key,ws) <- myExtraWorkspaces ]




-- myterminal = "xterm -fa 'DejaVu Sans Mono' -fs 10 -fg white -bg black"

-- 2018 GOOD
-- font and font size will inherit from .xinitrc,
-- but should be XTerm*faceName: DejaVu Sans Mono, XTerm*faceSize: 11   ! laptop
-- myterminal = "xterm  -fg white -bg black"
myterminal = "xterm"

-- 2024.  fontsize doesn't seem to be respected in Xresources
myterminal = "xterm -fa 'DejaVu Sans Mono' -fs 12"


-- THIS IS NEEDED for xmobar. 2023.
-- myLogHook dest = dynamicLogWithPP defaultPP {
myLogHook dest = dynamicLogWithPP def {
  ppOutput = hPutStrLn dest
  , ppVisible = wrap "(" ")"
}



{-
https://stackoverflow.com/questions/72925858/xmonad-warning-and-error-for-dockseventhook-following-last-update
https://wiki.archlinux.org/title/Xmonad

main=do
  xmonad $ docks def
    { ...
    , layoutHook=avoidStruts $ layoutHook def
    , manageHook=manageHook def <+> manageDocks
    , ...
    }

-}

main = do

  -- xmproc <- spawnPipe "/usr/bin/xmobar /home/meteo/.xmobarrc"
  -- xmonad should read ~/.xmobarrc by default, to avoid specify ~/
  xmproc <- spawnPipe "xmobar"

  xmonad $ docks
    def {

{-
        -- ells xmonad that you don't want your tiled windows to overlap xmobar.
        -- https://stackoverflow.com/questions/20446348/xmonad-toggle-fullscreen-xmobar#20448499
      -- manageHook = manageDocks <+> manageHook def
      manageHook = manageDocks <+> manageHook def
      ,

      layoutHook = avoidStruts $ layoutHook def

      -- https://github.com/xmonad/xmonad/issues/15
      , handleEventHook = do
              -- ewmhDesktopsEventHook
              docksEventHook
              -- fullscreenEventHook,
-}              -- docks

    layoutHook=avoidStruts $ layoutHook def
    , manageHook=manageHook def <+> manageDocks

     , logHook = myLogHook xmproc

     , workspaces = myWorkspaces

      -- green
      , focusedBorderColor =  "#009900"

      -- gray
      , normalBorderColor  =  "#666666"


      , terminal = myterminal


      -- intellij
      , startupHook = setWMName "LG3D"

      -- , startupHook = spawnOnce "/usr/bin/xmobar /home/meteo/.xmobarrc"

    }
      `additionalKeys`
          mykeys


