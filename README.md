# Gesture Recognizer Godot

![Addon front page.](/pictures/1.1portada.png)

## Whats is?
  Gesture recognizer is a godot addon, this addon allows you make and recognize gestures
  It's based on [$Q Super-Quick Recognizer](http://depts.washington.edu/acelab/proj/dollar/qdollar.html).

## How to use?
  Add the `Gesture` node to the scene, this node requires a `CollisionShape2D` as child.

  ![Node in selector node.](/pictures/2.1Node.png)

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

   ![Classify buttom from inspector.](/pictures/2.2.1ButtonForClassify.png)
    
### Create Gesture
  First you must activate Create Gesture on te inspector in the `Gesture` node.

  ![Create gesture from inspector.](/pictures/2.3.1CreateGesture.png)

  Run the scene and draw youy gesture, when you end your gesture, you have to classify with the same ways the Classify Gesture or click on create button.

  ![Classify buttom from run game.](/pictures/2.3.2CreateButton.png)

  And then set name to gesture and save them.

  ![Classify buttom from run game.](/pictures/2.3.2SaveGesture.png)


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

## Signals
  - **gesture_name(gestureName : StringName)**: When the classified ends, this signal returns the gesture name.
  - **line_disappear(points : Array)**: Just before the line has been erased, return an array with the line points.
  - **on_draw_enter()**: When you start to draw the line.
  - **on_draw_exit()**: When you finish the current line.

## Fuctions
  - **Classify()**: When you draw a gesture, call this fiction to classify them.
  - **isDrawing()**: Check if you are drawing, bool.

## Installation
### Asset Library
  - In Godot, open the AssetLib tab.
  - Search for and select "Gesture Recognizer".
  - Download then install the plugin (be sure to only select the gesture_recognizer directory).
  - Enable the plugin inside Project/Project Settings/Plugins.


### Github Releases
  - Download a [release build](https://github.com/Little-Fish-hub/Gesture-Recognizer-Godot/releases).
  - Extract the zip file and move the addons/gesture_recognizer directory into the project root location.
  - Enable the plugin inside Project/Project Settings/Plugins.

## Contribution
You can report bugs and request features [Here](https://docs.google.com/forms/d/e/1FAIpQLSeUo-z8ntYPC9lA2XKznybW1dPt7ZbBvssEAo7JZpW-oBeRAw/viewform?usp=sf_link)

## Credits
  - [Godot](https://godotengine.org/) for their great engine and beautiful community.
  - [$Q Super-Quick Recognizer](http://depts.washington.edu/acelab/proj/dollar/qdollar.html) for being the source of this addon.



[BSD License](https://github.com/Little-Fish-hub/Gesture-Recognizer-Godot/blob/main/LICENSE.md)