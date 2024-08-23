# Gesture Recognizer Godot

![Addon front page.](/pictures/1.1portada.png)

## Whats is?
  Gesture recognizer is a godot addon, this addon allows you make and recognize gestures
  It's based on [$Q Super-Quick Recognizer]([https://pages.github.com/](http://depts.washington.edu/acelab/proj/dollar/qdollar.html)).

## How to use?
  Add the gesture node to the scene, this node requires a collision shape 2D as child.

  (Add image of node)
### Classify Gesture
  When you have been draw a gesture, you can classify for three differents ways:

  - Call to classify() fuction:
    ```
    func test():
      Gesture.classify()
    ```
    
  - Make true the property Classify Gesture:
    ```
    func test():
      Gesture.ClassifyGesture = true
    ```
    
  - Assign a classify button from inspector.
    

## Properties
### Line

  - **Cap Mode**: Round the begins and ends of the lines (Gif rounds ends line).
  - **Min Length Line**: Length minimum for valid line, if length line is minus than this valor, the line will be erased (Gif making lines).
  - **Line Width**: Width the line.
  - **Smooth**: Smoothing of the line stroke.
  - **Line Color**: Color that the line will have.
  - **Width Curve**: Makes there are different thicknesses along the line.

### Outline
  - **Outline**: Add a outline at the line.
  - **Outline Width**: Width the outline.
  - **Outline Color**: Color that the outline will have.
  - **Line Cover Line**: Makes each new line lie on top of the previous lines, only works if outline is true.

### Create Gesture
  - **Create Gesture**: The Gestures that you draw will be saved.

    You can save multiple gestures with the same name.

### Settings
  - **Touch**: Use the touch screen for drawing.
  - **Custom Button**: Use a custom input for drawing.
  - **Custom Buttom UI**: If Custom Button is active, you should put here the ui of the input to use.

    If touch or Custom Button are not active by default the mouse will be used.

### Classify Gesture
  - **Button For Classify**: Use a custom input for classify the gesture.
  - **Button For Classify UI**: If Button For Classify is active, you should put here the ui of the input to use.