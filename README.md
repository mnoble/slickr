# slickr

JRuby Slick2D project generators.

## Overview

The project Slickr sets up is an attempt to merge concepts from
Entity-Component and just plain old OOP best practices. Ruby gives you 
a lot of power to write great code and Slickr tries to set you up to do 
that well.

Keep things simple. Components should have no knowledge of the Entities
that will implement them; Systems should not care about what type of
Entity they're acting on. Basically, watch or read anything Sandi Metz
says and follow it.

## Project Structure

    ├── Rakefile
    ├── assets/
    ├── java/
    │   ├── jinput.jar
    │   ├── lwjgl.jar
    │   └── slick.jar
    ├── lib
    │   ├── components
    │   ├── components.rb
    │   ├── engine.rb
    │   ├── entities
    │   ├── entities.rb
    │   ├── renderers
    │   ├── renderers.rb
    │   ├── systems
    │   └── systems.rb
    ├── libjinput-osx.jnilib
    ├── liblwjgl.jnilib
    └── openal.dylib

### assets

Images, sounds, videos, etc.

### java

Slick2D framework jars.

### lib

Your game code.

### lib/components

Behaviors that entities will include. These are modules that implement
whatever behavior the entity should have. A common example will be a
`Spatial` component that implements `x` and `y` position and movement.

### lib/entities

The actual objects that live your game's world. Entities will implement
Components and Systems conduct Entities. These will be your Heros,
Enemies, Bosses, etc.

### lib/renderers

Draws the current state of entities to the screen.

### lib/systems

Systems react to changes in the world and update entitites accordingly.
View these as controllers of sorts. A good example of this is an `Input`
system. It would react to keyboard events and tell the appropriate
entities where to move.

## Installation

    $ gem install slickr

## Usage

    $ slickr new PROJECT_NAME

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
