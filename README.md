# **T-Rex Runner Game on FPGA**

## **Contributors:**
- **Bilal Ahmed** 
- **Daniyal Shadab** 
- **Muhammad Hayyan Khan** 
- **Hassaan Rashid** 

## **Project Overview**

This repository contains the **T-Rex Runner game** built for **FPGA** (using **Verilog**), inspired by the classic Google Chrome **offline error page** game. Players control a T-Rex to jump over obstacles and avoid crashing into them. The game is built on the **Basys 3 FPGA** board and features a simple yet engaging game loop with interactive controls.

- The project is an **endless runner game** where the player controls a **T-Rex** to avoid incoming obstacles (cacti).
- The game is implemented using **Verilog** on the **Basys 3 FPGA board**.
- It uses a **Finite State Machine (FSM)** for the game logic and a **VGA display** for the visual output.

### **Key Features:**
- **FPGA-based implementation:** The game runs on the Basys 3 FPGA board using **Verilog** as the hardware description language.
- **Interactive Controls:** Players can control the T-Rex using the **spacebar** (for jumping) and **Enter key** (to reset the game) on the keyboard or FPGA buttons.
- **Graphics and Display:** Uses **VGA** output to display the game screen, and handles dynamic obstacles, jumping mechanics, and a scoring system.
- **Finite State Machine (FSM):** Manages different game states (Start, Run, End) and transitions between them based on player interaction and game events.

---

## **Gameplay:**
- **Start Screen:** The game begins with the start screen, showing the "Start" message.
- **Running State:** The T-Rex runs across the screen. The player must press the **spacebar** to make the T-Rex jump and avoid obstacles.
- **End Screen:** If the T-Rex collides with an obstacle (cactus), the game ends, displaying the "You Lose" message, and the score is finalized.

---

## **Technologies Used:**
- **Verilog HDL** for the hardware design and logic implementation.
- **Basys 3 FPGA board** for hardware acceleration.
- **VGA** output for rendering the game on a display.
- **Finite State Machine (FSM)** for handling game states and transitions.

---

## **System Components:**
1. **Input Block:**
   - Keyboard inputs or FPGA buttons control the game. The **spacebar** is used for jumping, and the **Enter key** resets the game.
2. **Control Block:**
   - Handles different game screens (Start, Running, and End) and manages the state transitions using an FSM.
3. **Output Block:**
   - Uses the **VGA** connector to output the game graphics, including the dinosaur and obstacles, with the horizontal and vertical counters managing the pixel generation.

---

## **Resources:**
- **VGA Connector** for game display (640 x 480 pixels).
- **Finite State Machine** to control game logic and transitions.

