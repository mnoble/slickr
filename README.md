# Welcome to Slickr

Slickr is a JRuby, Slick2D, project framework.

Slickr tries to merge concepts from Entity-Component and good old
fashion Object Oriented Design. Ruby gives you a lot of power to
write great code and Slickr tries to help you do that, while developing
games.

"Slick2D is an easy to use set of tools and utilities wrapped around
LWJGL OpenGL bindings to make 2D Java game development easier." &mdash;
[http://www.slick2d.org/wiki/index.php/Main_Page](http://www.slick2d.org/wiki/index.php/Main_Page)

## Getting Started

1\. Install Slickr

```
$ gem install slickr
```

2\. Create a new Slickr game

```
$ slickr new my_game
```

where "my_game" is the name of the game.

3\. Change directory to `my_game` and play it

```
$ cd my_game
$ rake play
```

You should see a Window with nothing but a white background and some FPS
information.

## Generating New Code

```
$ slickr generate [component|entity|renderer|system] NAME
```

## Project Structure

    ├── Rakefile
    ├── assets/
    ├── java/
    │   ├── jinput.jar
    │   ├── lwjgl.jar
    │   └── slick.jar
    ├── lib/
    │   ├── components/
    │   ├── components.rb
    │   ├── engine.rb
    │   ├── entities/
    │   ├── entities.rb
    │   ├── renderers/
    │   ├── renderers.rb
    │   ├── systems/
    │   └── systems.rb
    ├── libjinput-osx.jnilib
    ├── liblwjgl.jnilib
    └── openal.dylib

**assets/**<br/>
Images, sounds, videos, etc.

**java/**<br/>
Slick2D framework jars.

**lib/components/**<br/>
Behaviors that entities will include.

**lib/entities/**<br/>
The actual objects that live your game's world.

**lib/renderers/**<br/>
Draws the current state of entities to the screen.

**lib/systems/**<br/>
Systems react to changes in the world and update entitites accordingly.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
