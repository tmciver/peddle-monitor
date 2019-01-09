module Main where

import Brick
import Brick.Widgets.Center
import Brick.Widgets.Border
import Brick.Widgets.Border.Style

import Computer
import CPU
import Bus

draw :: Computer -> Widget ()
draw (Computer cpu _) = hLimit 30 $
                        vLimit 10 $
                        withBorderStyle unicode $
                        borderWithLabel (str "6502 CPU") $
                        (str $ "Reg A: " ++ (show (cpuRegA cpu))) <=>
                        (str $ "Reg X: " ++ (show (cpuRegX cpu))) <=>
                        (str $ "Reg Y: " ++ (show (cpuRegY cpu))) <=>
                        (str $ "Reg P: " ++ (show (cpuRegP cpu))) <=>
                        (str $ "stack pointer: " ++ (show (cpuStackPointer cpu))) <=>
                        (str $ "program counter: " ++ (show (cpuProgramCounter cpu)))

ui2 :: Widget ()
ui2 = (str "Hello," <=> str "World!" <=> vBorder)

main :: IO ()
main = do
  let comp = Computer initializedCPU empty
  simpleMain (draw comp)
